import wollok.game.*
import pantallas.*
import mobsNivel2.*
import consumiblesNivel2.*

object alumnoNivel2 {
    var tiempo = 90
    var sueno = 0
    var finalizado = false

    var property position = game.at(1, 7)

    method image() = "alumno.gif"

    method mover(nuevaPosicion) {
        if (nuevaPosicion.x() >= 0 and
            nuevaPosicion.x() < game.width() and
            nuevaPosicion.y() >= 0 and
            nuevaPosicion.y() < game.height()) {
            position = nuevaPosicion
        }
    }

    method consumirTiempo(cantidad) {
        tiempo = (tiempo - cantidad).max(0)
    }

    method aumentarSueno(cantidad) {
        sueno = (sueno + cantidad).min(100)
    }

    method reducirSueno(cantidad) {
        sueno = (sueno - cantidad).max(0)
    }

    method tiempo() = tiempo
    method sueno() = sueno
    method finalizado() = finalizado

    method pasarSegundo() {
        if (not finalizado) {
            tiempo = (tiempo - 1).max(0)
            self.aumentarSueno(5)

            if (sueno >= 40) {
                nubeSueno.mostrar()
            } else {
                nubeSueno.ocultar()
            }

            if (sueno >= 100) {
                self.perder("¡Te quedaste dormido!")
            } else if (tiempo == 0) {
                self.perder("¡El bondi llegó a destino y no alcanzaste la puerta!")
            }
        }
    }

    method ganar() {
        if (not finalizado) {
            finalizado = true
            game.say(self, "¡Llegaste a la puerta! ¡A rendir!")
            game.schedule(1500, { game.stop() })
        }
    }

    method perder(mensaje) {
        if (not finalizado) {
            finalizado = true
            game.say(self, mensaje)
            game.schedule(1500, { game.stop() })
        }
    }

    method llegarALaPuerta() {
    if (tiempo > 0 and sueno < 100) {
        self.ganar()
    }
    }

    method iniciar() {
    game.clear()

    game.title("No te pases de la parada")
    game.width(30)
    game.height(15)
    game.boardGround("fondoBondi.png")

    game.addVisual(self)

    game.addVisual(pasajeroDormido)
    game.addVisual(pasajeroPesado)
    game.addVisual(pasajeroMochila)

    game.addVisual(monster)
    game.addVisual(gomitas)
    game.addVisual(gomitas2)

    game.addVisual(nubeSueno)
    game.addVisual(puertaNivel2)

    game.onCollideDo(self, {
        objetoChocado =>
            objetoChocado.interactuar(self)
    })

    game.onTick(1000, "relojNivel2", {
        self.pasarSegundo()
    })
}
}

