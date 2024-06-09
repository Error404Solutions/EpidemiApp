class DenunciaPersona {
  final String idAutor;
  final String nombrePersonaContagiada;
  final String apellidoPersonaContagiada;
  final String sintomasPersonaContagiada;
  final String ubicacionPersonaContagiada;
  final DateTime fechaDenuncia;

  DenunciaPersona({
    required this.idAutor,
    required this.nombrePersonaContagiada,
    required this.apellidoPersonaContagiada,
    required this.sintomasPersonaContagiada,
    required this.ubicacionPersonaContagiada,
    required this.fechaDenuncia,
  });
}