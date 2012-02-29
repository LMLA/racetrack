package racetrack

import org.springframework.dao.DataIntegrityViolationException

class RegistrationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [registrationInstanceList: Registration.list(params), registrationInstanceTotal: Registration.count()]
    }

    def create() {
        [registrationInstance: new Registration(params)]
    }

    def save() {
        def registrationInstance = new Registration(params)
        if (!registrationInstance.save(flush: true)) {
            render(view: "create", model: [registrationInstance: registrationInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'registration.label', default: 'Registration'), registrationInstance.id])
        redirect(action: "show", id: registrationInstance.id)
    }

    def show() {
        def registrationInstance = Registration.get(params.id)
        if (!registrationInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'registration.label', default: 'Registration'), params.id])
            redirect(action: "list")
            return
        }

        [registrationInstance: registrationInstance]
    }

    def edit() {
        def registrationInstance = Registration.get(params.id)
        if (!registrationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'registration.label', default: 'Registration'), params.id])
            redirect(action: "list")
            return
        }

        [registrationInstance: registrationInstance]
    }

    def update() {
        def registrationInstance = Registration.get(params.id)
        if (!registrationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'registration.label', default: 'Registration'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (registrationInstance.version > version) {
                registrationInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'registration.label', default: 'Registration')] as Object[],
                          "Another user has updated this Registration while you were editing")
                render(view: "edit", model: [registrationInstance: registrationInstance])
                return
            }
        }

        registrationInstance.properties = params

        if (!registrationInstance.save(flush: true)) {
            render(view: "edit", model: [registrationInstance: registrationInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'registration.label', default: 'Registration'), registrationInstance.id])
        redirect(action: "show", id: registrationInstance.id)
    }

    def delete() {
        def registrationInstance = Registration.get(params.id)
        if (!registrationInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'registration.label', default: 'Registration'), params.id])
            redirect(action: "list")
            return
        }

        try {
            registrationInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'registration.label', default: 'Registration'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'registration.label', default: 'Registration'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
