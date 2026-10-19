import wollok.game.*
import alumno.*
import nivel1.nivel1.*
import nivel2.nivel2.*

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
const pantallaDormiste= new Pantalla(image= "dormiste.png")
const pantallaPreso = new Pantalla(image = "preso.png")
const pantallaNivel2 = new Pantalla(image = "fondoNivel2.png")
const pantallaNivel2Completo = new Pantalla(image = "nivel2_completo.png")

object previewPersonaje {
  var property image = "pinguino_menu.gif"
  method position() = game.at(14, 6) 
}