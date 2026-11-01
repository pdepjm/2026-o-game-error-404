import wollok.game.*
import alumno.*
import nivel1.nivel1.*
import nivel2.nivel2.*
import nivel3.nivel3.*

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
const pantallaInstrucciones2= new Pantalla(image="instrucciones2.png")
const pantallaInstrucciones3= new Pantalla(image="instrucciones3.png")
const pantallaGanaste   = new Pantalla(image = "ganaste.png")
const pantallaSinSaldo  = new Pantalla(image = "sin_saldo.png")
const pantallaSinTiempo = new Pantalla(image = "sin_tiempo.png")
const pantallaDormiste= new Pantalla(image= "dormiste.png")
const pantallaPreso = new Pantalla(image = "preso.png")
const pantallaNivel2 = new Pantalla(image = "fondoNivel2.png")
const pantallaNivel2Completo = new Pantalla(image = "ganaste2.png")
const pantallaNivel3 = new Pantalla(image="fondoNivel3.png")
const pantallaNivel3Completo= new Pantalla(image="ganaste3.png")
 
object previewPersonaje {
  var property image = "lucio.png"
  method position() = game.at(14, 6) 
}

object menuPrincipal {
  
  method mostrar() {
    juego.estadoPantalla("menu")
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
  if (juego.estadoPantalla() == "menu") {
    juego.estadoPantalla("nivel1")
    nivel1.iniciar()
  }
})

  
    keyboard.space().onPressDo({
    instrucciones.mostrar()
    })
  }

  
}
object instrucciones {
  method mostrar() {
    game.clear()
    juego.estadoPantalla("instrucciones")
    game.addVisual(pantallaInstrucciones)

    keyboard.m().onPressDo({
      if (juego.estadoPantalla() == "instrucciones") {
        menuPrincipal.mostrar()
      }
    })

    keyboard.enter().onPressDo({
      if (juego.estadoPantalla() == "instrucciones") {
        menuPrincipal.mostrar()
      }
    })
  }
}


object instruccionesNivel2 {
  method mostrar() {
    game.clear()
    juego.estadoPantalla("instruccionesNivel2")
    game.addVisual(pantallaInstrucciones2)

  keyboard.enter().onPressDo({
  game.say(juego.jugador(), "ENTRE A INSTRUCCIONES NIVEL 2")
  nivel2.iniciar()
})

    keyboard.m().onPressDo({
      if (juego.estadoPantalla() == "instruccionesNivel2") {
        juego.estadoPantalla("menu")
        menuPrincipal.mostrar()
      }
    })
  }
}
object instruccionesNivel3 {
  method mostrar() {
    game.clear()
    game.addVisual(pantallaInstrucciones3)

    keyboard.enter().onPressDo({
      nivel3.iniciar()
    })

    keyboard.m().onPressDo({
      menuPrincipal.mostrar()
    })
  }
}