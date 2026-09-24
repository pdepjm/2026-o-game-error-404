import wollok.game.*

object sube{
    var saldo = (-1000 .. 1000).anyOne()

    var property position = game.at(4, 4)
    method image() = "imagenes/sube.png"
    method saldo() = saldo

    method interactuar(personaje){
        personaje.conseguirSube(self)
        game.removeVisual(self)
    }
}

class PlataTirada{
    var valor
    var imagen
    method valor()=valor
    method image()=imagen
    var property position = game.at(0, 0) 

    method interactuar(personaje){
        personaje.conseguirDinero(valor)
        game.removeVisual(self)
    }
}

const billete100 = new PlataTirada(valor=100, imagen ="imagenes/100pesos.jpg", position = game.at(2, 5))
const billete200 = new PlataTirada(valor=200, imagen ="imagenes/200pesos.jpg", position = game.at(8, 2))
const billete500 = new PlataTirada(valor=500, imagen ="imagenes/500pesos.jpg", position = game.at(9, 6))
const billete1000 = new PlataTirada(valor=1000, imagen ="imagenes/1000pesos.jpg", position = game.at(6, 7))


