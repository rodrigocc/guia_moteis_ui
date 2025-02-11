import 'package:dartz/dartz.dart';
import 'package:guia_moteis_v1/config/error/failure.dart';

abstract class AsyncListUseCase<Type, Params> {
  Future<Either<Failure, List<Type>>> call(Params params);
}
