import wollok.game.*

class Consumible
    {
        const imagen
        var property position = game.at(0, 0)

        method image() = imagen

        method interactuar(personaje)
        { 
            self.aplicarEfecto(personaje)
            game.removeVisual(self)
        }

        method aplicarEfecto(personaje){}
    }