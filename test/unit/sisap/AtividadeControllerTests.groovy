package sisap



import org.junit.*
import grails.test.mixin.*

@TestFor(AtividadeController)
@Mock(Atividade)
class AtividadeControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/atividade/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.atividadeInstanceList.size() == 0
        assert model.atividadeInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.atividadeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.atividadeInstance != null
        assert view == '/atividade/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/atividade/show/1'
        assert controller.flash.message != null
        assert Atividade.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/atividade/list'

        populateValidParams(params)
        def atividade = new Atividade(params)

        assert atividade.save() != null

        params.id = atividade.id

        def model = controller.show()

        assert model.atividadeInstance == atividade
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/atividade/list'

        populateValidParams(params)
        def atividade = new Atividade(params)

        assert atividade.save() != null

        params.id = atividade.id

        def model = controller.edit()

        assert model.atividadeInstance == atividade
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/atividade/list'

        response.reset()

        populateValidParams(params)
        def atividade = new Atividade(params)

        assert atividade.save() != null

        // test invalid parameters in update
        params.id = atividade.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/atividade/edit"
        assert model.atividadeInstance != null

        atividade.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/atividade/show/$atividade.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        atividade.clearErrors()

        populateValidParams(params)
        params.id = atividade.id
        params.version = -1
        controller.update()

        assert view == "/atividade/edit"
        assert model.atividadeInstance != null
        assert model.atividadeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/atividade/list'

        response.reset()

        populateValidParams(params)
        def atividade = new Atividade(params)

        assert atividade.save() != null
        assert Atividade.count() == 1

        params.id = atividade.id

        controller.delete()

        assert Atividade.count() == 0
        assert Atividade.get(atividade.id) == null
        assert response.redirectedUrl == '/atividade/list'
    }
}
