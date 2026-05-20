import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviemate_app/features/bloc/home_event.dart';
import 'package:moviemate_app/features/bloc/home_state.dart';
import 'package:moviemate_app/features/home/data/home_repository.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;

  HomeBloc({required this.homeRepository}) : super(const HomeInitial()) {
    on<LoadHomeDataEvent>(_onLoadData);
    on<SelectCategoryEvent>(_onSelectCategory);
    // on<RefreshHomeDataEvent>(_onLoadData);
  }

  Future<void> _onLoadData(HomeEvent event, Emitter<HomeState> emit) async {
    emit(const HomeLoading());
    try {
      final (highlights, movies) = await homeRepository.loadHomeData();

      if (highlights.isEmpty && movies.isEmpty) {
        emit(const HomeError(message: 'No data available from server'));
      } else {
        emit(HomeSuccess(highlights: highlights, movies: movies));
      }
    } catch (e) {
      emit(HomeError(message: 'Failed to load data: $e'));
    }
  }

  Future<void> _onSelectCategory(
    SelectCategoryEvent event,
    Emitter<HomeState> emit,
  ) async {
    final currentState = state;
    if (currentState is HomeSuccess) {
      emit(
        HomeSuccess(
          highlights: currentState.highlights,
          movies: currentState.movies,
          selectedCategory: event.category,
        ),
      );
    }
  }
}
