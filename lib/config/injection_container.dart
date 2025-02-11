import 'package:get_it/get_it.dart';
import 'package:guia_moteis_v1/features/home/di/motel_di.dart';

final serviceLocator = GetIt.I;

Future<void> init() async {
  await moteisInjection();
}
