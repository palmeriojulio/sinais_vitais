class Procedimento {
  final String id;
  final String pacienteId;
  final String descricao;
  final String observacao;
  final DateTime dataHora;

  Procedimento({
    required this.id,
    required this.pacienteId,
    required this.descricao,
    required this.observacao,
    required this.dataHora,
  });
}
