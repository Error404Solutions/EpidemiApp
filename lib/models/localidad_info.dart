class LocalidadInfo {
  final String? nombre;
  final int casosPositivos;
  final int casosPotenciales;

  LocalidadInfo({
    required this.nombre,
    required this.casosPositivos,
    required this.casosPotenciales,
  });

  factory LocalidadInfo.fromJson(Map<String, dynamic> json) {
    return LocalidadInfo(
      nombre: json['ubicacion'] ?? 'Desconocida',
      casosPositivos: json['casosPositivos'] ?? 0,
      casosPotenciales: json['casosPotenciales'] ?? 0,
    );
  }
}