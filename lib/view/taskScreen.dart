import 'package:flutter/material.dart';

class TelaTarefas extends StatelessWidget {
  const TelaTarefas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tarefas'),
      ),
      body: const Center(
        child: Text('Colunas estarão aqui:'),
      ),
    );
  }
}