import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';
import '../models/paciente.dart';
import '../providers/paciente_provider.dart';

class CadastroPacienteForm extends StatefulWidget {
  const CadastroPacienteForm({super.key});

  @override
  _CadastroPacienteFormState createState() => _CadastroPacienteFormState();
}

class _CadastroPacienteFormState extends State<CadastroPacienteForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Paciente'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              FormBuilderTextField(
                name: 'nome',
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: FormBuilderValidators.firstName(),
              ),
              FormBuilderTextField(
                name: 'idade',
                decoration: const InputDecoration(labelText: 'Idade'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.numeric(),
                ]),
              ),
              FormBuilderTextField(
                name: 'endereco',
                decoration: const InputDecoration(labelText: 'Endereço'),
                validator: FormBuilderValidators.required(),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.saveAndValidate()) {
                    final novoPaciente = Paciente(
                      id: UniqueKey().toString(),
                      nome: _formKey.currentState!.value['nome'],
                      idade: int.parse(_formKey.currentState!.value['idade']),
                      endereco: _formKey.currentState!.value['endereco'],
                    );

                    Provider.of<PacienteProvider>(context, listen: false)
                        .adicionarPaciente(novoPaciente);

                    Navigator.of(context).pop();
                  }
                },
                child: const Text('Salvar Paciente'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
