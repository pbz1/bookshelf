package pl.espeo.bookshelf



import org.junit.*
import grails.test.mixin.*

@TestFor(HireController)
@Mock(Hire)
class HireControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/hire/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.hireInstanceList.size() == 0
        assert model.hireInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.hireInstance != null
    }

    void testSave() {
        controller.save()

        assert model.hireInstance != null
        assert view == '/hire/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/hire/show/1'
        assert controller.flash.message != null
        assert Hire.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/hire/list'

        populateValidParams(params)
        def hire = new Hire(params)

        assert hire.save() != null

        params.id = hire.id

        def model = controller.show()

        assert model.hireInstance == hire
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/hire/list'

        populateValidParams(params)
        def hire = new Hire(params)

        assert hire.save() != null

        params.id = hire.id

        def model = controller.edit()

        assert model.hireInstance == hire
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/hire/list'

        response.reset()

        populateValidParams(params)
        def hire = new Hire(params)

        assert hire.save() != null

        // test invalid parameters in update
        params.id = hire.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/hire/edit"
        assert model.hireInstance != null

        hire.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/hire/show/$hire.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        hire.clearErrors()

        populateValidParams(params)
        params.id = hire.id
        params.version = -1
        controller.update()

        assert view == "/hire/edit"
        assert model.hireInstance != null
        assert model.hireInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/hire/list'

        response.reset()

        populateValidParams(params)
        def hire = new Hire(params)

        assert hire.save() != null
        assert Hire.count() == 1

        params.id = hire.id

        controller.delete()

        assert Hire.count() == 0
        assert Hire.get(hire.id) == null
        assert response.redirectedUrl == '/hire/list'
    }
}
