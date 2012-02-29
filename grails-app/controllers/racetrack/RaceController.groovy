package racetrack

import org.springframework.dao.DataIntegrityViolationException

class RaceController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [raceInstanceList: Race.list(params), raceInstanceTotal: Race.count()]
    }

    def create() {
        [raceInstance: new Race(params)]
    }

    def save() {
        def raceInstance = new Race(params)
        if (!raceInstance.save(flush: true)) {
            render(view: "create", model: [raceInstance: raceInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'race.label', default: 'Race'), raceInstance.id])
        redirect(action: "show", id: raceInstance.id)
    }

    def show() {
        def raceInstance = Race.get(params.id)
        if (!raceInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'race.label', default: 'Race'), params.id])
            redirect(action: "list")
            return
        }

        [raceInstance: raceInstance]
    }

    def edit() {
        def raceInstance = Race.get(params.id)
        if (!raceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'race.label', default: 'Race'), params.id])
            redirect(action: "list")
            return
        }

        [raceInstance: raceInstance]
    }

    def update() {
        def raceInstance = Race.get(params.id)
        if (!raceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'race.label', default: 'Race'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (raceInstance.version > version) {
                raceInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'race.label', default: 'Race')] as Object[],
                          "Another user has updated this Race while you were editing")
                render(view: "edit", model: [raceInstance: raceInstance])
                return
            }
        }

        raceInstance.properties = params

        if (!raceInstance.save(flush: true)) {
            render(view: "edit", model: [raceInstance: raceInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'race.label', default: 'Race'), raceInstance.id])
        redirect(action: "show", id: raceInstance.id)
    }

    def delete() {
        def raceInstance = Race.get(params.id)
        if (!raceInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'race.label', default: 'Race'), params.id])
            redirect(action: "list")
            return
        }

        try {
            raceInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'race.label', default: 'Race'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'race.label', default: 'Race'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
