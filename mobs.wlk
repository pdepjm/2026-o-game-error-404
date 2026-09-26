import wollok.game.*
import efectos.*

object fisura{
    method image() = "fisura.png"
    var property position = game.at(7, 10)
    var direccion = 1

    method moverse() {
        if (position.x() >= 12) {
            direccion = -1
        } else if (position.x() <= 7) {
            direccion = 1
        }
        position = position.right(direccion)
    }

    method interactuar(personaje){
        game.say(self, "Eh wacho dame todo")
        robo.aplicarEfecto(personaje)
        frenar.aplicarEfecto(personaje)
    }

}

object vecino{
    method image() = "vecino.png"
    var property position = game.at(13, 10)

    method interactuar(personaje){
        game.say(self, "Tomá, un café")
        cafe.aplicarEfecto(personaje)
        game.schedule(2000, { game.removeVisual(self) })
    }
}

object policia{
    method image() = "policia.png"
    var property position = game.at(19, 1)
    var direccion = 1

    method moverse() {
        if (position.y() >= 5) {
            direccion = -1
        } else if (position.y() <= 1) {
            direccion = 1
        }
        position = position.up(direccion)
    }

    method interactuar(personaje){
        game.say(self, "A ver mostrame los documentos, veni a la comisaría")
        meterEnCana.aplicarEfecto(personaje)
    }
}


object kiosco {
    var property position = game.at(9, 11)
    method image() = "kiosco.png"
    method interactuar(personaje) {
        game.say(self, "Te cargo 500")
        game.schedule(2000, { game.say(self, "") })
        personaje.cargarSube(500)
    }
}

