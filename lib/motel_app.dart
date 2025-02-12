import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:guia_moteis_v1/features/home/presentation/pages/home_page.dart';
import 'package:guia_moteis_v1/features/home/presentation/pages/pagina_apresentacao.dart';

class MotelApp extends StatelessWidget {
  const MotelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MotelListScreen());
  }
}
