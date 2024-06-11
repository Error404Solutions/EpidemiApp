class Tendencia {
  final String mes;  // Aquí tratamos 'mes' como una cadena que representa el mes en formato MM
  final int casosPositivos;
  final int casosSospechosos;
  final String tipo;

  Tendencia({
    required this.mes,
    required this.casosPositivos,
    required this.casosSospechosos,
    required this.tipo,
  });

  factory Tendencia.fromJson(Map<String, dynamic> json) {
    // Extraemos el mes del formato 'dd-MM-yyyy'
    String fecha = json['fecha'];
    String mes = fecha.split('-')[1]; // Extraemos la parte del mes

    return Tendencia(
      mes: mes,
      casosPositivos: json['casosPositivos'],
      casosSospechosos: json['casosSospechosos'],
      tipo: json['tipo'],
    );
  }
}
