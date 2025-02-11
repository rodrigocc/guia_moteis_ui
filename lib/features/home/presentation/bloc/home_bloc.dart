import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:guia_moteis_v1/config/error/failure.dart';
import 'package:guia_moteis_v1/config/usecases/usecase_params.dart';
import 'package:guia_moteis_v1/features/home/data/models/motel_item_model.dart';
import 'package:guia_moteis_v1/features/home/domain/usecases/fetch_moteis_usecase.dart';
import 'package:guia_moteis_v1/features/home/presentation/bloc/home_event.dart';
import 'package:guia_moteis_v1/features/home/presentation/bloc/home_state.dart';

class MotelBloc extends Bloc<MotelEvent, MotelState> {
  final FetchMoteisUseCase fetchMoteis;

  MotelBloc(this.fetchMoteis) : super(MotelInitial()) {
    on<FetchMoteisEvent>(_onFetchMoteis);
  }

  Future<void> _onFetchMoteis(
      FetchMoteisEvent event, Emitter<MotelState> emit) async {
    emit(MotelLoading());

    final Either<Failure, List<Motel>> result =
        await fetchMoteis.call(NoParams()); // Sem event.call()

    result.fold(
      (failure) => emit(MotelError(_mapFailureToMessage(failure))),
      (moteis) => emit(MotelLoaded(moteis: moteis)),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    if (failure is ServerFailure) {
      return "Erro no servidor. Tente novamente mais tarde.";
    } else if (failure is NetworkFailure) {
      return "Sem conexão com a internet.";
    } else {
      return "Erro desconhecido.";
    }
  }
}
