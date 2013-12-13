package sisap



import org.junit.*
import grails.test.mixin.*

@TestFor(PeriodoDisciplinaController)
@Mock(PeriodoDisciplina)
class PeriodoDisciplinaControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/periodoDisciplina/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.periodoDisciplinaInstanceList.size() == 0
        assert model.periodoDisciplinaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.periodoDisciplinaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.periodoDisciplinaInstance != null
        assert view == '/periodoDisciplina/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/periodoDisciplina/show/1'
        assert controller.flash.message != null
        assert PeriodoDisciplina.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/periodoDisciplina/list'

        populateValidParams(params)
        def periodoDisciplina = new PeriodoDisciplina(params)

        assert periodoDisciplina.save() != null

        params.id = periodoDisciplina.id

        def model = controller.show()

        assert model.periodoDisciplinaInstance == periodoDisciplina
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/periodoDisciplina/list'

        populateValidParams(params)
        def periodoDisciplina = new PeriodoDisciplina(params)

        assert periodoDisciplina.save() != null

        params.id = periodoDisciplina.id

        def model = controller.edit()

        assert model.periodoDisciplinaInstance == periodoDisciplina
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/periodoDisciplina/list'

        response.reset()

        populateValidParams(params)
        def periodoDisciplina = new PeriodoDisciplina(params)

        assert periodoDisciplina.save() != null

        // test invalid parameters in update
        params.id = periodoDisciplina.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/periodoDisciplina/edit"
        assert model.periodoDisciplinaInstance != null

        periodoDisciplina.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/periodoDisciplina/show/$periodoDisciplina.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        periodoDisciplina.clearErrors()

        populateValidParams(params)
        params.id = periodoDisciplina.id
        params.version = -1
        controller.update()

        assert view == "/periodoDisciplina/edit"
        assert model.periodoDisciplinaInstance != null
        assert model.periodoDisciplinaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/periodoDisciplina/list'

        response.reset()

        populateValidParams(params)
        def periodoDisciplina = new PeriodoDisciplina(params)

        assert periodoDisciplina.save() != null
        assert PeriodoDisciplina.count() == 1

        params.id = periodoDisciplina.id

        controller.delete()

        assert PeriodoDisciplina.count() == 0
        assert PeriodoDisciplina.get(periodoDisciplina.id) == null
        assert response.redirectedUrl == '/periodoDisciplina/list'
    }
}
