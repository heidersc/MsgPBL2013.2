package sisap

import org.springframework.dao.DataIntegrityViolationException

class PeriodoAlunoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [periodoAlunoInstanceList: PeriodoAluno.list(params), periodoAlunoInstanceTotal: PeriodoAluno.count()]
    }

    def create() {
        [periodoAlunoInstance: new PeriodoAluno(params)]
    }

    def save() {
        def periodoAlunoInstance = new PeriodoAluno(params)

        if (!periodoAlunoInstance.save(flush: true)) {
            println("Periodo Aluno Salvo!!")
            return
        }

        //flash.message = message(code: 'default.created.message', args: [message(code: 'periodoAluno.label', default: 'PeriodoAluno'), periodoAlunoInstance.id])
        //redirect(action: "show", id: periodoAlunoInstance.id)
    }

    def show(Long id) {
        def periodoAlunoInstance = PeriodoAluno.get(id)
        if (!periodoAlunoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'periodoAluno.label', default: 'PeriodoAluno'), id])
            redirect(action: "list")
            return
        }

        [periodoAlunoInstance: periodoAlunoInstance]
    }

    def edit(Long id) {
        def periodoAlunoInstance = PeriodoAluno.get(id)
        if (!periodoAlunoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'periodoAluno.label', default: 'PeriodoAluno'), id])
            redirect(action: "list")
            return
        }

        [periodoAlunoInstance: periodoAlunoInstance]
    }

    def update(Long id, Long version) {
        def periodoAlunoInstance = PeriodoAluno.get(id)
        if (!periodoAlunoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'periodoAluno.label', default: 'PeriodoAluno'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (periodoAlunoInstance.version > version) {
                periodoAlunoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'periodoAluno.label', default: 'PeriodoAluno')] as Object[],
                        "Another user has updated this PeriodoAluno while you were editing")
                render(view: "edit", model: [periodoAlunoInstance: periodoAlunoInstance])
                return
            }
        }

        periodoAlunoInstance.properties = params

        if (!periodoAlunoInstance.save(flush: true)) {
            render(view: "edit", model: [periodoAlunoInstance: periodoAlunoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'periodoAluno.label', default: 'PeriodoAluno'), periodoAlunoInstance.id])
        redirect(action: "show", id: periodoAlunoInstance.id)
    }

    def delete(Long id) {
        def periodoAlunoInstance = PeriodoAluno.get(id)
        if (!periodoAlunoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'periodoAluno.label', default: 'PeriodoAluno'), id])
            redirect(action: "list")
            return
        }

        try {
            periodoAlunoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'periodoAluno.label', default: 'PeriodoAluno'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'periodoAluno.label', default: 'PeriodoAluno'), id])
            redirect(action: "show", id: id)
        }
    }
}
