package sisap



import org.junit.*
import grails.test.mixin.*

@TestFor(DisciplinaController)
@Mock(Disciplina)
class DisciplinaControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/disciplina/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.disciplinaInstanceList.size() == 0
        assert model.disciplinaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.disciplinaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.disciplinaInstance != null
        assert view == '/disciplina/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/disciplina/show/1'
        assert controller.flash.message != null
        assert Disciplina.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/disciplina/list'

        populateValidParams(params)
        def disciplina = new Disciplina(params)

        assert disciplina.save() != null

        params.id = disciplina.id

        def model = controller.show()

        assert model.disciplinaInstance == disciplina
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/disciplina/list'

        populateValidParams(params)
        def disciplina = new Disciplina(params)

        assert disciplina.save() != null

        params.id = disciplina.id

        def model = controller.edit()

        assert model.disciplinaInstance == disciplina
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/disciplina/list'

        response.reset()

        populateValidParams(params)
        def disciplina = new Disciplina(params)

        assert disciplina.save() != null

        // test invalid parameters in update
        params.id = disciplina.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/disciplina/edit"
        assert model.disciplinaInstance != null

        disciplina.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/disciplina/show/$disciplina.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        disciplina.clearErrors()

        populateValidParams(params)
        params.id = disciplina.id
        params.version = -1
        controller.update()

        assert view == "/disciplina/edit"
        assert model.disciplinaInstance != null
        assert model.disciplinaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/disciplina/list'

        response.reset()

        populateValidParams(params)
        def disciplina = new Disciplina(params)

        assert disciplina.save() != null
        assert Disciplina.count() == 1

        params.id = disciplina.id

        controller.delete()

        assert Disciplina.count() == 0
        assert Disciplina.get(disciplina.id) == null
        assert response.redirectedUrl == '/disciplina/list'
    }
}
