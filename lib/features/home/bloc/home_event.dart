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

class SelectCategoryEvent extends HomeEvent {
  final String category;

  const SelectCategoryEvent({required this.category});

  @override
  List<Object?> get props => [category];
}

// class RefreshHomeDataEvent extends HomeEvent {
//   const RefreshHomeDataEvent();

//   @override
//   List<Object?> get props => [];
// }
