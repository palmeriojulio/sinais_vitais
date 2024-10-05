import 'package:flutter/material.dart';
import '../models/sinais_vitais.dart';

class SinaisVitaisProvider with ChangeNotifier {
  final List<SinaisVitais> _sinaisVitais = [];

  List<SinaisVitais> get sinaisVitais => _sinaisVitais;

  void adicionarSinaisVitais(SinaisVitais sinais) {
    _sinaisVitais.add(sinais);
    notifyListeners();
  }

  List<SinaisVitais> obterSinaisVitaisPorPaciente(String pacienteId) {
    return _sinaisVitais
        .where((sinais) => sinais.pacienteId == pacienteId)
        .toList();
  }

  void removerSinaisVitais(String id) {
    _sinaisVitais.removeWhere((sinais) => sinais.id == id);
    notifyListeners();
  }
}
