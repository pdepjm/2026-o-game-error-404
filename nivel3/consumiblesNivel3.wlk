
import wollok.game.*
import consumible.*
import nivel3.*
import interfaz.mostrables.*
object id inherits Consumible(
  imagen = "id.png",
  position = game.at(5, 8)
) {
  override method aplicarEfecto(personaje) {
    nivel3.conseguirID()
    game.say(personaje, "¡Encontraste tu legajo!")
  }
}

object dni inherits Consumible(
  imagen = "dni.png",
  position = game.at(10, 8)
) {
  override method aplicarEfecto(personaje) {
    nivel3.conseguirDNI()
    game.say(personaje, "¡Encontraste tu DNI!")
  }
}

object hojaFormulas inherits Consumible(
  imagen = "hojaFormulas.png",
  position = game.at(15, 8)
) {
  override method aplicarEfecto(personaje) {
    nivel3.conseguirHojaFormulas()
    game.say(personaje, "¡Encontraste la hoja de fórmulas!")
  }
}

object utiles inherits Consumible(
  imagen = "utiles.png",
  position = game.at(20, 8)
) {
  override method aplicarEfecto(personaje) {
    nivel3.conseguirUtiles()
    game.say(personaje, "¡Encontraste los útiles!")
  }
}
