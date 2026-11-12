
import wollok.game.*
import consumible.*
import nivel3.*
import interfaz.mostrables.*
import alumno.*

class ItemExamen inherits Consumible {
  const property nombre
  const mensaje

  override method aplicarEfecto(personaje) {
    nivel3.recolectar(self)
    game.say(personaje, mensaje)
  }
}

const id = new ItemExamen(
  nombre = "id",
  imagen = "id.png",
  position = game.at(5, 12),
  mensaje = "¡Encontraste tu legajo!"
)

const dni = new ItemExamen(
  nombre = "dni",
  imagen = "dni.png",
  position = game.at(10, 2),
  mensaje = "¡Encontraste tu DNI!"
)

const hojaFormulas = new ItemExamen(
  nombre = "hojaFormulas",
  imagen = "hojaFormulas.png",
  position = game.at(15, 12),
  mensaje = "¡Encontraste la hoja de fórmulas!"
)

const utiles = new ItemExamen(
  nombre = "utiles",
  imagen = "utiles.png",
  position = game.at(24, 2),
  mensaje = "¡Encontraste los útiles!"
)

class Aula {
  const property numero
  const property position

  method activarMeta() {
    metaExamen.position(position)
    game.addVisual(metaExamen)
  }

  method estaAsignada() = true
}

object sinAula{
  method estaAsignada() = false
}

object metaExamen {
  var property position = game.at(0, 0)
  method image() = "exclamacion.gif"

  method interactuar(personaje) {
    if (nivel3.puedeRendir()) {
      nivel3.ganar()
    } else {
      game.say(personaje, "¡Todavía me faltan cosas para rendir!")
    }
  }
}


