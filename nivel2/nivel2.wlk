import wollok.game.*
import alumno.*
import mobsNivel2.*
import consumiblesNivel2.*
import interfaz.mostrables.*
import interfaz.pantallas.*
import nivel1.nivel1.*
import efectos.*
import controles.*
import claseNivel.*



object nivel2 inherits Nivel() {

  var finalizado = false

  method iniciar() {

    juego.estadoPantalla("nivel2")
    self.preparar()
    finalizado = false

    const jugador = juego.jugador()
    jugador.position(game.at(1, 7))

    game.addVisual(pantallaNivel2)
    game.addVisual(jugador)
    [ pasajeroDormido,
      pasajeroPesado,
      pasajeroMochila,
      monster,
      gomitas,
      gomitas2,
      nube1,
      nube2,
      nube3,
      exclamacion,
      suenoVisual
     ].forEach({ elemento =>
        game.addVisual(elemento)
      })

    game.onTick(500, "moverPasajeros", {
      pasajeroDormido.moverse(4, 10)
      pasajeroPesado.moverse(4, 10)
      pasajeroMochila.moverse(4, 10)
    })

    
    game.onTick(170, "moverNubes", {
      nube1.moverse()
      nube2.moverse()
      nube3.moverse()
    })

    controles.keyboardControls(jugador)

    keyboard.f().onPressDo({
      jugador.disparar()
    })

    game.onCollideDo(jugador, {
      objetoChocado =>
        objetoChocado.interactuar(jugador)
    })

    game.onTick(1000, "suenoReloj", {
      self.suenioPorSegundo()
    })
  }

  method suenioPorSegundo() {
    if (not finalizado) {
      const jugador = juego.jugador()
      jugador.aumentarSueno(1)

      if (jugador.sueno() >= 40) {
        self.perder("¡Te quedaste dormido!")
      }
    }
  }

  method posicionPermitida(pos) =
    pos.x().between(1, 28) and
    pos.y().between(4, 11)

  method ganar() {
    if (not finalizado) {
      const jugador = juego.jugador()

      if (jugador.sueno() < 40) {
        finalizado = true
        self.finalizarCon(pantallaNivel2Completo)

        game.schedule(3000, {
          game.stop()
        })
      } else {
        self.perder("¡Te quedaste dormido!")
      }
    }
  }

  method perder(mensaje) {
    if (not finalizado) {
      finalizado = true
      self.finalizarCon(pantallaDormiste)
      juego.estadoPantalla("volverMenu")
    }
  }

  override method eventosAEliminar() = [
    "suenoReloj",
    "moverNubes",
    "moverPasajeros"
  ]
}

/*
object nivel2 inherits Nivel() {
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
    
    controles.keyboardControls(jugador)
    
    keyboard.f().onPressDo({ jugador.disparar() })

    game.onCollideDo(jugador, { objetoChocado => objetoChocado.interactuar(jugador) })

    game.onTick(1000, "suenoReloj", { self.suenioPorSegundo() })
  }

  method suenioPorSegundo() {
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
    self.limpiarEventos()
    game.clear()
    game.addVisual(pantallaDormiste)
  }
}

override method eventosAEliminar() = [
    "suenoReloj",
    "moverNubes",
    "moverPasajeros"
  ]

}

*/