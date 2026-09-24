import efectos.*

object fisura{
    var property position = game.at(10, 3)
    method interactuar(personaje){
        robo.aplicarEfecto(personaje)
        game.removeVisual(self)
    }
}

object vecino{
    var property position = game.at(3, 8)
    method interactuar(personaje){
        cafe.aplicarEfecto(personaje)
        game.removeVisual(self)
    }
}