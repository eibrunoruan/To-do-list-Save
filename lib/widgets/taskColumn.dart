import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/taskController.dart';
import '../model/taskModel.dart';

class ColunaTarefa extends StatelessWidget {
  final String titulo;
  final Status status;

  const ColunaTarefa({
    super.key,
    required this.titulo,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final controlador = Provider.of<Controlador>(context);
    final tarefasDaColuna = controlador.getTarefasStatus(status);

    return DragTarget<Tarefa>(
      onAccept: (tarefaRecebida) {
        controlador.atualizarTarefa(tarefaRecebida.id, status);
      },
      builder: (context, candidateData, rejectedData) {
        return Container(
          constraints: const BoxConstraints(minHeight: 200),
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: candidateData.isNotEmpty ? Colors.blue.withOpacity(0.1) : Colors.black.withOpacity(0.05),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                titulo,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const Divider(thickness: 1.5),
              const SizedBox(height: 8),

              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: tarefasDaColuna.length,
                itemBuilder: (context, index) {
                  final tarefa = tarefasDaColuna[index];

                  return Draggable<Tarefa>(
                    data: tarefa,
                    feedback: Material(
                      color: Colors.transparent,
                      child: Card(
                        elevation: 8.0,
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Text(tarefa.titulo),
                        ),
                      ),
                    ),
                    childWhenDragging: Opacity(
                      opacity: 0.4,
                      child: Card(child: ListTile(title: Text(tarefa.titulo))),
                    ),
                    child: Card(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      child: ListTile(
                        title: Text(tarefa.titulo),
                        subtitle: tarefa.descricao.isNotEmpty ? Text(tarefa.descricao) : null,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}