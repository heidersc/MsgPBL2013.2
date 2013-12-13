package sisap

import org.springframework.dao.DataIntegrityViolationException

class AtividadePeriodoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [atividadePeriodoInstanceList: AtividadePeriodo.list(params), atividadePeriodoInstanceTotal: AtividadePeriodo.count()]
    }

    def create() {
        [atividadePeriodoInstance: new AtividadePeriodo(params)]
    }

    def save() {
        def atividadePeriodoInstance = new AtividadePeriodo(params)
        if (!atividadePeriodoInstance.save(flush: true)) {
            render(view: "create", model: [atividadePeriodoInstance: atividadePeriodoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'atividadePeriodo.label', default: 'AtividadePeriodo'), atividadePeriodoInstance.id])
        redirect(action: "show", id: atividadePeriodoInstance.id)
    }

    def show(Long id) {
        def atividadePeriodoInstance = AtividadePeriodo.get(id)
        if (!atividadePeriodoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'atividadePeriodo.label', default: 'AtividadePeriodo'), id])
            redirect(action: "list")
            return
        }

        [atividadePeriodoInstance: atividadePeriodoInstance]
    }

    def edit(Long id) {
        def atividadePeriodoInstance = AtividadePeriodo.get(id)
        if (!atividadePeriodoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'atividadePeriodo.label', default: 'AtividadePeriodo'), id])
            redirect(action: "list")
            return
        }

        [atividadePeriodoInstance: atividadePeriodoInstance]
    }

    def update(Long id, Long version) {
        def atividadePeriodoInstance = AtividadePeriodo.get(id)
        if (!atividadePeriodoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'atividadePeriodo.label', default: 'AtividadePeriodo'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (atividadePeriodoInstance.version > version) {
                atividadePeriodoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'atividadePeriodo.label', default: 'AtividadePeriodo')] as Object[],
                        "Another user has updated this AtividadePeriodo while you were editing")
                render(view: "edit", model: [atividadePeriodoInstance: atividadePeriodoInstance])
                return
            }
        }

        atividadePeriodoInstance.properties = params

        if (!atividadePeriodoInstance.save(flush: true)) {
            render(view: "edit", model: [atividadePeriodoInstance: atividadePeriodoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'atividadePeriodo.label', default: 'AtividadePeriodo'), atividadePeriodoInstance.id])
        redirect(action: "show", id: atividadePeriodoInstance.id)
    }

    def delete(Long id) {
        def atividadePeriodoInstance = AtividadePeriodo.get(id)
        if (!atividadePeriodoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'atividadePeriodo.label', default: 'AtividadePeriodo'), id])
            redirect(action: "list")
            return
        }

        try {
            atividadePeriodoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'atividadePeriodo.label', default: 'AtividadePeriodo'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'atividadePeriodo.label', default: 'AtividadePeriodo'), id])
            redirect(action: "show", id: id)
        }
    }
}
