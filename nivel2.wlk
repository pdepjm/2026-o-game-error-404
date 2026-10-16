import wollok.game.*
import alumno.*
import pantallas.*
import mobsNivel2.*
import consumiblesNivel2.*
import mostrables.*

object nivel2 {
  var tiempo = 90
  var finalizado = false

  method tiempo() = tiempo

  method iniciar() {
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

    game.addVisual(monster)
    game.addVisual(gomitas)
    game.addVisual(gomitas2)

    game.addVisual(nubeSueno)
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

      if (jugador.sueno() >= 40) {
        nubeSueno.mostrar()
      } else {
        nubeSueno.ocultar()
      }

      if (jugador.sueno() >= 100) {
        self.perder("¡Te quedaste dormido!")
      } else if (tiempo == 0) {
        self.perder("¡El bondi llegó a destino y no alcanzaste la puerta!")
      }
    }
  }

  method ganar() {
    if (not finalizado) {
      finalizado = true
      game.removeTickEvent("relojNivel2")
      game.say(juego.jugador(), "¡Llegaste a la puerta! ¡A rendir!")
      game.schedule(1500, { game.stop() })
    }
  }

  method perder(mensaje) {
    if (not finalizado) {
      finalizado = true
      game.removeTickEvent("relojNivel2")
      game.say(juego.jugador(), mensaje)
      game.schedule(1500, { game.stop() })
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