import 'package:flutter/material.dart';
import 'paciente_list_screen.dart';
import 'cadastro_paciente_form.dart'; // Certifique-se de importar o form de cadastro

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Care - Gestão de Pacientes'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navegar para a tela de lista de pacientes
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => PacienteListScreen()),
                );
              },
              child: const Text('Pacientes'),
            ),
            const SizedBox(height: 20), // Espaçamento entre os botões
            ElevatedButton(
              onPressed: () {
                // Navegar para a tela de cadastro de paciente
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => CadastroPacienteForm()),
                );
              },
              child: const Text('Adicionar Paciente'),
            ),
          ],
        ),
      ),
    );
  }
}
