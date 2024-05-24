import '../models/medicamento.dart';
import '../repositories/medicamento_repository.dart';

class MedicamentoService {
  final MedicamentoRepository _medicamentoRepository;

  MedicamentoService(this._medicamentoRepository);

  Future<List<Medicamento>> obtenerMedicamentosProhibidos() async {
    final medicamentos = await _medicamentoRepository.obtenerMedicamentosProhibidos();
    return medicamentos.where((medicamento) => medicamento.esProhibido).toList();
  }

  Future<List<Medicamento>> obtenerMedicamentosComunes() async {
    final medicamentos = await _medicamentoRepository.obtenerMedicamentosComunes();
    return medicamentos.where((medicamento) => !medicamento.esProhibido).toList();
  }
}