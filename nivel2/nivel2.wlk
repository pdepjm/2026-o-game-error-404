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
import nivel3.nivel3.*
import estados.*
import sonidos.*

object nivel2 inherits Nivel() {

  var estado = enCurso

  method iniciar() {
    estado = enCurso

    juego.estadoActual(estadoNivel2)
    self.preparar()

    const jugador = juego.jugador()
    jugador.position(game.at(1, 7))

    game.addVisual(pantallaNivel2)
    game.addVisual(jugador)

    [
      pasajeroDormido, pasajeroPesado, pasajeroMochila, monster, cancion,
      gomitas,nube1, nube2, nube3, exclamacion, suenoVisual
    ].forEach({ elemento => game.addVisual(elemento) })

    game.onTick(300, "moverPasajeros", {
      pasajeroDormido.moverse(4, 10)
      pasajeroPesado.moverse(4, 10)
      pasajeroMochila.moverse(4, 10)
    })

    game.onTick(100, "moverNubes", {
      nube1.moverse()
      nube2.moverse()
      nube3.moverse()
    })


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
    estado.suenioPorSegundo(self)
  }

  method aumentarSueno() {
    const jugador = juego.jugador()
    jugador.aumentarSueno(1)

    if (jugador.sueno() >= 50) {
      self.perder()
    }
  }

  method posicionPermitida(pos) =
    pos.x().between(1, 28) and
    pos.y().between(4, 11)

  method ganar() {
    estado.ganar(self)
  }

  method ganarEnCurso() {
    const jugador = juego.jugador()

    if (jugador.sueno() < 50) {
      estado = finalizado
     
      self.limpiarEventos()
      sonidos.ganar()
      juego.cambiarEstado(estadoPasarNivel3)
    }

    if (jugador.sueno() >= 50) {
      self.perder()
    }
  }

  method perder() {
    estado.perder(self)
  }

  method perderEnCurso() {
    estado = finalizado
    
    self.limpiarEventos()
    sonidos.detenerMusica()
    self.finalizarCon(pantallaDormido)
    sonidos.perder()
   
    juego.estadoActual(estadoVolverMenu)
    juego.puedeReiniciarNivel(true)
  }

  override method eventosAEliminar() = [
    "suenoReloj",
    "moverNubes",
    "moverPasajeros"
  ]
}