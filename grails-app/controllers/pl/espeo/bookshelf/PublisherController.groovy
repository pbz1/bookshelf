package pl.espeo.bookshelf

import org.springframework.dao.DataIntegrityViolationException

class PublisherController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [publisherInstanceList: Publisher.list(params), publisherInstanceTotal: Publisher.count()]
    }

    def create() {
        [publisherInstance: new Publisher(params)]
    }

    def save() {
        def publisherInstance = new Publisher(params)
        if (!publisherInstance.save(flush: true)) {
            render(view: "create", model: [publisherInstance: publisherInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'publisher.label', default: 'Publisher'), publisherInstance.id])
        redirect(action: "show", id: publisherInstance.id)
    }

    def show(Long id) {
        def publisherInstance = Publisher.get(id)
        if (!publisherInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'publisher.label', default: 'Publisher'), id])
            redirect(action: "list")
            return
        }

        [publisherInstance: publisherInstance]
    }

    def edit(Long id) {
        def publisherInstance = Publisher.get(id)
        if (!publisherInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'publisher.label', default: 'Publisher'), id])
            redirect(action: "list")
            return
        }

        [publisherInstance: publisherInstance]
    }

    def update(Long id, Long version) {
        def publisherInstance = Publisher.get(id)
        if (!publisherInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'publisher.label', default: 'Publisher'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (publisherInstance.version > version) {
                publisherInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'publisher.label', default: 'Publisher')] as Object[],
                          "Another user has updated this Publisher while you were editing")
                render(view: "edit", model: [publisherInstance: publisherInstance])
                return
            }
        }

        publisherInstance.properties = params

        if (!publisherInstance.save(flush: true)) {
            render(view: "edit", model: [publisherInstance: publisherInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'publisher.label', default: 'Publisher'), publisherInstance.id])
        redirect(action: "show", id: publisherInstance.id)
    }

    def delete(Long id) {
        def publisherInstance = Publisher.get(id)
        if (!publisherInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'publisher.label', default: 'Publisher'), id])
            redirect(action: "list")
            return
        }

        try {
            publisherInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'publisher.label', default: 'Publisher'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'publisher.label', default: 'Publisher'), id])
            redirect(action: "show", id: id)
        }
    }
}
