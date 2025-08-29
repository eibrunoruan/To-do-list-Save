import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/taskController.dart';
import '../model/taskModel.dart';
import 'taskCard.dart';

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
    final tarefasColuna = controlador.getTarefasStatus(status);

    return DragTarget<Tarefa>(
      onAccept: (tarefaRecebida) {
        controlador.atualizarTarefa(tarefaRecebida.id, status);
      },
      builder: (context, candidateData, rejectedData) {
        return Container(
          constraints: const BoxConstraints(minHeight: 200),
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: candidateData.isNotEmpty
                ? Theme.of(context).colorScheme.primary.withOpacity(0.2)
                : const Color(0xFF3D3A4B),
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
                itemCount: tarefasColuna.length,
                itemBuilder: (context, index) {
                  final tarefa = tarefasColuna[index];
                  return Draggable<Tarefa>(
                    data: tarefa,
                    feedback: Material(
                      color: Colors.transparent,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: CardTarefa(tarefa: tarefa),
                      ),
                    ),
                    childWhenDragging: Opacity(
                      opacity: 0.4,
                      child: CardTarefa(tarefa: tarefa),
                    ),
                    child: CardTarefa(tarefa: tarefa),
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