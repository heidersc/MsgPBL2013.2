package sisap

import br.edu.unime.util.Perfil
import org.springframework.dao.DataIntegrityViolationException


class PeriodoDisciplinaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [periodoDisciplinaInstanceList: PeriodoDisciplina.list(params), periodoDisciplinaInstanceTotal: PeriodoDisciplina.count()]
    }
    def ajaxPesquisaProfessor(Integer max){
        params.max = Math.min(max ?: 5, 100)
        def professores = Pessoa.withCriteria(max: params.max, offset: params.offset) {
            maxResults(params.max)
            firstResult(params.offset ? params.offset.toInteger() : 0)
            if (params.nome){
                ilike('nome', "%$params.nome%")
            }
            if (params.matricula){
                ilike('matricula', "%$params.matricula%")
            }
            if (params.email){
                ilike('email', "%$params.email%")
            }
            eq('perfilId', Perfil.getPerfilByNome("professor"))
        }
        def professoresTotal = Pessoa.createCriteria().count(){
            if (params.nome){
                ilike('nome', "%$params.nome%")
            }
            if (params.matricula){
                ilike('matricula', "%$params.matricula%")
            }
            if (params.email){
                ilike('email', "%$params.email%")
            }
            eq('perfilId', Perfil.getPerfilByNome("professor"))
        }

       render(template: 'listProfessores', model: [professores: professores, professoresTotal: professoresTotal])
    }
    def ajaxPesquisaAlunos(Integer max){
        if (params.idCurso){
            def curso = Curso.read(params.idCurso)
            def alunos = Pessoa.findAllByCursoAndStatus(curso, true)
            render g.select(id: "box1View", name: "box1View", multiple: "multiple", class: "multiple", style: "height: 250px", from: alunos, optionKey: "id", optionValue: "nome")
        }else{
            render g.select(id: "box1View", name: "box1View", multiple: "multiple", class: "multiple", style: "height: 250px", from: ['':''], optionKey: "key", optionValue: "value")
        }

    }
    def ajaxPesquisaDisciplina(Integer max){
        params.max = Math.min(max ?: 5, 100)
        def disciplinas = Disciplina.withCriteria(max: params.max, offset: params.offset) {
            maxResults(params.max)
            firstResult(params.offset ? params.offset.toInteger() : 0)
            if (params.nome){
                ilike('nome', "%$params.nome%")
            }
            if (params.codigo){
                ilike('codigo', "%$params.codigo%")
            }

        }
        def disciplinasTotal = Disciplina.createCriteria().count(){
            if (params.nome){
                ilike('nome', "%$params.nome%")
            }
            if (params.codigo){
                ilike('codigo', "%$params.codigo%")
            }

        }

        render(template: 'listDisciplina', model: [disciplinas: disciplinas, disciplinasTotal: disciplinasTotal])
    }
    def passo1(Integer max){

        params.max = Math.min(max ?: 5, 100)
        def professores = Pessoa.withCriteria(max: params.max, offset: params.offset) {
            maxResults(params.max)
            firstResult(params.offset ? params.offset.toInteger() : 0)
            if (params.nome){
                ilike('nome', "%$params.nome%")
            }
            if (params.matricula){
                ilike('matricula', "%$params.matricula%")
            }
            eq('perfilId', Perfil.getPerfilByNome("professor"))
        }
        def professoresTotal = Pessoa.createCriteria().count(){
            if (params.nome){
                ilike('nome', "%$params.nome%")
            }
            if (params.matricula){
                ilike('matricula', "%$params.matricula%")
            }
            eq('perfilId', Perfil.getPerfilByNome("professor"))
        }

        render(view:  'passo1', model: [professores: professores, professoresTotal: professoresTotal, matricula: params.matricula, nome: params.nome, email: params.email])
        return
    }


    def passo2 = {
//        render(view: 'passo2')
        return
    }

    def create() {
        [periodoDisciplinaInstance: new PeriodoDisciplina(params)]
    }

    def save() {
        println("Salvar!!")
        params['ano'] = params.periodo.toString().split("\\.")[0]
        params['semestre'] = params.periodo.toString().split("\\.")[1]


        def periodoDisciplinaInstance = new PeriodoDisciplina()

        def listId = []

        params.alunos.each {
            listId << Long.parseLong(it)
        }

        def alunos =  Pessoa.findAllByIdInList(listId)

        alunos.each {
            it.addToDisciplinas(periodoDisciplinaInstance)
        }

        periodoDisciplinaInstance.disciplina = Disciplina.read(params.disciplina)
        periodoDisciplinaInstance.professor = Pessoa.read(params.professor)
        periodoDisciplinaInstance.ano = Integer.parseInt(params.ano)
        periodoDisciplinaInstance.sala = Integer.parseInt(params.sala)
        periodoDisciplinaInstance.semestre = Integer.parseInt(params.semestre)

        periodoDisciplinaInstance.alunos = alunos

        PeriodoDisciplina.withTransaction {
            if (!periodoDisciplinaInstance.save(flush: true)) {

                println periodoDisciplinaInstance.errors
                render(view: "passo1", model: [periodoDisciplinaInstance: periodoDisciplinaInstance])
                return
            }
            alunos.each {
                if(!it.save(flush: true)){
                    render(view: "passo1", model: [periodoDisciplinaInstance: periodoDisciplinaInstance])
                    return
                }
            }
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'periodoDisciplina.label', default: 'PeriodoDisciplina'), periodoDisciplinaInstance.id])
        redirect(action: "show", id: periodoDisciplinaInstance.id)
    }


    def saveAtividade = {
        println params
        def atividade = new Atividade()
        atividade.nome = params.nome
        atividade.descricao= params.descricao

        def atividadePeriodo
        def periodoDisciplina= PeriodoDisciplina.get(params.idPeriodoDisciplina)


        if (atividade.save(flush:  true)){
            atividadePeriodo = new AtividadePeriodo()
            atividadePeriodo.atividade = atividade
            atividadePeriodo.dataCriacao = new Date()
            atividadePeriodo.periodoDisciplina =periodoDisciplina
            atividadePeriodo.dataPrazo = Date.parse("dd-MM-yyyy", params.prazo)

            if (atividadePeriodo.save(flush: true)){
                periodoDisciplina.addToAtividadesPeriodo(atividadePeriodo)
                if (periodoDisciplina.save(flush:  true)){
                    redirect(action: 'show', id: periodoDisciplina.id)
                }
            }
        }


    }
    def saveGrupo = {
        println params
        def alunos = []
        params?.checkAluno.each {
             alunos << Pessoa.read(it)
        }
        def periodoDisciplina = PeriodoDisciplina.get(params.idPeriodoDisciplina)

        def grupo = new Grupo()
        grupo.alunos = alunos
        grupo.nome = params.nome
        grupo.cor = params.colorpickerField
        grupo.professor = periodoDisciplina.professor

        if (grupo.save(flush:  true)){
            periodoDisciplina.addToGrupos(grupo)
            if (periodoDisciplina.save(flush:  true)){
                flash.message = "Grupo $grupo.nome adicionado!"
                redirect(action: 'show', id: periodoDisciplina.id)
            }else{
                println periodoDisciplina.errors
            }
        }else{
            println grupo.errors
        }


    }


    def removeAlunoFromDisciplina(Long id){

        def periodoDisciplina = PeriodoDisciplina.get(params.id)
        def aluno = Pessoa.get(params.aluno)

        periodoDisciplina.removeFromAlunos(aluno)
        aluno.removeFromDisciplinas(periodoDisciplina)


        periodoDisciplina.save(flush:  true)
        println periodoDisciplina.errors

        aluno.save(flush:  true)

        println aluno.errors
        redirect(action: 'show', id: periodoDisciplina.id)

    }



    def show(Long id) {
        def periodoDisciplinaInstance = PeriodoDisciplina.get(id)
        if (!periodoDisciplinaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'periodoDisciplina.label', default: 'PeriodoDisciplina'), id])
            redirect(action: "list")
            return
        }

        [periodoDisciplinaInstance: periodoDisciplinaInstance]
    }
    def createAtividade = {
        render(template: 'createAtividade')
    }

    def edit(Long id) {
        def periodoDisciplinaInstance = PeriodoDisciplina.get(id)
        if (!periodoDisciplinaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'periodoDisciplina.label', default: 'PeriodoDisciplina'), id])
            redirect(action: "list")
            return
        }

        [periodoDisciplinaInstance: periodoDisciplinaInstance]
    }

    def update(Long id, Long version) {
        def periodoDisciplinaInstance = PeriodoDisciplina.get(id)
        if (!periodoDisciplinaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'periodoDisciplina.label', default: 'PeriodoDisciplina'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (periodoDisciplinaInstance.version > version) {
                periodoDisciplinaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'periodoDisciplina.label', default: 'PeriodoDisciplina')] as Object[],
                        "Another user has updated this PeriodoDisciplina while you were editing")
                render(view: "edit", model: [periodoDisciplinaInstance: periodoDisciplinaInstance])
                return
            }
        }

        periodoDisciplinaInstance.properties = params

        if (!periodoDisciplinaInstance.save(flush: true)) {
            render(view: "edit", model: [periodoDisciplinaInstance: periodoDisciplinaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'periodoDisciplina.label', default: 'PeriodoDisciplina'), periodoDisciplinaInstance.id])
        redirect(action: "show", id: periodoDisciplinaInstance.id)
    }

    def delete(Long id) {
        def periodoDisciplinaInstance = PeriodoDisciplina.get(id)
        if (!periodoDisciplinaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'periodoDisciplina.label', default: 'PeriodoDisciplina'), id])
            redirect(action: "list")
            return
        }

        try {
            periodoDisciplinaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'periodoDisciplina.label', default: 'PeriodoDisciplina'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'periodoDisciplina.label', default: 'PeriodoDisciplina'), id])
            redirect(action: "show", id: id)
        }
    }
}
