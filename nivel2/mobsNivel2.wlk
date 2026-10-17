import wollok.game.*
import alumno.*
import nivel2.*
import efectos.*
import interfaz.pantallas.*


class Pasajero {
    var property position
    var subiendo = true
    const imagen

    method image() = imagen

    method moverse(limiteInferior, limiteSuperior) {
        if (subiendo) {
            if (position.y() < limiteSuperior) {
                position = position.up(1)
            } else {
                subiendo = false
            }
        } else {
            if (position.y() > limiteInferior) {
                position = position.down(1)
            } else {
                subiendo = true
            }
        }
    }

    method interactuar(personaje) {}
}

object pasajeroDormido inherits Pasajero(
    position = game.at(22, 8),
    imagen = "pasajeroDormido.png"
) {
    override method interactuar(personaje) {
        game.say(self, "¡Permiso, tengo que pasar!")
        nivel2.consumirTiempo(3)
        personaje.aumentarSueno(5)
    }
}

object pasajeroPesado inherits Pasajero(
    position = game.at(15, 6),
    imagen = "pasajero.png"
) {
    override method interactuar(personaje) {
        game.say(self, "¡Pará de empujar!")
        nivel2.consumirTiempo(5)
    }
}

object pasajeroMochila inherits Pasajero(
    position = game.at(8, 7),
    imagen = "pasajeroMochila.png"
) {
    override method interactuar(personaje) {
        game.say(self, "¡Cuidado con la mochila!")
        nivel2.consumirTiempo(5)
        personaje.aumentarSueno(10)
    }
}
class NubeSueno {
    // Cada nube tendrá su propia posición independiente en el mapa
    var property position = game.at(0, 0)

    method image() = "zzz.png"

 method moverse() {
    if (position.y() > 5) {
        position = position.down(1)
    } else {
        position = game.at(position.x(), 11)
    }
}

    method interactuar(personaje) {
        // Si el alumno choca con la nube, le puede sumar sueño o restarle tiempo
        personaje.aumentarSueno(15)
        game.say(personaje, "¡Ay, me da sueño esta nube!")
    }
}


const nube1 = new NubeSueno(position = game.at(8, 5))
const nube2 = new NubeSueno(position = game.at(15, 9))
const nube3 = new NubeSueno(position = game.at(21, 4))




object exclamacion {
    var property position = game.at(27, 9)
    method image() = "exclamacion.gif"

    method interactuar(personaje) {
        nivel2.ganar()
    }
}