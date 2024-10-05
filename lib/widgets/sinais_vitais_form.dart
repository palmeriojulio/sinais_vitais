import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';
import '../models/sinais_vitais.dart';
import '../providers/sinais_vitais_provider.dart';

class SinaisVitaisForm extends StatefulWidget {
  final String pacienteId;

  const SinaisVitaisForm({super.key, required this.pacienteId});

  @override
  _SinaisVitaisFormState createState() => _SinaisVitaisFormState();
}

class _SinaisVitaisFormState extends State<SinaisVitaisForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar Sinais Vitais'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              FormBuilderTextField(
                name: 'pressao_arterial',
                decoration:
                    const InputDecoration(labelText: 'Pressão Arterial'),
                validator: FormBuilderValidators.required(),
              ),
              FormBuilderTextField(
                name: 'frequencia_cardiaca',
                decoration:
                    const InputDecoration(labelText: 'Frequência Cardíaca'),
                validator: FormBuilderValidators.required(),
              ),
              FormBuilderTextField(
                name: 'temperatura',
                decoration: const InputDecoration(labelText: 'Temperatura'),
                validator: FormBuilderValidators.required(),
              ),
              FormBuilderTextField(
                name: 'saturacao',
                decoration: const InputDecoration(labelText: 'Saturação'),
                validator: FormBuilderValidators.required(),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.saveAndValidate()) {
                    final novoSinaisVitais = SinaisVitais(
                      id: UniqueKey().toString(),
                      pacienteId: widget.pacienteId,
                      pressaoArterial:
                          _formKey.currentState!.value['pressao_arterial'],
                      frequenciCardiaca:
                          _formKey.currentState!.value['frequencia_cardiaca'],
                      temperatura: _formKey.currentState!.value['temperatura'],
                      hgt: _formKey.currentState!.value['hgt'],
                      saturacao: _formKey.currentState!.value['saturacao'],
                      dataHora: DateTime.now(),
                    );

                    Provider.of<SinaisVitaisProvider>(context, listen: false)
                        .adicionarSinaisVitais(novoSinaisVitais);

                    Navigator.of(context).pop();
                  }
                },
                child: const Text('Salvar Sinais Vitais'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
