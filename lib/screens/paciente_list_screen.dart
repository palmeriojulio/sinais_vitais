import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/paciente_provider.dart';
import '../widgets/procedimento_form.dart';
import '../widgets/sinais_vitais_form.dart'; // Importe a tela de registro de sinais vitais

class PacienteListScreen extends StatelessWidget {
  const PacienteListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pacientes = Provider.of<PacienteProvider>(context).pacientes;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Pacientes'),
      ),
      body: ListView.builder(
        itemCount: pacientes.length,
        itemBuilder: (ctx, i) => ListTile(
          title: Text(pacientes[i].nome),
          subtitle: Text('Idade: ${pacientes[i].idade}'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min, // Ajusta o tamanho da linha
            children: [
              IconButton(
                icon: const Icon(Icons.assignment),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ProcedimentoForm(
                        paciente:
                            pacientes[i], // Passa o objeto Paciente completo
                      ),
                    ),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.monitor_heart),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SinaisVitaisForm(
                        pacienteId: pacientes[i].id, // Passa o ID do paciente
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
