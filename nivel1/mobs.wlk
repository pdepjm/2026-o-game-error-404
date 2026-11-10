import wollok.game.*
import efectos.*
import direcciones.*

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

class MobEnMovimiento inherits Mob {
    var property direccion
    const limiteMaximo
    const limiteMinimo

    method coordenadaActual()
    method direccionHaciaMaximo()
    method direccionHaciaMinimo()
method cambiarSentido() {
    if (direccion.llegoAlLimite(
        self.coordenadaActual(),
        limiteMinimo,
        limiteMaximo
    )) {
        direccion = direccion.opuesta()
    }
}

method moverse() {
    self.cambiarSentido()
    position = direccion.siguientePosicion(position)
}
}

object fisura inherits MobEnMovimiento(
    position = game.at(7, 10),
    imagen = "fisura.png",
    frase = "Eh wacho dame todo",
    direccion = derecha,
    limiteMinimo = 7,
    limiteMaximo = 12
) {
    override method coordenadaActual() = position.x()
    override method direccionHaciaMaximo() = derecha
    override method direccionHaciaMinimo() = izquierda

    override method leDaEfecto(personaje) {
        robo.aplicarEfecto(personaje)
        frenar.aplicarEfecto(personaje)
    }
}

object policia inherits MobEnMovimiento(
    position = game.at(18, 0),
    imagen = "policia.png",
    frase = "A ver mostrame los documentos, veni a la comisaría",
    direccion = arriba,
    limiteMinimo = 0,
    limiteMaximo = 6
) {
    override method coordenadaActual() = position.y()
    override method direccionHaciaMaximo() = arriba
    override method direccionHaciaMinimo() = abajo

    override method leDaEfecto(personaje) {
        meterEnCana.aplicarEfecto(personaje)
    }
}


object vecino inherits Mob(position = game.at(13,10), imagen="vecino.png",frase="Tomá, un café"){
    override method leDaEfecto(personaje){
        cafe.aplicarEfecto(personaje)
        game.schedule(2000, { game.removeVisual(self) })
    }
}

object kiosco inherits Mob(position = game.at(9, 11), imagen="kiosco.png",frase=""){
    override method leDaEfecto(personaje) {
        if (personaje.tieneSube() and personaje.dinero() >= 500) {
            game.schedule(2000, { game.say(self, "Te cargo 500") })
            personaje.pagar(500)
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


