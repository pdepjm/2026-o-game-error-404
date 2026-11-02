import wollok.game.*

object derecha {
    method siguientePosicion(pos) = pos.right(1)
    method opuesta() = izquierda
}

object izquierda {
    method siguientePosicion(pos) = pos.left(1)
    method opuesta() = derecha
}

object arriba {
    method siguientePosicion(pos) = pos.up(1)
    method opuesta() = abajo
}

object abajo {
    method siguientePosicion(pos) = pos.down(1)
    method opuesta() = arriba
}