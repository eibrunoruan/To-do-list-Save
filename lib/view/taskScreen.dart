import 'package:flutter/material.dart';
import '../model/taskModel.dart';
import '../widgets/taskColumn.dart';

class TelaTarefas extends StatelessWidget {
  const TelaTarefas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TO-DO LIST SAVE'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ColunaTarefa(
                titulo: 'TO-DO',
                status: Status.toDo,
              ),
              const SizedBox(height: 16),
              ColunaTarefa(
                titulo: 'DOING',
                status: Status.doing,
              ),
              const SizedBox(height: 16),
              ColunaTarefa(
                titulo: 'DONE',
                status: Status.done,
              ),
            ],
          ),
        ),
      ),
    );
  }
}