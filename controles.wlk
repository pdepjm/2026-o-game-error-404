import wollok.game.*
object controles {
    method keyboardControls(jugadorElegido) {
        keyboard.w().onPressDo({ jugadorElegido.mover(jugadorElegido.position().up(1)) })
        keyboard.s().onPressDo({ jugadorElegido.mover(jugadorElegido.position().down(1)) })
        keyboard.a().onPressDo({ jugadorElegido.mover(jugadorElegido.position().left(1)) })
        keyboard.d().onPressDo({ jugadorElegido.mover(jugadorElegido.position().right(1)) })
    }

}