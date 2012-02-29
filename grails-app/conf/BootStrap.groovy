import racetrack.Runner
import grails.util.GrailsUtil

class BootStrap {

    def init = { servletContext ->
        switch (GrailsUtil.environment){
            case "development":
                def jane = new Runner(
                        firstName: "Jane",
                        lastName: "Doe",
                        dateOfBirth: (new Date() - 365 * 30),
                        gender: "F",
                        address: "123 Main St",
                        city: "Gooses",
                        state: "NC",
                        zipcode: "12345",
                        email: "jane@whereever.com"
                )
                jane.save()
                if (jane.hasErrors()) {
                    println(jane.errors)
                }
            case "test": break
            case "production": break
        }

    }
    def destroy = {
    }
}
