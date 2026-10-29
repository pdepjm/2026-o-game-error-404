import wollok.game.*
import alumno.*
import bondi.*
import consumibles.*
import efectos.*
import mobs.*
import interfaz.mostrables.*
import interfaz.pantallas.*
import controles.*
import fases.*
import claseNivel.*


// Conservá también el import del paquete donde definiste
// faseEsperandoBondi, si está en otro archivo/paquete.

object nivel1 inherits Nivel() {

  var faseActual = faseEsperandoBondi

  method iniciar() {
    juego.estadoPantalla("nivel1")
    self.preparar()
    faseActual = faseEsperandoBondi
    
    const jugadorElegido = juego.jugador()
    jugadorElegido.position(game.at(0, 0))

    game.addVisual(fondoMapa)
    game.addVisual(jugadorElegido)

  [
  reloj,
  plata,
  saldo,
  sube,
  kiosco,
  fisura,
  vecino,
  policia,
  billete100,
  billete200,
  billete500,
  billete1000,
  autoRojo,
  autoAzul,
  autoVerde,
  taxi
].forEach({ elemento =>
  game.addVisual(elemento)
})
   
    controles.keyboardControls(jugadorElegido)

    game.onCollideDo(jugadorElegido, {
      objetoChocado =>
        objetoChocado.interactuar(jugadorElegido)
    })

    game.onTick(150, "seMueveFisura", { fisura.moverse() })
    game.onTick(100, "seMuevePolicia", { policia.moverse() })

    game.onTick(60, "moverAutos", {
      autoRojo.moverse()
      autoAzul.moverse()
      autoVerde.moverse()
      taxi.moverse()
    })

    game.onTick(1000, "relojNivel1", {
      self.pasarSegundo()
    })


  }

  method pasarSegundo() {
    faseActual.pasarSegundo()
  }

  method cambiarFase(faseNueva) {
    faseActual = faseNueva
  }


  method terminarPorTiempo() {
    game.say(juego.jugador(), "Uh la pucha, se me fue el bondi")

    game.schedule(1500, {
        self.finalizarCon(pantallaSinTiempo)
        juego.estadoPantalla("volverMenu")
    })
}

  method posicionPermitida(pos) =
    not self.estaEnZonaBloqueada(pos)

  method estaEnZonaBloqueada(pos) {
    const x = pos.x()
    const y = pos.y()

    // Manzana izquierda (la del kiosco)
    const casasArribaIzq =
      x <= 16 and y >= 12

    const cercaIzqKiosco =
      x <= 6 and y == 11

    const cercaDerKiosco =
      x >= 13 and x <= 16 and y == 11

    // Manzana derecha arriba
    const casasArribaDer =
      x >= 22 and y >= 11

    // Manzana abajo (la de la parada)
    const casasAbajoDer =
      x >= 22 and y >= 1 and y <= 5

    return casasArribaIzq or
      casasArribaDer or
      casasAbajoDer or
      cercaIzqKiosco or
      cercaDerKiosco
  }

  override method eventosAEliminar() = [
    "relojNivel1",
    "seMueveFisura",
    "seMuevePolicia",
    "moverAutos"
  ]
}





/*
object reloj {
  method position() = game.at(1, 14)
  method text() = "Tiempo: " + juego.jugador().tiempo().toString()
  method textColor() = "FFFFFFFF"
  method interactuar(personaje) {}
}

object nivel1 inherits Nivel() {
  var faseActual = faseEsperandoBondi

  method iniciar() {
      self.preparar()
      llegoBondi = false

      game.addVisual(fondoMapa)

      const jugadorElegido = juego.jugador()
      jugadorElegido.position(game.at(0, 0))
      game.addVisual(jugadorElegido)


    juego.nivelActual(self)
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

    controles.keyboardControls(jugadorElegido)

    game.onCollideDo(jugadorElegido, { objetoChocado => objetoChocado.interactuar(jugadorElegido) })

    game.onTick(150, "seMueveFisura", { fisura.moverse() })
    game.onTick(100, "seMuevePolicia", { policia.moverse() })

    game.onTick(60, "mueveRojo", { autoRojo.moverse() })
    game.onTick(60, "mueveAzul", { autoAzul.moverse() })
    game.onTick(60, "mueveVerde", { autoVerde.moverse() })
    game.onTick(60, "mueveTaxi", { taxi.moverse() })

    game.onTick(1000, "relojNivel1", { self.pasarSegundo() })
  }

  method pasarSegundo(){
    faseActual.pasarSegundo()
  }

  method cambiarFase(faseNueva) {
    faseActual = faseNueva
  }

  method terminarPorTiempo() {
    game.removeTickEvent("relojNivel1")
    game.say(juego.jugador(), "Uh la pucha, se me fue el bondi")
    game.schedule(1500, {
        game.clear()
        game.addVisual(pantallaSinTiempo)
      })
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

    override method eventosAEliminar() = [
      "relojNivel1",
      "seMueveFisura",
      "seMuevePolicia",
      "mueveRojo",
      "mueveAzul",
      "mueveVerde",
      "mueveTaxi"
]
}
*/