import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';
import '../models/procedimento.dart';
import '../providers/procedimento_provider.dart';
import '../models/paciente.dart';

class ProcedimentoForm extends StatefulWidget {
  final Paciente paciente;

  const ProcedimentoForm({super.key, required this.paciente});

  @override
  _ProcedimentoFormState createState() => _ProcedimentoFormState();
}

class _ProcedimentoFormState extends State<ProcedimentoForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Procedimento / ${widget.paciente.nome}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              FormBuilderTextField(
                name: 'descricao', // Corrigido para 'descricao'
                decoration: const InputDecoration(
                    labelText: 'Descrição do Procedimento'),
                validator: FormBuilderValidators.required(),
              ),
              FormBuilderTextField(
                name: 'observacao', // Corrigido para 'observacao'
                decoration: const InputDecoration(labelText: 'Observações'),
                validator: FormBuilderValidators.required(),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.saveAndValidate()) {
                    final novoProcedimento = Procedimento(
                      id: UniqueKey().toString(),
                      pacienteId: widget.paciente.id,
                      descricao: _formKey.currentState!.value['descricao'],
                      observacao: _formKey.currentState!.value['observacao'],
                      dataHora: DateTime.now(),
                    );

                    Provider.of<ProcedimentoProvider>(context, listen: false)
                        .adicionarProcedimento(novoProcedimento);

                    Navigator.of(context).pop();
                  }
                },
                child: const Text('Salvar Procedimento'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
