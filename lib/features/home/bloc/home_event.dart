import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class LoadHomeDataEvent extends HomeEvent {
  const LoadHomeDataEvent();

  @override
  List<Object?> get props => [];
}

// class RefreshHomeDataEvent extends HomeEvent {
//   const RefreshHomeDataEvent();

//   @override
//   List<Object?> get props => [];
// }
