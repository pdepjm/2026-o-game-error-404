import wollok.game.*
import alumno.*
import nivel1.nivel1.*
import nivel2.nivel2.*

class Pantalla {
    var property image
    var property position = game.at(0, 0)
    method recibirDano(cantidad) {}
}

object fondoMapa {
    method image() = "fondo.png"
    method position() = game.at(0, 0)
}

const pantallaInicio    = new Pantalla(image = "fondoMenu2.png")
const pantallaInstrucciones = new Pantalla(image = "instrucciones.png")
const pantallaGanaste   = new Pantalla(image = "ganaste.png")
const pantallaSinSaldo  = new Pantalla(image = "sin_saldo.png")
const pantallaSinTiempo = new Pantalla(image = "sin_tiempo.png")
const pantallaDormiste= new Pantalla(image= "dormiste.png")
const pantallaPreso = new Pantalla(image = "preso.png")
const pantallaNivel2 = new Pantalla(image = "fondoNivel2.png")
const pantallaNivel2Completo = new Pantalla(image = "ganaste2.png")


object previewPersonaje {
  var property image = "pinguino_menu.gif"
  method position() = game.at(14, 6) 
}

object menuPrincipal {
  method mostrar() {
    game.clear()
    game.addVisual(pantallaInicio)
    game.addVisual(previewPersonaje)

    keyboard.num1().onPressDo({
      juego.jugador(lucio)
      previewPersonaje.image(lucio.imagenMenu())
    })

    keyboard.num2().onPressDo({
      juego.jugador(lari)
      previewPersonaje.image(lari.imagenMenu())
    })

    keyboard.num3().onPressDo({
      juego.jugador(salva)
      previewPersonaje.image(salva.imagenMenu())
    })

    keyboard.num4().onPressDo({
      juego.jugador(alvarez)
      previewPersonaje.image(alvarez.imagenMenu())
    })

    keyboard.num5().onPressDo({
      juego.jugador(solci)
      previewPersonaje.image(solci.imagenMenu())
    })

    keyboard.enter().onPressDo({
      juego.estadoPantalla("nivel1")
      nivel1.iniciar()
    })
    keyboard.space().onPressDo({
    instrucciones.mostrar()
    })
  }

  
}
object instrucciones {
  method mostrar() {
    game.clear()
    game.addVisual(pantallaInstrucciones)

    keyboard.m().onPressDo({
      menuPrincipal.mostrar()
    })
      keyboard.enter().onPressDo({
      menuPrincipal.mostrar()
    })
  }
}