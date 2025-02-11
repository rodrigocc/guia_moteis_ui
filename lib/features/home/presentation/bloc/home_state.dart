import 'package:equatable/equatable.dart';
import 'package:guia_moteis_v1/features/home/data/models/motel_item_model.dart';

sealed class MotelState extends Equatable {
  @override
  List<Object> get props => [];
}

final class MotelInitial extends MotelState {}

final class MotelLoading extends MotelState {}

final class MotelLoaded extends MotelState {
  final List<Motel> moteis;

  MotelLoaded({required this.moteis});

  @override
  List<Object> get props => [moteis];
}

final class MotelError extends MotelState {
  final String message;

  MotelError(this.message);

  @override
  List<Object> get props => [message];
}
