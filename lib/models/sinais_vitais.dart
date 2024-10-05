class SinaisVitais {
  final String id;
  final String pacienteId;
  final double temperatura;
  final String saturacao;
  final int frequenciCardiaca;
  final int pressaoArterial;
  final String hgt;
  final DateTime dataHora;

  SinaisVitais({
    required this.id,
    required this.pacienteId,
    required this.temperatura,
    required this.saturacao,
    required this.frequenciCardiaca,
    required this.pressaoArterial,
    required this.hgt,
    required this.dataHora,
  });
}
