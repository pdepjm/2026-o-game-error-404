
import wollok.game.*
import consumible.*
import nivel3.*
import interfaz.mostrables.*
import alumno.*
object id inherits Consumible(
  imagen = "id.png",
  position = game.at(7, 9)
) {
  override method aplicarEfecto(personaje) {
    nivel3.conseguirID()
    game.say(personaje, "¡Encontraste tu legajo!")
  }
}

object dni inherits Consumible(
  imagen = "dni.png",
  position = game.at(10, 9)
) {
  override method aplicarEfecto(personaje) {
    nivel3.conseguirDNI()
    game.say(personaje, "¡Encontraste tu DNI!")
  }
}

object hojaFormulas inherits Consumible(
  imagen = "hojaFormulas.png",
  position = game.at(14, 7)
) {
  override method aplicarEfecto(personaje) {
    nivel3.conseguirHojaFormulas()
    game.say(personaje, "¡Encontraste la hoja de fórmulas!")
  }
}

object utiles inherits Consumible(
  imagen = "utiles.png",
  position = game.at(25, 8)
) {
  override method aplicarEfecto(personaje) {
    nivel3.conseguirUtiles()
    game.say(personaje, "¡Encontraste los útiles!")
  }
}

object exclamacionNivel3 {
  var property position = game.at(1, 1)

  method image() = "exclamacion.gif"

 method aparecerEnAula(unAula) {
  if (unAula == 201) { self.position(game.at(6, 12)) }
  if (unAula == 202) { self.position(game.at(11, 12)) }
  if (unAula == 203) { self.position(game.at(15, 12)) }
  if (unAula == 204) { self.position(game.at(20, 12)) }
  if (unAula == 205) { self.position(game.at(25, 12)) }

  if (unAula == 206) { self.position(game.at(6, 4)) }
  if (unAula == 207) { self.position(game.at(11, 4)) }
  if (unAula == 208) { self.position(game.at(15, 4)) }
  if (unAula == 209) { self.position(game.at(20, 4)) }
  if (unAula == 210) { self.position(game.at(25, 4)) }

  game.addVisual(self)
}

  method interactuar(personaje) {
    nivel3.ganar()
  }
}