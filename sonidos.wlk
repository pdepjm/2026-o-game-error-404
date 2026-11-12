
object sinMusica {
    method stop() {}
}

object sonidos {
    var musicaActual = sinMusica

    method ganar() {
        game.sound("ganar.mp3").play()
    }

    method perder() {
        game.sound("perder.mp3").play()
    }

    method bala() {
        game.sound("bala.mp3").play()
    }

    method cancion() {
        musicaActual = game.sound("cancion.mp3")
        musicaActual.shouldLoop(true)
        musicaActual.play()
    }

    method detenerMusica() {
        musicaActual.stop()
        musicaActual = sinMusica
    }
}
