import 'package:flutter/material.dart';
import '../models/paciente.dart';
import '../screens/paciente_detail_screen.dart';

class PacienteItem extends StatelessWidget {
  final Paciente paciente;

  const PacienteItem({super.key, required this.paciente});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(paciente.nome), // Adicione o nome do paciente
      subtitle: Text('Idade: ${paciente.idade}'),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetalhesPacienteScreen(
                pacienteId: paciente.id), // Passando ID do paciente
          ),
        );
      },
    );
  }
}
