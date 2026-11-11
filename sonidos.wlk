object sonidos {
    method ganar() {
        game.sound("ganar.mp3").play()
    }

    method perder() {
        game.sound("perder.mp3").play()
    }
}