import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/paciente_provider.dart';
import '../widgets/procedimento_form.dart';
import '../widgets/sinais_vitais_form.dart';

class DetalhesPacienteScreen extends StatelessWidget {
  final String pacienteId;

  const DetalhesPacienteScreen({super.key, required this.pacienteId});

  @override
  Widget build(BuildContext context) {
    final paciente =
        Provider.of<PacienteProvider>(context).buscarPacientePorId(pacienteId);

    if (paciente == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Detalhes do Paciente'),
        ),
        body: const Center(child: Text('Paciente não encontrado!')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes de ${paciente.nome}'),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text('Nome: ${paciente.nome}'),
            subtitle: Text('Idade: ${paciente.idade} anos'),
          ),
          // Outras informações do paciente
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      SinaisVitaisForm(pacienteId: paciente.id),
                ),
              );
            },
            child: const Text('Lançar Sinais Vitais'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProcedimentoForm(paciente: paciente),
                ),
              );
            },
            child: const Text('Registrar Procedimento'),
          ),
        ],
      ),
    );
  }
}
