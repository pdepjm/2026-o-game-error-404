import wollok.game.*
import alumno.*
import mobsNivel2.*
import consumiblesNivel2.*
import interfaz.mostrables.*
import interfaz.pantallas.*

object nivel2 {
  var finalizado = false

  method iniciar() {
    juego.nivelActual(self)
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
    pasajeroDormido.moverse(4, 10)
    pasajeroPesado.moverse(4, 10)
    pasajeroMochila.moverse(4, 10)
    })

    game.addVisual(monster)
    game.addVisual(gomitas)
    game.addVisual(gomitas2)

    game.addVisual(nube1)
    game.addVisual(nube2)
    game.addVisual(nube3)
    game.onTick(170, "moverNubes", {
    nube1.moverse()
    nube2.moverse()
    nube3.moverse()
    })

    game.addVisual(exclamacion)
    game.addVisual(suenoVisual)

    keyboard.w().onPressDo({ jugador.mover(jugador.position().up(1)) })
    keyboard.s().onPressDo({ jugador.mover(jugador.position().down(1)) })
    keyboard.a().onPressDo({ jugador.mover(jugador.position().left(1)) })
    keyboard.d().onPressDo({ jugador.mover(jugador.position().right(1)) })
    keyboard.f().onPressDo({ jugador.disparar() })

    game.onCollideDo(jugador, { objetoChocado => objetoChocado.interactuar(jugador) })

    game.onTick(1000, "suenoReloj", { self.pasarSegundo() })
  }

  method pasarSegundo() {
    if (not finalizado) {
      const jugador = juego.jugador()
      jugador.aumentarSueno(1)


      if (jugador.sueno() >= 100) {
        self.perder("¡Te quedaste dormido!")
      } 
    }
  }

  method posicionPermitida(pos) =
    pos.x().between(1, 28) and pos.y().between(4, 11)

 method ganar() {
    const jugador = juego.jugador()

    if (not finalizado) {
        if (jugador.sueno() < 100) {
            finalizado = true

            game.removeTickEvent("suenoReloj")
            game.removeTickEvent("moverNubes")
            game.removeTickEvent("moverPasajeros")

            game.clear()
            game.addVisual(pantallaNivel2Completo)

            game.schedule(3000, {
                game.stop()
            })
        } else if (jugador.sueno() >= 100) {
            self.perder("¡Te quedaste dormido!")
        } 
    }
}

 method perder(mensaje) {
    if (not finalizado) {
        finalizado = true
        game.removeTickEvent("suenoReloj")
        game.removeTickEvent("moverNubes")
        game.removeTickEvent("moverPasajeros")

        game.clear()

        if (juego.jugador().sueno() >= 100) {
            game.addVisual(pantallaDormiste)
        } 
    }
}

}
