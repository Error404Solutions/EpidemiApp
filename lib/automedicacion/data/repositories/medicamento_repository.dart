import '../models/medicamento.dart';

abstract class MedicamentoRepository {
  Future<List<Medicamento>> obtenerMedicamentosProhibidos();
  Future<List<Medicamento>> obtenerMedicamentosComunes();
}