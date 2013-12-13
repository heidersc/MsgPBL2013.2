package sisap

import org.springframework.dao.DataIntegrityViolationException
import wslite.soap.SOAPClient

class MensagemController {

    def mailService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def listEntradas(Integer max) {

        def destinatario  = Pessoa.read(session.idPessoa)

        def mensagens = MensagemDestinatario.withCriteria {

            order("id", "desc")

            eq("destinatario", destinatario)
        }

        render(view: 'listEntradas', model: [mensagemInstanceList: mensagens, mensagemInstanceTotal: mensagens.size()])
    }

    def listEnviadas(Integer max) {

        def remetente  = Pessoa.read(session.idPessoa)

        def mensagem = Mensagem.findAllByExcluidaAndRemetente(false, remetente)


        def mensagens = Mensagem.withCriteria {

            order("id", "desc")

            eq("excluida", false)
            eq("remetente", remetente)
        }

        [mensagemInstanceList: mensagens, mensagemInstanceTotal: mensagens.size()]
    }

    def createMensagem(){

        def pessoa  = Pessoa.read(session.idPessoa)

        if(pessoa.perfilId == 1){
            render (view: 'createAluno', model: [mensagemInstance: new Mensagem(params)])
            //render (view: 'createMensagem', model: [mensagemInstance: new Mensagem(params)])
            return
        }
        else{
            render (view: 'create', model: [mensagemInstance: new Mensagem(params)])
        }
    }

