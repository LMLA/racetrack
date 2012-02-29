package racetrack



import org.junit.*
import grails.test.mixin.*

@TestFor(RaceController)
@Mock(Race)
class RaceControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/race/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.raceInstanceList.size() == 0
        assert model.raceInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.raceInstance != null
    }

    void testSave() {
        controller.save()

        assert model.raceInstance != null
        assert view == '/race/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/race/show/1'
        assert controller.flash.message != null
        assert Race.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/race/list'


        populateValidParams(params)
        def race = new Race(params)

        assert race.save() != null

        params.id = race.id

        def model = controller.show()

        assert model.raceInstance == race
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/race/list'


        populateValidParams(params)
        def race = new Race(params)

        assert race.save() != null

        params.id = race.id

        def model = controller.edit()

        assert model.raceInstance == race
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/race/list'

        response.reset()


        populateValidParams(params)
        def race = new Race(params)

        assert race.save() != null

        // test invalid parameters in update
        params.id = race.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/race/edit"
        assert model.raceInstance != null

        race.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/race/show/$race.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        race.clearErrors()

        populateValidParams(params)
        params.id = race.id
        params.version = -1
        controller.update()

        assert view == "/race/edit"
        assert model.raceInstance != null
        assert model.raceInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/race/list'

        response.reset()

        populateValidParams(params)
        def race = new Race(params)

        assert race.save() != null
        assert Race.count() == 1

        params.id = race.id

        controller.delete()

        assert Race.count() == 0
        assert Race.get(race.id) == null
        assert response.redirectedUrl == '/race/list'
    }
}
