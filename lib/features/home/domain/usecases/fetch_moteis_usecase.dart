import 'package:dartz/dartz.dart';
import 'package:guia_moteis_v1/config/error/failure.dart';
import 'package:guia_moteis_v1/config/usecases/async_usecase.dart';
import 'package:guia_moteis_v1/config/usecases/usecase_params.dart';
import 'package:guia_moteis_v1/features/home/data/models/motel_item_model.dart';
import 'package:guia_moteis_v1/features/home/domain/repositories/motel_repository.dart';

class FetchMoteisUseCase implements AsyncListUseCase<Motel, NoParams> {
  final MotelRepository repository;

  FetchMoteisUseCase({required this.repository});

  @override
  Future<Either<Failure, List<Motel>>> call(params) async =>
      await repository.fetchMoteis();
}
