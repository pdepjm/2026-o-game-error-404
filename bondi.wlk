import wollok.game.*
import alumno.*

object bondi{
    const precioBoleto = 670
    method precioBoleto()=precioBoleto
    method image() = "bondi.png"
    var property position = game.at(1, 1)

    method aparecer(){
        game.addVisual(self)
        alumno.agregarTiempo(15)
        game.say(self, "¡Llegó el bondi! Tenés 15 segundos para subirte")
    }

    method interactuar(personaje){
        if(personaje.subirAlBondi()){
            game.say(self, "Te alcanza, subite")
            game.schedule(1500, { game.stop() })
        } else {
            game.say(self, "No llegas, bajate que la gente está yendo al trabajo pibe")
            game.schedule(1500, { game.stop() })
        }

    }
}