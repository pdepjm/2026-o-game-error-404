import wollok.game.*

object derecha {
    method siguientePosicion(pos) = pos.right(1)
    method opuesta() = izquierda
    method llegoAlLimite(pos, minimo, maximo) = pos.x() >= maximo
}

object izquierda {
    method siguientePosicion(pos) = pos.left(1)
    method opuesta() = derecha
    method llegoAlLimite(pos, minimo, maximo) = pos.x() <= minimo
}

object arriba {
    method siguientePosicion(pos) = pos.up(1)
    method opuesta() = abajo
    method llegoAlLimite(pos, minimo, maximo) = pos.y() >= maximo
}

object abajo {
    method siguientePosicion(pos) = pos.down(1)
    method opuesta() = arriba
    method llegoAlLimite(pos, minimo, maximo) = pos.y() <= minimo
}