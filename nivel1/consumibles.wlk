import wollok.game.*
import alumno.*
import efectos.*

object sube{
    const saldo = (-1000 .. 1000).anyOne()

    var property position = game.at(3, 0)
    method image() = "sube.png"
    method saldo() = saldo

    method interactuar(personaje){
        personaje.conseguirSube(self)
        game.removeVisual(self)
    }
}

class PlataTirada{
    const valor
    const imagen
    method valor()=valor
    method image()=imagen
    var property position = game.at(0, 0) 

    method interactuar(personaje){
        personaje.conseguirDinero(valor)
        game.removeVisual(self)
    }
}

const billete100 = new PlataTirada(valor=100, imagen ="100pesos.png", position = game.at(4, 11))
const billete200 = new PlataTirada(valor=200, imagen ="200pesos.png", position = game.at(7, 4))
const billete500 = new PlataTirada(valor=500, imagen ="500pesos.png", position = game.at(24, 10))
const billete1000 = new PlataTirada(valor=1000, imagen ="1000pesos.png", position = game.at(22, 0))


