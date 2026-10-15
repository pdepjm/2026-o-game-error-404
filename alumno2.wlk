import wollok.game.*
import alumno.*
import pantallas.*
import mobsNivel2.*
import consumiblesNivel2.*
//OTRO ARCHIVO PORQUE TIENE COSAS DISTINTAS. no repite codigo.
object alumnoNivel2 {
    var jugador= pinguino
    var tiempo = 90
    var sueno = 0
    var finalizado = false

 method iniciar(personaje) {
    jugador = personaje
    tiempo = 90
    sueno = 0
    finalizado = false


    game.title("No te pases de la parada")
    game.width(30)
    game.height(15)

   
    game.addVisual(pantallaNivel2)
    jugador.position(game.at(1, 7))
    game.addVisual(jugador)

    game.addVisual(pasajeroDormido)
    game.addVisual(pasajeroPesado)
    game.addVisual(pasajeroMochila)

    game.addVisual(monster)
    game.addVisual(gomitas)
    game.addVisual(gomitas2)

    game.addVisual(nubeSueno)
    game.addVisual(puertaNivel2)

    keyboard.w().onPressDo({
        jugador.mover(jugador.position().up(1))
    })
    keyboard.s().onPressDo({
        jugador.mover(jugador.position().down(1))
    })
    keyboard.a().onPressDo({
        jugador.mover(jugador.position().left(1))
    })
    keyboard.d().onPressDo({
        jugador.mover(jugador.position().right(1))
    })

    game.onCollideDo(jugador, {
        objetoChocado => objetoChocado.interactuar(jugador)
    })

    game.onTick(1000, "relojNivel2", {
        self.pasarSegundo()
    })
}
    method jugador() = jugador
    method posicionJugador() = jugador.position()
    method tiempo() = tiempo
    method sueno() = sueno
    method finalizado() = finalizado

    method consumirTiempo(cantidad) {
        tiempo = (tiempo - cantidad).max(0)
    }

    method aumentarSueno(cantidad) {
        sueno = (sueno + cantidad).min(100)
    }

    method reducirSueno(cantidad) {
        sueno = (sueno - cantidad).max(0)
    }

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
            game.say(jugador, "¡Llegaste a la puerta! ¡A rendir!")
            game.schedule(1500, {
                game.stop()
            })
        }
    }

    method perder(mensaje) {
        if (not finalizado) {
            finalizado = true
            game.say(jugador, mensaje)
            game.schedule(1500, {
                game.stop()
            })
        }
    }

    method llegarALaPuerta() {
        if (tiempo > 0 and sueno < 100) {
            self.ganar()
        }
    }

    
}