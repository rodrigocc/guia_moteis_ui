import 'package:flutter/material.dart';
import 'package:guia_moteis_v1/features/home/presentation/pages/home_page.dart';
import 'package:guia_moteis_v1/motel_app.dart';
import 'config/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(const MotelApp());
}
