import 'package:flutter_application_1/automedicacion/data/models/sintoma.dart';

abstract class SintomaRepository {
  Future<List<Sintoma>> obtenerSintomas();
}