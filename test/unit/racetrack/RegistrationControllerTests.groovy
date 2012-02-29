package racetrack



import org.junit.*
import grails.test.mixin.*

@TestFor(RegistrationController)
@Mock(Registration)
class RegistrationControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/registration/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.registrationInstanceList.size() == 0
        assert model.registrationInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.registrationInstance != null
    }

    void testSave() {
        controller.save()

        assert model.registrationInstance != null
        assert view == '/registration/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/registration/show/1'
        assert controller.flash.message != null
        assert Registration.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/registration/list'


        populateValidParams(params)
        def registration = new Registration(params)

        assert registration.save() != null

        params.id = registration.id

        def model = controller.show()

        assert model.registrationInstance == registration
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/registration/list'


        populateValidParams(params)
        def registration = new Registration(params)

        assert registration.save() != null

        params.id = registration.id

        def model = controller.edit()

        assert model.registrationInstance == registration
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/registration/list'

        response.reset()


        populateValidParams(params)
        def registration = new Registration(params)

        assert registration.save() != null

        // test invalid parameters in update
        params.id = registration.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/registration/edit"
        assert model.registrationInstance != null

        registration.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/registration/show/$registration.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        registration.clearErrors()

        populateValidParams(params)
        params.id = registration.id
        params.version = -1
        controller.update()

        assert view == "/registration/edit"
        assert model.registrationInstance != null
        assert model.registrationInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/registration/list'

        response.reset()

        populateValidParams(params)
        def registration = new Registration(params)

        assert registration.save() != null
        assert Registration.count() == 1

        params.id = registration.id

        controller.delete()

        assert Registration.count() == 0
        assert Registration.get(registration.id) == null
        assert response.redirectedUrl == '/registration/list'
    }
}
