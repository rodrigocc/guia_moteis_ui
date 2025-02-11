import 'package:guia_moteis_v1/config/http_client.dart';
import 'package:guia_moteis_v1/config/http_client_impl.dart';
import 'package:guia_moteis_v1/config/injection_container.dart';
import 'package:guia_moteis_v1/features/home/data/datasources/fetch_list_moteis_datasource.dart';
import 'package:guia_moteis_v1/features/home/data/repositories/motel_repository_impl.dart';
import 'package:guia_moteis_v1/features/home/domain/usecases/fetch_moteis_usecase.dart';
import 'package:guia_moteis_v1/features/home/presentation/bloc/home_bloc.dart';
import 'package:http/http.dart' as http;

import '../domain/repositories/motel_repository.dart';

Future<void> moteisInjection() async {
  // 🔹 EXTERNAL (Pacotes de terceiros)
  serviceLocator.registerLazySingleton<http.Client>(() => http.Client());

  // 🔹 CORE (HttpClient personalizado)
  serviceLocator.registerLazySingleton<IHttpClient>(
      () => HttpClientImpl(serviceLocator()));

  // 🔹 DATA SOURCES
  serviceLocator.registerLazySingleton<MotelRemoteDataSource>(
      () => MotelRemoteDataSourceImpl(client: serviceLocator()));

  // 🔹 REPOSITÓRIOS
  serviceLocator.registerLazySingleton<MotelRepository>(
      () => MotelRepositoryImpl(remoteDataSource: serviceLocator()));

  // 🔹 USE CASES
  serviceLocator.registerLazySingleton(
      () => FetchMoteisUseCase(repository: serviceLocator()));

  // 🔹 BLOC
  serviceLocator.registerFactory(() => MotelBloc(serviceLocator()));
}
