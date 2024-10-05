import 'package:flutter/material.dart';
import '../models/procedimento.dart';

class ProcedimentoProvider with ChangeNotifier {
  final List<Procedimento> _procedimentos = [];

  List<Procedimento> get procedimentos => _procedimentos;

  void adicionarProcedimento(Procedimento procedimento) {
    _procedimentos.add(procedimento);
    notifyListeners();
  }

  List<Procedimento> obterProcedimentosPorPaciente(String pacienteId) {
    return _procedimentos
        .where((procedimento) => procedimento.pacienteId == pacienteId)
        .toList();
  }

  void removerProcedimento(String id) {
    _procedimentos.removeWhere((procedimento) => procedimento.id == id);
    notifyListeners();
  }
}
