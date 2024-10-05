import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/paciente_provider.dart';
import 'providers/sinais_vitais_provider.dart';
import 'providers/procedimento_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PacienteProvider()),
        ChangeNotifierProvider(create: (_) => SinaisVitaisProvider()),
        ChangeNotifierProvider(create: (_) => ProcedimentoProvider()),
      ],
      child: MaterialApp(
        title: 'Home Care',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
