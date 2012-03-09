import racetrack.Runner
import racetrack.User
import grails.util.GrailsUtil

class BootStrap {

    def init = { servletContext ->
        switch (GrailsUtil.environment){
            case "development":

                //Runners:
                def jane = new Runner(
                        firstName: "Jane",
                        lastName: "Doe",
                        dateOfBirth: (new Date() - 365 * 30),
                        gender: "F",
                        address: "123 Main St",
                        city: "Gooses",
                        state: "NC",
                        zipcode: "12345",
                        email: "nicolasechavarria@ne.com.co "
                )
                jane.save()
                if (jane.hasErrors()) {
                    println(jane.errors)
                }

                //Users:
                def admin = new User(login:"admin",
                        password:"wordpass",
                        role:"admin")
                admin.save()
                if(admin.hasErrors()){
                    println admin.errors
                }

                def jdoe = new User(login:"jdoe",
                        password:"password",
                        role:"user")
                jdoe.save()
                if(jdoe.hasErrors()){
                    println jdoe.errors
                }
                
            case "test": break
            case "production": break
        }

    }
    def destroy = {
    }
}
