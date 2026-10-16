import wollok.game.*
import alumno.*
import bondi.*
import consumibles.*
import efectos.*
import mobs.*
import mostrables.*
import pantallas.*

object reloj {
  method position() = game.at(1, 14)
  method text() = "Tiempo: " + nivel1.tiempo().toString()
  method textColor() = "FFFFFFFF"
  method interactuar(personaje) {}
}

object nivel1 {
  var tiempo = 100
  var llegoBondi = false

  method tiempo() = tiempo
  method llegoBondi() = llegoBondi

  method iniciar() {
    tiempo = juego.jugador().tiempo()
    llegoBondi = false
    game.clear()

    game.addVisual(fondoMapa)

    const jugadorElegido = juego.jugador()
    jugadorElegido.position(game.at(0, 0))
    game.addVisual(jugadorElegido)

    game.addVisual(reloj)
    game.addVisual(plata)
    game.addVisual(saldo)

    game.addVisual(sube)
    game.addVisual(kiosco)
    game.addVisual(fisura)
    game.addVisual(vecino)
    game.addVisual(policia)

    game.addVisual(billete100)
    game.addVisual(billete200)
    game.addVisual(billete500)
    game.addVisual(billete1000)

    game.addVisual(autoRojo)
    game.addVisual(autoAzul)
    game.addVisual(autoVerde)
    game.addVisual(taxi)

    keyboard.w().onPressDo({ jugadorElegido.mover(jugadorElegido.position().up(1)) })
    keyboard.s().onPressDo({ jugadorElegido.mover(jugadorElegido.position().down(1)) })
    keyboard.a().onPressDo({ jugadorElegido.mover(jugadorElegido.position().left(1)) })
    keyboard.d().onPressDo({ jugadorElegido.mover(jugadorElegido.position().right(1)) })
    
    game.onCollideDo(jugadorElegido, { objetoChocado => objetoChocado.interactuar(jugadorElegido) })

    game.onTick(150, "seMueveFisura", { fisura.moverse() })
    game.onTick(100, "seMuevePolicia", { policia.moverse() })

    game.onTick(60, "mueveRojo", { autoRojo.moverse() })
    game.onTick(60, "mueveAzul", { autoAzul.moverse() })
    game.onTick(60, "mueveVerde", { autoVerde.moverse() })
    game.onTick(60, "mueveTaxi", { taxi.moverse() })

    game.onTick(1000, "relojNivel1", { self.pasarSegundo() })
  }

  method pasarSegundo() {
    tiempo = (tiempo - 1).max(0)

    if (tiempo == 0 and not llegoBondi) {
      llegoBondi = true
      bondi.aparecer()
    } else if (tiempo == 0 and llegoBondi) {
      game.removeTickEvent("relojNivel1")
      game.say(juego.jugador(), "Uh la pucha, se me fue el bondi")
      game.schedule(1500, {
        game.clear()
        game.addVisual(pantallaSinTiempo)
      })
    }
  }

  method agregarTiempo(cantidad) {
    tiempo += cantidad
  }

  method consumirTiempo(cantidad) {
    tiempo = (tiempo - cantidad).max(0)
  }
}