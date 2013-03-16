package pl.espeo.bookshelf

import org.springframework.dao.DataIntegrityViolationException

class HireController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [hireInstanceList: Hire.list(params), hireInstanceTotal: Hire.count()]
    }

    def create() {
        [hireInstance: new Hire(params)]
    }

    def save() {
        def hireInstance = new Hire(params)
        if (!hireInstance.save(flush: true)) {
            render(view: "create", model: [hireInstance: hireInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'hire.label', default: 'Hire'), hireInstance.id])
        redirect(action: "show", id: hireInstance.id)
    }

    def show(Long id) {
        def hireInstance = Hire.get(id)
        if (!hireInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'hire.label', default: 'Hire'), id])
            redirect(action: "list")
            return
        }

        [hireInstance: hireInstance]
    }

    def edit(Long id) {
        def hireInstance = Hire.get(id)
        if (!hireInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'hire.label', default: 'Hire'), id])
            redirect(action: "list")
            return
        }

        [hireInstance: hireInstance]
    }

    def update(Long id, Long version) {
        def hireInstance = Hire.get(id)
        if (!hireInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'hire.label', default: 'Hire'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (hireInstance.version > version) {
                hireInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'hire.label', default: 'Hire')] as Object[],
                          "Another user has updated this Hire while you were editing")
                render(view: "edit", model: [hireInstance: hireInstance])
                return
            }
        }

        hireInstance.properties = params

        if (!hireInstance.save(flush: true)) {
            render(view: "edit", model: [hireInstance: hireInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'hire.label', default: 'Hire'), hireInstance.id])
        redirect(action: "show", id: hireInstance.id)
    }

    def delete(Long id) {
        def hireInstance = Hire.get(id)
        if (!hireInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'hire.label', default: 'Hire'), id])
            redirect(action: "list")
            return
        }

        try {
            hireInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'hire.label', default: 'Hire'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'hire.label', default: 'Hire'), id])
            redirect(action: "show", id: id)
        }
    }
}
