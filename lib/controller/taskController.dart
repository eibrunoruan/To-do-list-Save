import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../model/taskModel.dart';

class Controlador with ChangeNotifier {
  final List<Tarefa> _tarefas = [
    Tarefa(id: '1', titulo: 'Lavar a Louça', status: Status.toDo),
    Tarefa(id: '2', titulo: 'Estender as Roupas', descricao: 'Estou trabalhando nisso', status: Status.doing),
    Tarefa(id: '3', titulo: 'Escovar os Dentes', status: Status.done),
  ];
  var uuid = const Uuid();

  List<Tarefa> get tarefas => _tarefas;

  List<Tarefa> getTarefasStatus(Status status) {
    return _tarefas.where((tarefa) => tarefa.status == status).toList();
  }

  void addTarefa(String titulo, String descricao) {
    final newTarefa = Tarefa(
      id: uuid.v4(),
      titulo: titulo,
      descricao: descricao,
      status: Status.toDo,
    );
    _tarefas.add(newTarefa);
    notifyListeners();
  }

  void atualizarTarefa(String tarefaId, Status newStatus) {
    try {
      final tarefa = tarefas.firstWhere((tarefa) => tarefa.id == tarefaId);
      tarefa.status = newStatus;
      notifyListeners();
    } catch (e) {
      print('Erro: $e');
    }
  }
}
