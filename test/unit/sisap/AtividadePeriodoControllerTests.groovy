package sisap



import org.junit.*
import grails.test.mixin.*

@TestFor(AtividadePeriodoController)
@Mock(AtividadePeriodo)
class AtividadePeriodoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/atividadePeriodo/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.atividadePeriodoInstanceList.size() == 0
        assert model.atividadePeriodoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.atividadePeriodoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.atividadePeriodoInstance != null
        assert view == '/atividadePeriodo/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/atividadePeriodo/show/1'
        assert controller.flash.message != null
        assert AtividadePeriodo.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/atividadePeriodo/list'

        populateValidParams(params)
        def atividadePeriodo = new AtividadePeriodo(params)

        assert atividadePeriodo.save() != null

        params.id = atividadePeriodo.id

        def model = controller.show()

        assert model.atividadePeriodoInstance == atividadePeriodo
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/atividadePeriodo/list'

        populateValidParams(params)
        def atividadePeriodo = new AtividadePeriodo(params)

        assert atividadePeriodo.save() != null

        params.id = atividadePeriodo.id

        def model = controller.edit()

        assert model.atividadePeriodoInstance == atividadePeriodo
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/atividadePeriodo/list'

        response.reset()

        populateValidParams(params)
        def atividadePeriodo = new AtividadePeriodo(params)

        assert atividadePeriodo.save() != null

        // test invalid parameters in update
        params.id = atividadePeriodo.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/atividadePeriodo/edit"
        assert model.atividadePeriodoInstance != null

        atividadePeriodo.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/atividadePeriodo/show/$atividadePeriodo.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        atividadePeriodo.clearErrors()

        populateValidParams(params)
        params.id = atividadePeriodo.id
        params.version = -1
        controller.update()

        assert view == "/atividadePeriodo/edit"
        assert model.atividadePeriodoInstance != null
        assert model.atividadePeriodoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/atividadePeriodo/list'

        response.reset()

        populateValidParams(params)
        def atividadePeriodo = new AtividadePeriodo(params)

        assert atividadePeriodo.save() != null
        assert AtividadePeriodo.count() == 1

        params.id = atividadePeriodo.id

        controller.delete()

        assert AtividadePeriodo.count() == 0
        assert AtividadePeriodo.get(atividadePeriodo.id) == null
        assert response.redirectedUrl == '/atividadePeriodo/list'
    }
}
