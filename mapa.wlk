class MapaMatriz {
  const grilla

  method esTransitable(pos) {
    const x = pos.x()
    const y = pos.y()

    if (x < 0 or x >= 29 or y < 0 or y >= 15) {
      return false
    }

    const fila = 14 - y
    return grilla.get(fila).get(x) == 1
  }
}