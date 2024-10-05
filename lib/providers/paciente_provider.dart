import 'package:flutter/material.dart';
import '../models/paciente.dart';

class PacienteProvider with ChangeNotifier {
  final List<Paciente> _pacientes = [];

  List<Paciente> get pacientes => _pacientes;

  void adicionarPaciente(Paciente paciente) {
    _pacientes.add(paciente);
    notifyListeners();
  }

  void removerPaciente(String id) {
    _pacientes.removeWhere((paciente) => paciente.id == id);
    notifyListeners();
  }

  // Método para buscar paciente pelo ID
  Paciente? buscarPacientePorId(String id) {
    return _pacientes.firstWhere((paciente) => paciente.id == id);
  }
}
