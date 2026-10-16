import wollok.game.*
import alumno.*
import bondi.*
import consumibles.*
import efectos.*
import mobs.*
import interfaz.mostrables.*
import interfaz.pantallas.*

object reloj {
  method position() = game.at(1, 14)
  method text() = "Tiempo: " + juego.jugador().tiempo().toString()
  method textColor() = "FFFFFFFF"
  method interactuar(personaje) {}
}

object nivel1 {
  var llegoBondi = false

  method llegoBondi() = llegoBondi

  method iniciar() {
    juego.nivelActual(self)
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
    const jugador = juego.jugador()
    jugador.pasarSegundo()

    if (jugador.tiempo() == 0 and not llegoBondi) {
      llegoBondi = true
      bondi.aparecer()
    }   else if (jugador.tiempo() == 0 and llegoBondi) {
      game.removeTickEvent("relojNivel1")
      game.say(jugador, "Uh la pucha, se me fue el bondi")
      game.schedule(1500, {
        game.clear()
        game.addVisual(pantallaSinTiempo)
      })
    }
  }

  
  method posicionPermitida(pos) = not self.estaEnZonaBloqueada(pos)

  method estaEnZonaBloqueada(pos) {
    const x = pos.x()
    const y = pos.y()

    // manzana izquierda (la del kiosco)
    const casasArribaIzq = (x <= 16 and y >= 12)
    const cercaIzqKiosco = (x <= 6 and y == 11)
    const cercaDerKiosco = (x >= 13 and x <= 16 and y == 11)

    // manzana derecha arriba
    const casasArribaDer = (x >= 22 and y >= 11)

    // manzana abajo (la de la parada)
    const casasAbajoDer = (x >= 22 and y >= 1 and y <= 5)

    return casasArribaIzq or casasArribaDer or casasAbajoDer or cercaIzqKiosco or cercaDerKiosco
  }

}