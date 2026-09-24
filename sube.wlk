object sube{
    method saldo()= (-1000 .. 1000).anyOne()

    var property position = game.at(4, 4)

    method image() = "imagenes/sube.png"

    method interactuar(personaje){
        personaje.conseguirSube(self)
        game.removeVisual(self)
    }
}

