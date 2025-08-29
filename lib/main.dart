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
          brightness: Brightness.dark,
          scaffoldBackgroundColor: const Color(0xFF302C3C),
          cardTheme: const CardThemeData(
            color: Color(0xFF4A4659),
            elevation: 2,
          ),
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFFF8B424),
            brightness: Brightness.dark,
          ),
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: const Color(0xFF302C3C),
          cardTheme: const CardThemeData(
            color: Color(0xFF4A4659),
            elevation: 2,
          ),
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