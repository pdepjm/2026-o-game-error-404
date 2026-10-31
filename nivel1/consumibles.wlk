import wollok.game.*
import consumible.*
import alumno.*
import efectos.*

class TarjetaSube {
    var saldo = 0

    method saldo() = saldo

    method cargar(monto) {
        saldo += monto
    }
}

object sube inherits TarjetaSube(saldo = (-1000 .. 1000).anyOne()) {
    var property position = game.at(3, 0)

    method image() = "sube.png"

    method interactuar(personaje) {
        personaje.asignarSube(self)
        game.removeVisual(self)
    }
}

class PlataTirada inherits Consumible
    {
        const valor
        method valor() = valor

        override method aplicarEfecto(personaje)
        {
            personaje.conseguirDinero(valor)
        }
    }

const billete100 = new PlataTirada(valor=100, imagen ="100pesos.png", position = game.at(4, 10))
const billete200 = new PlataTirada(valor=200, imagen ="200pesos.png", position = game.at(7, 4))
const billete500 = new PlataTirada(valor=500, imagen ="500pesos.png", position = game.at(24, 10))
const billete1000 = new PlataTirada(valor=1000, imagen ="1000pesos.png", position = game.at(22, 0))


