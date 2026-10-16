import wollok.game.*
import alumno.*
import nivel2.*
import efectos.*
import interfaz.pantallas.*

object pasajeroDormido {
    var property position = game.at(7, 6)
    method image() = "pasajeroDormido.png"

    method interactuar(personaje) {
        game.say(self, "¡Permiso, tengo que pasar!")
        nivel2.consumirTiempo(3)
        personaje.aumentarSueno(5)
    }
}

object pasajeroPesado {
    var property position = game.at(12, 8)
    method image() = "pasajero.png"

    method interactuar(personaje) {
        game.say(self, "Pará de empujar!")
        nivel2.consumirTiempo(5)
    }
}

object pasajeroMochila {
    var property position = game.at(19, 6)
    method image() = "pasajeroMochila.png"

    method interactuar(personaje) {
        game.say(self, "Cuidado con la mochila!")
        nivel2.consumirTiempo(5)
        personaje.aumentarSueno(10)
    }
}

object nubeSueno {
    var visible = false
    var property position = game.at(1, 6)
    method image() = "zzz.png"

    method mostrar() {
        position = juego.jugador().position().up(1)
        if (not visible) {
            visible = true
            game.addVisual(self)
        }
    }

    method ocultar() {
        if (visible) {
            visible = false
            game.removeVisual(self)
        }
    }

    method interactuar(personaje) {}
}

object exclamacion {
    var property position = game.at(28, 7)
    method image() = "exclamacion.gif"

    method interactuar(personaje) {
        nivel2.ganar()
    }
}