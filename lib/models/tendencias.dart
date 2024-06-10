class Tendencia {
  final String mes;  // Cambiado de 'date' a 'mes' para reflejar el mockup
  final int casosPositivos;
  final int casosSospechosos;
  final String tipo;  // 'A. Potenciales' o 'B. Gubernamental'

  Tendencia({
    required this.mes,
    required this.casosPositivos,
    required this.casosSospechosos,
    required this.tipo
  });
}
