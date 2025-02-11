import 'package:dartz/dartz.dart';
import 'package:guia_moteis_v1/config/error/failure.dart';
import 'package:guia_moteis_v1/features/home/data/models/motel_item_model.dart';

abstract class MotelRepository {
  Future<Either<Failure, List<Motel>>> fetchMoteis();
}
