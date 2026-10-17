import wollok.game.*
import alumno.*
import nivel2.*
import efectos.*
import interfaz.pantallas.*

object pasajeroDormido {
    var property position = game.at(22, 8)
    method image() = "pasajeroDormido.png"

    method interactuar(personaje) {
        game.say(self, "¡Permiso, tengo que pasar!")
        nivel2.consumirTiempo(3)
        personaje.aumentarSueno(5)
    }

    var subiendo = true

    method moverse() {
    if (subiendo) {
        if (position.y() < 9) {
            position = position.up(1)
        } else {
            subiendo = false
        }
    } else {
        if (position.y() > 8) {
            position = position.down(1)
        } else {
            subiendo = true
        }
    }
}
}

object pasajeroPesado {
    var property position = game.at(15, 6)
    method image() = "pasajero.png"
    var subiendo = true
    method interactuar(personaje) {
        game.say(self, "Pará de empujar!")
        nivel2.consumirTiempo(5)
    }
    method moverse() {
        if (subiendo) {
            if (position.y() < 7) {
                position = position.up(1)
            } else {
                subiendo = false
            }
        } else {
            if (position.y() > 6) {
                position = position.down(1)
            } else {
                subiendo = true
            }
        }
    }

}

object pasajeroMochila {
    var property position = game.at(8, 7)
    method image() = "pasajeroMochila.png"
    var subiendo = true
    
    method interactuar(personaje) {
        game.say(self, "Cuidado con la mochila!")
        nivel2.consumirTiempo(5)
        personaje.aumentarSueno(10)
    }

    method moverse() {
        if (subiendo) {
            if (position.y() < 8) {
                position = position.up(1)
            } else {
                subiendo = false
            }
        } else {
            if (position.y() > 7) {
                position = position.down(1)
            } else {
                subiendo = true
            }
        }
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