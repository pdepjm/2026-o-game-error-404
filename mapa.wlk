class MapaMatriz {
  const grilla

  method esTransitable(pos) {
    const x = pos.x()
    const y = pos.y()

    const dentroDelTablero = x.between(0, game.width() - 1) and y.between(0, game.height() - 1)

    const fila = 14 - y

    return dentroDelTablero and (grilla.get(fila).get(x) == 1)
  }
}