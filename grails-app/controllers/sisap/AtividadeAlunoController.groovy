package sisap

import org.springframework.dao.DataIntegrityViolationException

class AtividadeAlunoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [atividadeAlunoInstanceList: AtividadeAluno.list(params), atividadeAlunoInstanceTotal: AtividadeAluno.count()]
    }

    def create() {
        [atividadeAlunoInstance: new AtividadeAluno(params)]
    }

    def save() {
        def atividadeAlunoInstance = new AtividadeAluno(params)
        if (!atividadeAlunoInstance.save(flush: true)) {
            render(view: "create", model: [atividadeAlunoInstance: atividadeAlunoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'atividadeAluno.label', default: 'AtividadeAluno'), atividadeAlunoInstance.id])
        redirect(action: "show", id: atividadeAlunoInstance.id)
    }

    def show(Long id) {
        def atividadeAlunoInstance = AtividadeAluno.get(id)
        if (!atividadeAlunoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'atividadeAluno.label', default: 'AtividadeAluno'), id])
            redirect(action: "list")
            return
        }

        [atividadeAlunoInstance: atividadeAlunoInstance]
    }

    def edit(Long id) {
        def atividadeAlunoInstance = AtividadeAluno.get(id)
        if (!atividadeAlunoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'atividadeAluno.label', default: 'AtividadeAluno'), id])
            redirect(action: "list")
            return
        }

        [atividadeAlunoInstance: atividadeAlunoInstance]
    }

    def update(Long id, Long version) {
        def atividadeAlunoInstance = AtividadeAluno.get(id)
        if (!atividadeAlunoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'atividadeAluno.label', default: 'AtividadeAluno'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (atividadeAlunoInstance.version > version) {
                atividadeAlunoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'atividadeAluno.label', default: 'AtividadeAluno')] as Object[],
                        "Another user has updated this AtividadeAluno while you were editing")
                render(view: "edit", model: [atividadeAlunoInstance: atividadeAlunoInstance])
                return
            }
        }

        atividadeAlunoInstance.properties = params

        if (!atividadeAlunoInstance.save(flush: true)) {
            render(view: "edit", model: [atividadeAlunoInstance: atividadeAlunoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'atividadeAluno.label', default: 'AtividadeAluno'), atividadeAlunoInstance.id])
        redirect(action: "show", id: atividadeAlunoInstance.id)
    }

    def delete(Long id) {
        def atividadeAlunoInstance = AtividadeAluno.get(id)
        if (!atividadeAlunoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'atividadeAluno.label', default: 'AtividadeAluno'), id])
            redirect(action: "list")
            return
        }

        try {
            atividadeAlunoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'atividadeAluno.label', default: 'AtividadeAluno'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'atividadeAluno.label', default: 'AtividadeAluno'), id])
            redirect(action: "show", id: id)
        }
    }
}
