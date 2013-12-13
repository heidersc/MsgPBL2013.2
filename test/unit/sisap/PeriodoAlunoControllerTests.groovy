package sisap



import org.junit.*
import grails.test.mixin.*

@TestFor(PeriodoAlunoController)
@Mock(PeriodoAluno)
class PeriodoAlunoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/periodoAluno/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.periodoAlunoInstanceList.size() == 0
        assert model.periodoAlunoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.periodoAlunoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.periodoAlunoInstance != null
        assert view == '/periodoAluno/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/periodoAluno/show/1'
        assert controller.flash.message != null
        assert PeriodoAluno.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/periodoAluno/list'

        populateValidParams(params)
        def periodoAluno = new PeriodoAluno(params)

        assert periodoAluno.save() != null

        params.id = periodoAluno.id

        def model = controller.show()

        assert model.periodoAlunoInstance == periodoAluno
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/periodoAluno/list'

        populateValidParams(params)
        def periodoAluno = new PeriodoAluno(params)

        assert periodoAluno.save() != null

        params.id = periodoAluno.id

        def model = controller.edit()

        assert model.periodoAlunoInstance == periodoAluno
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/periodoAluno/list'

        response.reset()

        populateValidParams(params)
        def periodoAluno = new PeriodoAluno(params)

        assert periodoAluno.save() != null

        // test invalid parameters in update
        params.id = periodoAluno.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/periodoAluno/edit"
        assert model.periodoAlunoInstance != null

        periodoAluno.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/periodoAluno/show/$periodoAluno.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        periodoAluno.clearErrors()

        populateValidParams(params)
        params.id = periodoAluno.id
        params.version = -1
        controller.update()

        assert view == "/periodoAluno/edit"
        assert model.periodoAlunoInstance != null
        assert model.periodoAlunoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/periodoAluno/list'

        response.reset()

        populateValidParams(params)
        def periodoAluno = new PeriodoAluno(params)

        assert periodoAluno.save() != null
        assert PeriodoAluno.count() == 1

        params.id = periodoAluno.id

        controller.delete()

        assert PeriodoAluno.count() == 0
        assert PeriodoAluno.get(periodoAluno.id) == null
        assert response.redirectedUrl == '/periodoAluno/list'
    }
}
