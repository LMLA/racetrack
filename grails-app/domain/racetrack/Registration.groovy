package racetrack

class Registration {
    Boolean paid
    Date dateCreated

    static constraints = {
        race()
        runner()
        paid()
        dateCreated()
    }

    static belongsTo = [race:Race, runner:Runner]

    String toString(){
        return "${name}"
    }
}
