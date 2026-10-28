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

    method interactuar(personaje) 

    method empujar(personaje)
    {
        personaje.mover(personaje.position().left(1))
    }
}

object pasajeroDormido inherits Pasajero(
    position = game.at(25, 8),
    imagen = "pasajero_dormido.png"
) {
    override method interactuar(personaje) {
        game.say(self, "¡Permiso, tengo que pasar!")
        personaje.aumentarSueno(15)
        self.empujar(personaje)
    }
}

object pasajeroPesado inherits Pasajero(
    position = game.at(16, 6),
    imagen = "pasajero_pesado.png"
) {
    override method interactuar(personaje) {
        game.say(self, "¡Pará de empujar!")
        personaje.aumentarSueno(35)
        self.empujar(personaje)
    }
}

object pasajeroMochila inherits Pasajero(
    position = game.at(9, 7),
    imagen = "pasajera_mochila.png"
) {
    override method interactuar(personaje) {
        game.say(self, "¡Cuidado con la mochila!")
        personaje.aumentarSueno(20)
        self.empujar(personaje)
    }
}
class NubeSueno {
    var property position = game.at(0, 0)
    var vida = 25

    method image() = "zzz.png"

    method moverse() {
        if (position.y() > 5) {
            position = position.down(1)
        } else {
            position = game.at(position.x(), 11)
        }
    }

    method recibirDano(cantidad) {
        vida -= cantidad
        if (vida <= 0) {
            game.removeVisual(self)
        }
    }

    method interactuar(personaje) {
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