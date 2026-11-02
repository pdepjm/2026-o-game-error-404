
import wollok.game.*
import alumno.*
import interfaz.pantallas.*
import nivel1.nivel1.*

class Nivel {

  method preparar() {
    self.limpiarEventos()
    game.clear()
    juego.nivelActual(self)
  }

  method limpiarEventos() {
    self.eventosAEliminar().forEach({ evento =>
      game.removeTickEvent(evento)
    })
  }

  method eventosAEliminar() = []

method finalizarCon(pantalla) {
  self.limpiarEventos()
  game.clear()
  game.addVisual(pantalla)
 

  keyboard.r().onPressDo({
      juego.jugador().reiniciar()
      juego.estadoPantalla("menu")
      menuPrincipal.mostrar()
  })
}
}