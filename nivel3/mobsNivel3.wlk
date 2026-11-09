import wollok.game.*
import nivel3.*
import mapaNivel3.*
import direcciones.*

object ayudante {
  var property position = game.at(24, 7)
  method image() = "ayudante.png"

  method distanciaEntre(posicion, destino) =
    (posicion.x() - destino.x()).abs() +
    (posicion.y() - destino.y()).abs()

  method perseguirA(alumno) {
    const destino = alumno.position()
    const direcciones = [derecha, izquierda, arriba, abajo]

    const direccionesPosibles = direcciones.filter({ direccion =>
        mapaNivel3.esTransitable(direccion.siguientePosicion(position))
    })

    if (direccionesPosibles.size() > 0) {
        const mejorDireccion = direccionesPosibles.min({ direccion =>
            self.distanciaEntre(direccion.siguientePosicion(position), destino)
        })

        position = mejorDireccion.siguientePosicion(position)
    }
}
}