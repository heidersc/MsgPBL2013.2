package sisap

import org.springframework.dao.DataIntegrityViolationException
import wslite.soap.SOAPClient

class MensagemController {

     def mailService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def listEntradas() {
        redirect(action: "listEnviadas", params: params)
    }

    def listEnviadas(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        params.sort= "dataMensagem"
        params.order = "desc"
        [mensagemInstanceList: Mensagem.list(params), mensagemInstanceTotal: Mensagem.count()]
    }

    def create() {
        [mensagemInstance: new Mensagem(params)]
    }

    def show(Long id) {
        def mensagemInstance = Mensagem.get(id)
        if (!mensagemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'mensagem.label', default: 'Mensagem'), id])
            redirect(action: "list")
            return
        }

        [mensagemInstance: mensagemInstance]
    }

    def edit(Long id) {
        def mensagemInstance = Mensagem.get(id)
        if (!mensagemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'mensagem.label', default: 'Mensagem'), id])
            redirect(action: "list")
            return
        }

        [mensagemInstance: mensagemInstance]
    }

    def save() {
        def mensagemInstance = new Mensagem(params)

        mensagemInstance.remetente = Pessoa.read(session.idPessoa)
        mensagemInstance.dataMensagem = new Date()
        mensagemInstance.setStatus(true)

        def listAluno = []

        params.alunos.each {
            listAluno  << Pessoa.read(it)
        }

        mensagemInstance.emailDestinatario = listAluno.email
        mensagemInstance.destinatarios = listAluno

        println("Emails :" + mensagemInstance.emailDestinatario)


        if (!mensagemInstance.save(flush: true)) {
            render(view: "create", model: [mensagemInstance: mensagemInstance])
            return
        }

        println("Remetente :" + mensagemInstance.remetente)

         mailService.sendMail {
            to listAluno.email.toArray()
            subject mensagemInstance.titulo + " - " + mensagemInstance.remetente
            body mensagemInstance.mensagem
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'mensagem.label', default: 'Mensagem'), mensagemInstance.id])
        redirect(action: "listEnviadas", id: mensagemInstance.id)
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
        def mensagemInstance = Mensagem.get(id)
        if (!mensagemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'mensagem.label', default: 'Mensagem'), id])
            redirect(action: "listEnviadas")
            return
        }

        try {
            mensagemInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'mensagem.label', default: 'Mensagem'), id])
            redirect(action: "listEnviadas")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'mensagem.label', default: 'Mensagem'), id])
            redirect(action: "show", id: id)
        }
    }
    /*def ajaxPesquisaAlunos(Integer max){
        if (params.idCurso){
            def curso = Curso.read(params.idCurso)
            def alunos = Pessoa.findAllByCursoAndStatusAndPerfilId(curso, true, 1)
            render g.select(id: "box1View", name: "box1View", multiple: "multiple", class: "multiple", style: "height: 250px", from: alunos, optionKey: "id", optionValue: "nome")
        }else{
            render g.select(id: "box1View", name: "box1View", multiple: "multiple", class: "multiple", style: "height: 250px", from: ['':''], optionKey: "key", optionValue: "value")
        }

    }*/

    def ajaxPesquisaAlunos(Integer max){


        if (params.idDisciplina){
            def peridoDisciplina = PeriodoDisciplina.read(params.idDisciplina)


            render g.select(id: "box1View", name: "box1View", multiple: "multiple", class: "multiple", style: "height: 250px", from: peridoDisciplina.alunos, optionKey: "id", optionValue: "nome")
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

        resposta.destinatarios = mensagemOrginal.destinatarios

        mailService.sendMail {
            to resposta.destinatarios.email.toArray()
            subject "RES: " + mensagemOrginal.titulo
            body resposta.mensagem
        }
        resposta.save(flush: true)

        mensagemOrginal.addToMensagens(resposta)

        mensagemOrginal.save(flush: true)

        render(template: 'show', model: [mensagemInstance: mensagemOrginal])

    }

}