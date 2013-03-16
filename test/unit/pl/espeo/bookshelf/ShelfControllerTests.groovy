package pl.espeo.bookshelf



import org.junit.*
import grails.test.mixin.*

@TestFor(ShelfController)
@Mock(Shelf)
class ShelfControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/shelf/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.shelfInstanceList.size() == 0
        assert model.shelfInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.shelfInstance != null
    }

    void testSave() {
        controller.save()

        assert model.shelfInstance != null
        assert view == '/shelf/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/shelf/show/1'
        assert controller.flash.message != null
        assert Shelf.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/shelf/list'

        populateValidParams(params)
        def shelf = new Shelf(params)

        assert shelf.save() != null

        params.id = shelf.id

        def model = controller.show()

        assert model.shelfInstance == shelf
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/shelf/list'

        populateValidParams(params)
        def shelf = new Shelf(params)

        assert shelf.save() != null

        params.id = shelf.id

        def model = controller.edit()

        assert model.shelfInstance == shelf
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/shelf/list'

        response.reset()

        populateValidParams(params)
        def shelf = new Shelf(params)

        assert shelf.save() != null

        // test invalid parameters in update
        params.id = shelf.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/shelf/edit"
        assert model.shelfInstance != null

        shelf.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/shelf/show/$shelf.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        shelf.clearErrors()

        populateValidParams(params)
        params.id = shelf.id
        params.version = -1
        controller.update()

        assert view == "/shelf/edit"
        assert model.shelfInstance != null
        assert model.shelfInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/shelf/list'

        response.reset()

        populateValidParams(params)
        def shelf = new Shelf(params)

        assert shelf.save() != null
        assert Shelf.count() == 1

        params.id = shelf.id

        controller.delete()

        assert Shelf.count() == 0
        assert Shelf.get(shelf.id) == null
        assert response.redirectedUrl == '/shelf/list'
    }
}
