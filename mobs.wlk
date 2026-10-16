import wollok.game.*
import efectos.*


object fisura{
    method image() = "fisura.png"
    var property position = game.at(7, 10)
    var direccion = 1

    method moverse() {
        if (position.x() >= 12) {
            direccion = -1
        } else if (position.x() <= 7) {
            direccion = 1
        }
        position = position.right(direccion)
    }

    method interactuar(personaje){
        game.say(self, "Eh wacho dame todo")
        robo.aplicarEfecto(personaje)
        frenar.aplicarEfecto(personaje)
    }

}

object vecino{
    method image() = "vecino.png"
    var property position = game.at(13, 10)

    method interactuar(personaje){
        game.say(self, "Tomá, un café")
        cafe.aplicarEfecto(personaje)
        game.schedule(2000, { game.removeVisual(self) })
    }
}

object policia{
    method image() = "policia.png"
    var property position = game.at(18, 0)
    var property direccion = 1

    method moverse() {
        if (position.y() >= 5) {
            direccion = -1
        } else if (position.y() <= 0) {
            direccion = 1
        }
        position = position.up(direccion)
    }

    method interactuar(personaje){
        game.say(self, "A ver mostrame los documentos, veni a la comisaría")
        meterEnCana.aplicarEfecto(personaje)
    }
}


object kiosco {
    var property position = game.at(9, 11)
    method image() = "kiosco.png"
    method interactuar(personaje) {
        if(personaje.dinero()>500){
            game.say(self, "Te cargo 500")
            game.schedule(2000, { game.say(self, "") })
            personaje.cargarSube(500)
        }
    }
}

class Auto {
    var property position
    const carrilY
    const property image 

    method moverse() {
        if (position.x() >= game.width() - 1) {
            position = game.at(0, carrilY) 
        } else {
            position = position.right(1)
        }
    }

    method interactuar(personaje) {
        pisar.aplicarEfecto(personaje)
    }
}

const autoRojo = new Auto(position = game.at(0, 8), carrilY = 8, image = "rojo.png")
const autoAzul = new Auto(position = game.at(12, 8), carrilY = 8, image = "azul.png")

const autoVerde = new Auto(position = game.at(5, 7), carrilY = 7, image = "verde.png")
const taxi = new Auto(position = game.at(22, 7), carrilY = 7, image = "taxi.png")


