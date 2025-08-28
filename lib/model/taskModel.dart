enum Status {
  aFazer,
  fazendo,
  conluido,
}

class Tarefa {
  final String id;
  final String titulo;
  final String descricao;
  Status status;

  Tarefa ({
    required this.id,
    required this.titulo,
    this.descricao = '',
    required this.status,
});
}