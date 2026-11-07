import wollok.game.*
import alumno.*
import interfaz.pantallas.*
import nivel1.nivel1.*
import nivel2.nivel2.*
import nivel3.nivel3.*

class Estado {
  method activar() {}
}

object estadoMenu inherits Estado {
  override method activar() {
    menuPrincipal.mostrar()
  }
}

object estadoInstrucciones inherits Estado {
  override method activar() {
    instrucciones.mostrar()
  }
}

object estadoNivel1 inherits Estado {
  override method activar() {
    nivel1.iniciar()
  }
}

object estadoNivel2 inherits Estado {
  override method activar() {
    nivel2.iniciar()
  }
}

object estadoNivel3 inherits Estado {
  override method activar() {
    nivel3.iniciar()
  }
}

object estadoPasarNivel3 inherits Estado {
  override method activar() {
    game.clear()
    game.addVisual(pantallaNivel2Completo)

    keyboard.enter().onPressDo({
      juego.cambiarEstado(estadoNivel3)
    })
  }
}

object estadoVolverMenu inherits Estado {
  method volverAlMenu() {
    juego.puedeReiniciarNivel(false)
    juego.jugador().reiniciar()
    juego.cambiarEstado(estadoMenu)
  }
}

object estadoPasarNivel2 inherits Estado {
  override method activar() {
    game.clear()
    game.addVisual(pantallaGanaste)

    keyboard.enter().onPressDo({
      juego.cambiarEstado(estadoNivel2)
    })
  }
}