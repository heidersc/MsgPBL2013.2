package sisap

import org.springframework.dao.DataIntegrityViolationException

class MensagemPredefinidaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {

        redirect(action: "list", params: params)
    }

    def list(Integer max) {

        params.max = Math.min(max ?: 10, 100)

        def mensagemPredefinida = MensagemPredefinida.findAllByPessoa(Pessoa.read(session.idPessoa))

        [mensagemPredefinidaInstanceList: mensagemPredefinida, mensagemPredefinidaInstanceTotal: mensagemPredefinida.size()]
    }

    def create() {
        [mensagemPredefinidaInstance: new MensagemPredefinida(params)]
    }

    def save() {
        def mensagemPredefinidaInstance = new MensagemPredefinida(params)

        mensagemPredefinidaInstance.pessoa = Pessoa.read(session.idPessoa)

        if (!mensagemPredefinidaInstance.save(flush: true)) {
            render(view: "create", model: [mensagemPredefinidaInstance: mensagemPredefinidaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'mensagemPredefinida.label', default: 'MensagemPredefinida'), mensagemPredefinidaInstance.id])
        redirect(action: "show", id: mensagemPredefinidaInstance.id)
    }

    def show(Long id) {
        def mensagemPredefinidaInstance = MensagemPredefinida.get(id)
        if (!mensagemPredefinidaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'mensagemPredefinida.label', default: 'MensagemPredefinida'), id])
            redirect(action: "list")
            return
        }

        [mensagemPredefinidaInstance: mensagemPredefinidaInstance]
    }

    def edit(Long id) {
        def mensagemPredefinidaInstance = MensagemPredefinida.get(id)
        if (!mensagemPredefinidaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'mensagemPredefinida.label', default: 'MensagemPredefinida'), id])
            redirect(action: "list")
            return
        }

        [mensagemPredefinidaInstance: mensagemPredefinidaInstance]
    }

    def update(Long id, Long version) {
        def mensagemPredefinidaInstance = MensagemPredefinida.get(id)
        if (!mensagemPredefinidaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'mensagemPredefinida.label', default: 'MensagemPredefinida'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (mensagemPredefinidaInstance.version > version) {
                mensagemPredefinidaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'mensagemPredefinida.label', default: 'MensagemPredefinida')] as Object[],
                        "Another user has updated this MensagemPredefinida while you were editing")
                render(view: "edit", model: [mensagemPredefinidaInstance: mensagemPredefinidaInstance])
                return
            }
        }

        mensagemPredefinidaInstance.properties = params

        if (!mensagemPredefinidaInstance.save(flush: true)) {
            render(view: "edit", model: [mensagemPredefinidaInstance: mensagemPredefinidaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'mensagemPredefinida.label', default: 'MensagemPredefinida'), mensagemPredefinidaInstance.id])
        redirect(action: "show", id: mensagemPredefinidaInstance.id)
    }

    def delete(Long id) {
        def mensagemPredefinidaInstance = MensagemPredefinida.get(id)
        if (!mensagemPredefinidaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'mensagemPredefinida.label', default: 'MensagemPredefinida'), id])
            redirect(action: "list")
            return
        }

        try {
            mensagemPredefinidaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'mensagemPredefinida.label', default: 'MensagemPredefinida'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'mensagemPredefinida.label', default: 'MensagemPredefinida'), id])
            redirect(action: "show", id: id)
        }
    }

}
