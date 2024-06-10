class LocalidadInfo {
  final String nombre;
  final int casos;
  final String distancia;

  LocalidadInfo({
    required this.nombre,
    required this.casos,
    required this.distancia
  });

  factory LocalidadInfo.fromJson(Map<String, dynamic> json) {
    return LocalidadInfo(
      nombre: json['ubicacion'],
      casos: json['count'],
      distancia: json['distancia']
    );
  }

}