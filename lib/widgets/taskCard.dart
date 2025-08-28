import 'package:flutter/material.dart';
import '../model/taskModel.dart';

class CardTarefa extends StatelessWidget {
  final Tarefa tarefa;
  const CardTarefa({super.key, required this.tarefa});

  @override
  Widget build(BuildContext context) {
    bool ehConcluida = tarefa.status == Status.done;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        title: Text(
          tarefa.titulo,
          style: TextStyle(
            decoration: ehConcluida ? TextDecoration.lineThrough : null,
            decorationColor: Colors.black,
            decorationThickness: 2.0,
            color: ehConcluida ? Colors.grey.shade700 : null,
          ),
        ),
        subtitle: tarefa.descricao.isNotEmpty
          ? Text (
          tarefa.descricao,
          style: TextStyle(
            color: ehConcluida ? Colors.grey.shade700 : null,
          ),
        )
            : null,
      ),
    );
  }
}