import wollok.game.*

class Pantalla {
    var property image
    var property position = game.at(0, 0)
}

object fondoMapa {
    method image() = "fondo.png"
    method position() = game.at(0, 0)
}

const pantallaInicio    = new Pantalla(image = "inicio.png")
const pantallaGanaste   = new Pantalla(image = "ganaste.png")
const pantallaSinSaldo  = new Pantalla(image = "sin_saldo.png")
const pantallaSinTiempo = new Pantalla(image = "sin_tiempo.png")
const pantallaPreso = new Pantalla(image = "preso.png")

object previewPersonaje {
  var property image = "pinguino_menu.gif"
  method position() = game.at(14, 6) 
}