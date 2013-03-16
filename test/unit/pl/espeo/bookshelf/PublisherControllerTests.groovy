package pl.espeo.bookshelf



import org.junit.*
import grails.test.mixin.*

@TestFor(PublisherController)
@Mock(Publisher)
class PublisherControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/publisher/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.publisherInstanceList.size() == 0
        assert model.publisherInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.publisherInstance != null
    }

    void testSave() {
        controller.save()

        assert model.publisherInstance != null
        assert view == '/publisher/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/publisher/show/1'
        assert controller.flash.message != null
        assert Publisher.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/publisher/list'

        populateValidParams(params)
        def publisher = new Publisher(params)

        assert publisher.save() != null

        params.id = publisher.id

        def model = controller.show()

        assert model.publisherInstance == publisher
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/publisher/list'

        populateValidParams(params)
        def publisher = new Publisher(params)

        assert publisher.save() != null

        params.id = publisher.id

        def model = controller.edit()

        assert model.publisherInstance == publisher
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/publisher/list'

        response.reset()

        populateValidParams(params)
        def publisher = new Publisher(params)

        assert publisher.save() != null

        // test invalid parameters in update
        params.id = publisher.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/publisher/edit"
        assert model.publisherInstance != null

        publisher.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/publisher/show/$publisher.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        publisher.clearErrors()

        populateValidParams(params)
        params.id = publisher.id
        params.version = -1
        controller.update()

        assert view == "/publisher/edit"
        assert model.publisherInstance != null
        assert model.publisherInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/publisher/list'

        response.reset()

        populateValidParams(params)
        def publisher = new Publisher(params)

        assert publisher.save() != null
        assert Publisher.count() == 1

        params.id = publisher.id

        controller.delete()

        assert Publisher.count() == 0
        assert Publisher.get(publisher.id) == null
        assert response.redirectedUrl == '/publisher/list'
    }
}
