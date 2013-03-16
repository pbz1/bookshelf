package pl.espeo.bookshelf

import org.springframework.dao.DataIntegrityViolationException

class ShelfController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [shelfInstanceList: Shelf.list(params), shelfInstanceTotal: Shelf.count()]
    }

    def create() {
        [shelfInstance: new Shelf(params)]
    }

    def save() {
        def shelfInstance = new Shelf(params)
        if (!shelfInstance.save(flush: true)) {
            render(view: "create", model: [shelfInstance: shelfInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'shelf.label', default: 'Shelf'), shelfInstance.id])
        redirect(action: "show", id: shelfInstance.id)
    }

    def show(Long id) {
        def shelfInstance = Shelf.get(id)
        if (!shelfInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'shelf.label', default: 'Shelf'), id])
            redirect(action: "list")
            return
        }

        [shelfInstance: shelfInstance]
    }

    def edit(Long id) {
        def shelfInstance = Shelf.get(id)
        if (!shelfInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'shelf.label', default: 'Shelf'), id])
            redirect(action: "list")
            return
        }

        [shelfInstance: shelfInstance]
    }

    def update(Long id, Long version) {
        def shelfInstance = Shelf.get(id)
        if (!shelfInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'shelf.label', default: 'Shelf'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (shelfInstance.version > version) {
                shelfInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'shelf.label', default: 'Shelf')] as Object[],
                          "Another user has updated this Shelf while you were editing")
                render(view: "edit", model: [shelfInstance: shelfInstance])
                return
            }
        }

        shelfInstance.properties = params

        if (!shelfInstance.save(flush: true)) {
            render(view: "edit", model: [shelfInstance: shelfInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'shelf.label', default: 'Shelf'), shelfInstance.id])
        redirect(action: "show", id: shelfInstance.id)
    }

    def delete(Long id) {
        def shelfInstance = Shelf.get(id)
        if (!shelfInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'shelf.label', default: 'Shelf'), id])
            redirect(action: "list")
            return
        }

        try {
            shelfInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'shelf.label', default: 'Shelf'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'shelf.label', default: 'Shelf'), id])
            redirect(action: "show", id: id)
        }
    }
}
