package sisap



import org.junit.*
import grails.test.mixin.*

@TestFor(AtividadeAlunoController)
@Mock(AtividadeAluno)
class AtividadeAlunoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/atividadeAluno/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.atividadeAlunoInstanceList.size() == 0
        assert model.atividadeAlunoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.atividadeAlunoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.atividadeAlunoInstance != null
        assert view == '/atividadeAluno/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/atividadeAluno/show/1'
        assert controller.flash.message != null
        assert AtividadeAluno.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/atividadeAluno/list'

        populateValidParams(params)
        def atividadeAluno = new AtividadeAluno(params)

        assert atividadeAluno.save() != null

        params.id = atividadeAluno.id

        def model = controller.show()

        assert model.atividadeAlunoInstance == atividadeAluno
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/atividadeAluno/list'

        populateValidParams(params)
        def atividadeAluno = new AtividadeAluno(params)

        assert atividadeAluno.save() != null

        params.id = atividadeAluno.id

        def model = controller.edit()

        assert model.atividadeAlunoInstance == atividadeAluno
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/atividadeAluno/list'

        response.reset()

        populateValidParams(params)
        def atividadeAluno = new AtividadeAluno(params)

        assert atividadeAluno.save() != null

        // test invalid parameters in update
        params.id = atividadeAluno.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/atividadeAluno/edit"
        assert model.atividadeAlunoInstance != null

        atividadeAluno.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/atividadeAluno/show/$atividadeAluno.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        atividadeAluno.clearErrors()

        populateValidParams(params)
        params.id = atividadeAluno.id
        params.version = -1
        controller.update()

        assert view == "/atividadeAluno/edit"
        assert model.atividadeAlunoInstance != null
        assert model.atividadeAlunoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/atividadeAluno/list'

        response.reset()

        populateValidParams(params)
        def atividadeAluno = new AtividadeAluno(params)

        assert atividadeAluno.save() != null
        assert AtividadeAluno.count() == 1

        params.id = atividadeAluno.id

        controller.delete()

        assert AtividadeAluno.count() == 0
        assert AtividadeAluno.get(atividadeAluno.id) == null
        assert response.redirectedUrl == '/atividadeAluno/list'
    }
}
