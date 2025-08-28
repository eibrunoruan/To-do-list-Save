import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller/taskController.dart';
import 'view/taskScreen.dart';

void main() {
  runApp(const ToDo());
}

class ToDo extends StatelessWidget {
  const ToDo({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Controlador(),
      child: MaterialApp(
        title: 'To-Do List',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFFF8B424),
            brightness: Brightness.light,
          ),
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFFF8B424),
            brightness: Brightness.dark,
          ),
          useMaterial3: true,
        ),
        themeMode: ThemeMode.system,
        home: const TelaTarefas(),
      ),
    );
  }
}