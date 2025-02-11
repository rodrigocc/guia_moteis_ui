import 'package:dartz/dartz.dart';
import 'package:guia_moteis_v1/config/error/failure.dart';
import 'package:guia_moteis_v1/features/home/data/datasources/fetch_list_moteis_datasource.dart';
import 'package:guia_moteis_v1/features/home/data/models/motel_item_model.dart';
import 'package:guia_moteis_v1/features/home/domain/repositories/motel_repository.dart';

class MotelRepositoryImpl implements MotelRepository {
  final MotelRemoteDataSource remoteDataSource;

  MotelRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Motel>>> fetchMoteis() async {
    try {
      final listMotel = await remoteDataSource.fetchMoteis();

      return Right(listMotel);
    } catch (e) {
      return Left(ResponseApiFailure());
    }
  }
}
