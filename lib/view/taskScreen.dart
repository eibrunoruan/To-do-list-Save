import 'package:flutter/material.dart';
import '../model/taskModel.dart';
import '../widgets/taskColumn.dart';
import '../controller/taskController.dart';
import 'package:provider/provider.dart';

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
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        label: const Text('Criar Tarefa'),
        onPressed: () {
          _addTarefa(context);
        },
      ),
    );
  }
  void _addTarefa(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final tituloController = TextEditingController();
    final descricaoController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            top: 20,
            left: 20,
            right: 20,
          ),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('CADASTRAR TAREFA', style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 20),
                TextFormField(
                  controller: tituloController,
                  decoration: const InputDecoration(labelText: 'Título'),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'O título é obrigatório.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: descricaoController,
                  decoration: const InputDecoration(labelText: 'Descrição (Opcional)'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  child: const Text('SALVAR'),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      final controlador = Provider.of<Controlador>(context, listen: false);
                      controlador.addTarefa(
                        tituloController.text,
                        descricaoController.text,
                      );
                      Navigator.of(context).pop();
                    }
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}