    def showEnviadas(Long id) {
        def mensagemDestinatario = Mensagem.get(id)

        println("Mensagem: "+ mensagemDestinatario)

        def mensagemDestinatarioVer = Mensagem.findByMensagemAndRemetente(mensagemDestinatario.mensagem, Pessoa.read(session.idPessoa))

        if (!mensagemDestinatarioVer) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'mensagem.label', default: 'Mensagem'), id])
            redirect(action: "listEnviadas")
            return
        }

        [mensagemInstance: mensagemDestinatarioVer]
    }

    def showEntradas(Long id) {

        println("Show ID: "+ id)

        def mensagemDestina = MensagemDestinatario.get(id)

        println("Show: "+ mensagemDestina)

        def mensagemVer = MensagemDestinatario.findByMensagemAndDestinatario(mensagemDestina.mensagem, Pessoa.read(session.idPessoa))

        def mensagemDestinatarioVer = MensagemDestinatario.findByRaizAndDestinatario(mensagemDestina.raiz, Pessoa.read(session.idPessoa))

        if(mensagemDestina && mensagemDestina?.id == mensagemVer?.id && mensagemDestina?.lida == false){
            mensagemDestina.lida = true
            mensagemDestina.save(flush: true)
        }

        if (!mensagemDestinatarioVer) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'mensagem.label', default: 'Mensagem'), id])
            redirect(action: "listEntradas")
            return
        }

        [mensagemInstance: mensagemDestinatarioVer.mensagem]
    }

    def save() {

        println("Mensagem: " + Mensagem.list().id.max())

        def mensagemInstance = new Mensagem(params)
        def remetente  = Pessoa.get(session.idPessoa)

        mensagemInstance.remetente = remetente
        mensagemInstance.dataMensagem = new Date()
        mensagemInstance.excluida = false
        mensagemInstance.setStatus(true)
        //O valor capturado com o select no g:select name="titulo" é o ID de mensagens pré-definidas
        def tituloMensagem                                                                  //Havendo a necessidade de buscar o titulo da mensagem e não o numero dela.
        tituloMensagem = MensagemPredefinida.findById(mensagemInstance.titulo)              //O resultado dessa busca é o titulo da mensagem.

        mensagemInstance.titulo = tituloMensagem.titulo

        println("Grupos: "+ mensagemInstance.grupos)

        def listAluno = []
        def professor
        def contador = 0



        mensagemInstance.grupos.each {
            def grupo = new Grupo()

            grupo.id = it.id
            grupo.alunos = it.alunos
            grupo.professor = it.professor

            //def grupos = Grupo.get(it)
            println("Grup:"+ grupo)
            def listGrupo = grupo.alunos.id

            println("LisGrup:"+ listGrupo)
            professor = grupo.professor.nome

            listGrupo.each{
                def pessoa = new Pessoa()
                pessoa = Pessoa.findById(it)
                mensagemInstance.emailDestinatario << Pessoa.findById(it).email
                mensagemInstance.destinatarios << Pessoa.findById(it)
                listAluno  << pessoa
                contador = contador + 1
            }
        }

        listAluno.add(contador, Pessoa.findByNome(professor))




        //mensagemInstance.emailDestinatario = listAluno.email
        //mensagemInstance.destinatarios = listAluno
        if (!mensagemInstance.save(flush: true)) {
            render(view: "create", model: [mensagemInstance: mensagemInstance])
            return
        }

        mensagemInstance.save(flush: true)
        def mensagemDestinatario
        mensagemDestinatario = new MensagemDestinatario()
        mensagemDestinatario.mensagem = mensagemInstance
        mensagemDestinatario.destinatario = listAluno
        mensagemDestinatario.lida = false
        mensagemDestinatario.setRaiz(mensagemInstance.id)
        mensagemDestinatario.save(flush: true)

        mailService.sendMail {
                multipart true
                to mensagemInstance.emailDestinatario
                subject mensagemInstance.titulo + " - " + mensagemInstance.remetente
                body mensagemInstance.mensagem
        }

        remetente.save(flush: true)

        flash.message = "Mensagem enviada com sucesso!"
        redirect(action: "showEnviadas", id: mensagemInstance.id)
    }

    def update(Long id, Long version) {
        def mensagemInstance = Mensagem.get(id)
        if (!mensagemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'mensagem.label', default: 'Mensagem'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (mensagemInstance.version > version) {
                mensagemInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'mensagem.label', default: 'Mensagem')] as Object[],
                        "Another user has updated this Mensagem while you were editing")
                render(view: "edit", model: [mensagemInstance: mensagemInstance])
                return
            }
        }

        mensagemInstance.properties = params

        if (!mensagemInstance.save(flush: true)) {
            render(view: "edit", model: [mensagemInstance: mensagemInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'mensagem.label', default: 'Mensagem'), mensagemInstance.id])
        redirect(action: "show", id: mensagemInstance.id)
    }

    def delete(Long id) {

        def mensagemInstance = Mensagem.findByIdAndRemetenteAndExcluida(id, Pessoa.read(session.idPessoa), false)

        if(mensagemInstance){
            mensagemInstance.excluida = true
            mensagemInstance.save(flush: true)
            flash.message = "Mensagem excluida com sucesso!"
            redirect(action: "listEnviadas")
            return
        }

        def mensagem = MensagemDestinatario.findByIdAndDestinatario(id, Pessoa.read(session.idPessoa))

        if (mensagem) {
            mensagem.delete(flush: true)
            flash.message = "Mensagem excluida com sucesso!"
            redirect(action: "listEntradas")
            return
        }
    }


    def ajaxPesquisaAlunos(Integer max){

        if (params.idDisciplina){
            def peridoDisciplina = PeriodoDisciplina.read(params.idDisciplina)

            render g.select(id: "box1View", name: "box1View", multiple: "multiple", class: "multiple", style: "height: 250px", from: peridoDisciplina.grupos, optionKey: "id", optionValue: "nome")
        }else{
            render g.select(id: "box1View", name: "box1View", multiple: "multiple", class: "multiple", style: "height: 250px", from: ['':''], optionKey: "key", optionValue: "value")
        }
    }

    def ajaxPesquisaGrupo(Integer max){
        def peridoDisciplina = PeriodoDisciplina.read(params.idDisciplina)

        if (params.idDisciplina){

            render peridoDisciplina.grupos.nome
        }else{
            render g.select(id: "box1View", name: "box1View", multiple: "multiple", class: "multiple", style: "height: 250px", from: ['':''], optionKey: "key", optionValue: "value")
        }
    }

    def ajaxResposta = {

        def mensagemOrginal = Mensagem.get(params.mensagemOrginal)
        def resposta  = new Mensagem()

        resposta.properties = mensagemOrginal.properties
        resposta.dataMensagem = new Date()
        resposta.remetente = Pessoa.read(session.idPessoa)
        resposta.mensagem = params.resposta
        resposta.titulo = "RES: " + mensagemOrginal.titulo
        resposta.destinatarios = mensagemOrginal.destinatarios

        mensagemOrginal.destinatarios.each {
            def pessoaTemp = it

            mailService.sendMail {
                to pessoaTemp.email
                subject "RES: " + mensagemOrginal.titulo
                body resposta.mensagem
            }

        }
        resposta.save(flush: true)

        resposta.destinatarios.each {
            def mensagemDestinatario = new MensagemDestinatario(destinatario: it, mensagem: resposta, lida: false, raiz: mensagemOrginal.id)
            mensagemDestinatario.save(flush: true)
        }

        mensagemOrginal.addToMensagens(resposta)
        mensagemOrginal.save(flush: true)

        render(template: 'templateResposta', model: [mensagemInstance: mensagemOrginal])
    }

    def ajaxTextArea = {
        def mensagem

        if (params.idMensagem){
            mensagem = MensagemPredefinida.get(params.idMensagem)
            render mensagem.mensagem
        }
    }



}