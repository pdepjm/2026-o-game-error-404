import wollok.game.*
import efectos.*

class Mob{
    var property position
    const imagen
    const frase

    method image()=imagen

    method interactuar(personaje){
        game.say(self, frase)
        self.leDaEfecto(personaje)
    }

    method leDaEfecto(personaje)
}

class MobEnMovimiento inherits Mob{
    var property direccion = 1
    const limiteMaximo
    const limiteMinimo

    method cambiarSentido(posicionActual){
        if (posicionActual >= limiteMaximo) {
            direccion = -1
        } else if (posicionActual <= limiteMinimo) {
            direccion = 1
        }
    }

    method moverse()
}

object fisura inherits MobEnMovimiento(position = game.at(7, 10),imagen = "fisura.png",frase = "Eh wacho dame todo",limiteMinimo = 7,limiteMaximo = 12){
    override method moverse() {
        self.cambiarSentido(position.x())
        position = position.right(direccion)
    }

    override method leDaEfecto(personaje){
        robo.aplicarEfecto(personaje)
        frenar.aplicarEfecto(personaje)
    }
}

object policia inherits MobEnMovimiento(position = game.at(18, 0),imagen = "policia.png",frase = "A ver mostrame los documentos, veni a la comisaría",limiteMinimo = 0,limiteMaximo = 6){
    override method moverse() {
        self.cambiarSentido(position.y())
        position = position.up(direccion)
    }

    override method leDaEfecto(personaje){
        meterEnCana.aplicarEfecto(personaje)
    }
}


object vecino inherits Mob(position = game.at(13,10), imagen="vecino.png",frase="Tomá, un café"){
    override method leDaEfecto(personaje){
        cafe.aplicarEfecto(personaje)
        game.schedule(2000, { game.removeVisual(self) })
    }
}

object kiosco inherits Mob(position = game.at(9, 11), imagen="kiosco.gif",frase=""){
    override method leDaEfecto(personaje) {
        if(personaje.dinero()>500){
            game.schedule(2000, { game.say(self, "Te cargo 500") })
            personaje.cargarSube(500)
        }
    }
} 

class Auto {
    var property position
    const carrilY
    const property image 

    method moverse() {
        const siguienteX = (position.x() + 1) % game.width() //% calcula el resto de la division y hace que el auto vuelva a la izquierda cuando llega al final
        position = game.at(siguienteX, carrilY)
    }

    method interactuar(personaje) {
        pisar.aplicarEfecto(personaje)
    }
}

const autoRojo = new Auto(position = game.at(0, 8), carrilY = 8, image = "rojo.png")
const autoAzul = new Auto(position = game.at(12, 8), carrilY = 8, image = "azul.png")

const autoVerde = new Auto(position = game.at(5, 7), carrilY = 7, image = "verde.png")
const taxi = new Auto(position = game.at(22, 7), carrilY = 7, image = "taxi.png")


