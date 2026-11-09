import wollok.game.*
import alumno.*
import nivel2.*
import efectos.*
import interfaz.pantallas.*
import direcciones.*


class Pasajero {
    var property position
    var direccion = arriba
    const imagen
    const mensaje
    const cantidadSueno

    method image() = imagen

   method moverse(limiteInferior, limiteSuperior) {
    if (direccion.llegoAlLimite(position, limiteInferior, limiteSuperior)) {
        direccion = direccion.opuesta()
    }

    position = direccion.siguientePosicion(position)
    }
    method interactuar(personaje)
    {
        game.say(self, mensaje)
        personaje.aumentarSueno(cantidadSueno)
        self.empujar(personaje)
    } 

    method empujar(personaje)
    {
        personaje.mover(personaje.position().left(1))
    }
}

const pasajeroDormido = new Pasajero(
    position = game.at(25, 8),
    imagen = "pasajero_dormido.png",
    mensaje = "¡Permiso, tengo que pasar!",
    cantidadSueno = 15
)

const pasajeroPesado = new Pasajero(
    position = game.at(16, 6),
    imagen = "pasajero_pesado.png",
    mensaje = "¡Pará de empujar!",
    cantidadSueno = 35
)

const pasajeroMochila = new Pasajero(
    position = game.at(9, 7),
    imagen = "pasajera_mochila.png",
    mensaje = "¡Cuidado con la mochila!",
    cantidadSueno = 20
)
 
  
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
        personaje.aumentarSueno(25)
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