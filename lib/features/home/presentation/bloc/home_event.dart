import 'package:equatable/equatable.dart';

sealed class MotelEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class FetchMoteisEvent extends MotelEvent {}
