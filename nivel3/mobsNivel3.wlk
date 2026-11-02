import wollok.game.*
import nivel3.*
import mapaNivel3.*
import direcciones.*

object ayudante {
  var property position = game.at(24, 7)
  method image() = "ayudante.png"

  method perseguirA(alumno) {
    const destino = alumno.position()

    if (destino.x() > position.x() and mapaNivel3.esTransitable(derecha.siguientePosicion(position))) {
      position = derecha.siguientePosicion(position)
    } else if (destino.x() < position.x() and mapaNivel3.esTransitable(izquierda.siguientePosicion(position))) {
      position = izquierda.siguientePosicion(position)
    }

    if (destino.y() > position.y() and mapaNivel3.esTransitable(arriba.siguientePosicion(position))) {
      position = arriba.siguientePosicion(position)
    } else if (destino.y() < position.y() and mapaNivel3.esTransitable(abajo.siguientePosicion(position))) {
      position = abajo.siguientePosicion(position)
    }
  }

  method interactuar(personaje) {
    game.say(self, "¡Llegás tarde al parcial!")
    nivel3.restarTiempo(5)
    position = game.at(24, 7)
  }
}