import wollok.game.*
import alumno.*
import mostrables.*
import nivel1.nivel1.*
import nivel2.nivel2.*
import nivel3.nivel3.*
import estadosPantalla.*

object selectorPersonaje {
  const personajes = [lucio, lari, salva, alvarez, solci]
  var indice = 0

  method personajeActual() = personajes.get(indice)

  method siguiente() {
    indice = (indice + 1) % personajes.size()
    self.actualizar()
  }

  method anterior() {
    indice = (indice - 1 + personajes.size()) % personajes.size()
    self.actualizar()
  }

  method actualizar() {
    const elegido = self.personajeActual()
    juego.jugador(elegido)
    previewPersonaje.image(elegido.imagenMenu())
  }
}

class Pantalla {
    var property image
    var property position = game.at(0, 0)
    method recibirDano(cantidad) {}
}

object fondoMapa {
    method image() = "fondoNivel1.png"
    method position() = game.at(0, 0)
}

const pantallaInicio    = new Pantalla(image = "fondoMenuPrincipal.png")
const pantallaInstrucciones = new Pantalla(image = "instrucciones.png")
const pantallaInstrucciones2= new Pantalla(image="instrucciones2.png")
const pantallaInstrucciones3= new Pantalla(image="instrucciones3.png")
const pantallaGanaste   = new Pantalla(image = "ganaste1.png")
const pantallaSinSaldo  = new Pantalla(image = "sin_saldo.png")
const pantallaSinTiempo = new Pantalla(image = "sin_tiempo.png")
const pantallaDormiste= new Pantalla(image= "dormiste.png")
const pantallaPreso = new Pantalla(image = "preso.png")
const pantallaNivel2 = new Pantalla(image = "fondoNivel2.png")
const pantallaNivel2Completo = new Pantalla(image = "ganaste2.png")
const pantallaNivel3 = new Pantalla(image="fondoNivel3.png")
const pantallaNivel3Completo= new Pantalla(image="ganaste3.png")
 
object previewPersonaje {
  var property image = "lucio_menu.gif"
  method position() = game.at(14, 5) 
}

object menuPrincipal {
  method mostrar() {
    game.clear()
    game.addVisual(pantallaInicio)
    game.addVisual(previewPersonaje)

    keyboard.enter().onPressDo({
  juego.cambiarEstado(estadoNivel1)
})

keyboard.space().onPressDo({
  juego.cambiarEstado(estadoInstrucciones)
})
  }
}
object instrucciones {
  method mostrar() {
    game.clear()
    juego.estadoActual(estadoInstrucciones)
    game.addVisual(pantallaInstrucciones)

    keyboard.m().onPressDo({
          juego.cambiarEstado(estadoMenu)
           keyboard.right().onPressDo({ selectorPersonaje.siguiente() })
            keyboard.left().onPressDo({ selectorPersonaje.anterior() })
      
    })
}
}
