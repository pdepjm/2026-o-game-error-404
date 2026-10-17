import wollok.game.*
import alumno.*
import mobsNivel2.*
import consumiblesNivel2.*
import interfaz.mostrables.*
import interfaz.pantallas.*

object nivel2 {
  var tiempo = 90
  var finalizado = false

  method tiempo() = tiempo

  method iniciar() {
    juego.nivelActual(self)
    tiempo = 90
    finalizado = false

    game.clear()

    const jugador = juego.jugador()
    jugador.position(game.at(1, 7))

    game.addVisual(pantallaNivel2)
    game.addVisual(jugador)

    game.addVisual(pasajeroDormido)
    game.addVisual(pasajeroPesado)
    game.addVisual(pasajeroMochila)
   game.onTick(500, "moverPasajeros", {
    pasajeroDormido.moverse(8, 9)
    pasajeroPesado.moverse(6, 7)
    pasajeroMochila.moverse(7, 8)
})

    game.addVisual(monster)
    game.addVisual(gomitas)
    game.addVisual(gomitas2)

    game.addVisual(nube1)
    game.addVisual(nube2)
    game.addVisual(nube3)
    game.onTick(800, "moverNubes", {
    nube1.moverse()
    nube2.moverse()
    nube3.moverse()
    })

    game.addVisual(exclamacion)
    game.addVisual(relojNivel2Visual)
    game.addVisual(suenoVisual)

    keyboard.w().onPressDo({ jugador.mover(jugador.position().up(1)) })
    keyboard.s().onPressDo({ jugador.mover(jugador.position().down(1)) })
    keyboard.a().onPressDo({ jugador.mover(jugador.position().left(1)) })
    keyboard.d().onPressDo({ jugador.mover(jugador.position().right(1)) })

    game.onCollideDo(jugador, { objetoChocado => objetoChocado.interactuar(jugador) })

    game.onTick(1000, "relojNivel2", { self.pasarSegundo() })
  }

  method pasarSegundo() {
    if (not finalizado) {
      tiempo = (tiempo - 1).max(0)
      const jugador = juego.jugador()
      jugador.aumentarSueno(5)


      if (jugador.sueno() >= 100) {
        self.perder("¡Te quedaste dormido!")
      } else if (tiempo == 0) {
        self.perder("¡El bondi llegó a destino y no alcanzaste la puerta!")
      }
    }
  }

  method posicionPermitida(pos) =
    pos.x().between(1, 28) and pos.y().between(4, 11)

 method ganar() {
    const jugador = juego.jugador()

    if (not finalizado) {
        if (tiempo > 0 and jugador.sueno() < 100) {
            finalizado = true

            game.removeTickEvent("relojNivel2")
            game.removeTickEvent("moverNubes")
            game.removeTickEvent("moverPasajeros")

            game.clear()
            game.addVisual(pantallaGanaste)

            game.schedule(3000, {
                game.stop()
            })
        } else if (jugador.sueno() >= 100) {
            self.perder("¡Te quedaste dormido!")
        } else {
            self.perder("¡Se acabó el tiempo!")
        }
    }
}

 method perder(mensaje) {
    if (not finalizado) {
        finalizado = true
        game.removeTickEvent("relojNivel2")
        game.removeTickEvent("moverNubes")
        game.removeTickEvent("moverPasajeros")

        game.clear()

        if (juego.jugador().sueno() >= 100) {
            game.addVisual(pantallaDormiste)
        } else if( juego.jugador().tiempo() <= 0) {
            game.addVisual(pantallaSinTiempo)
        }
    }
}

  method consumirTiempo(cantidad) {
    tiempo = (tiempo - cantidad).max(0)
  }
}

object relojNivel2Visual {
    method position() = game.at(1, 14)
    method text() = "Tiempo: " + nivel2.tiempo().toString()
    method textColor() = "FFFFFFFF"
    method interactuar(personaje) {}
}