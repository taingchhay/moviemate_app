import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviemate_app/features/home/bloc/home_bloc.dart';
import 'package:moviemate_app/features/home/bloc/home_event.dart';
import 'package:moviemate_app/features/home/bloc/home_state.dart';
import 'package:moviemate_app/features/home/data/home_repository.dart';
import 'package:moviemate_app/shared/widgets/highlight_widget.dart';
import 'package:moviemate_app/shared/widgets/movie_card.dart';
import 'package:moviemate_app/shared/widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              HomeBloc(homeRepository: HomeRepository())
                ..add(const LoadHomeDataEvent()),
      child: const _HomeScreenContent(),
    );
  }
}

class _HomeScreenContent extends StatefulWidget {
  const _HomeScreenContent();

  @override
  State<_HomeScreenContent> createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<_HomeScreenContent> {
  bool _isSearching = false;  // ← toggle

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        titleSpacing: 0,
        title: _isSearching
            ? Padding(
                padding: const EdgeInsets.only(left: 16),
                child: SearchBarWidget(
                  onChanged: (query) {
                    // connect to Bloc later when API is ready
                  },
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Image.asset(
                  'assets/moviemate_logo.jpg',
                  height: 36,
                ),
              ),
        actions: [
          _isSearching
              ? IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: () => setState(() => _isSearching = false),
                )
              : IconButton(
                  icon: const Icon(Icons.search, color: Colors.white),
                  onPressed: () => setState(() => _isSearching = true),
                ),
        ],
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeInitial || state is HomeLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          }

          if (state is HomeSuccess) {
            final screenWidth = MediaQuery.of(context).size.width;
            final isMobile = screenWidth < 600;
            final isTablet = screenWidth >= 600 && screenWidth < 1000;

            final gridColumns = isMobile ? 2 : isTablet ? 3 : 4;
            final horizontalPadding = isMobile ? 12.0 : isTablet ? 16.0 : 20.0;
            final gridSpacing = isMobile ? 12.0 : isTablet ? 14.0 : 16.0;
            final titleFontSize = isMobile ? 18.0 : isTablet ? 20.0 : 24.0;

            return SafeArea(
              child: RefreshIndicator(
                onRefresh: () async {
                  context.read<HomeBloc>();
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),

                      //HIGHLIGHT SLIDER
                      if (state.highlights.isNotEmpty)
                        HighlightSliderWidget(highlights: state.highlights)
                      else
                        const Padding(
                          padding: EdgeInsets.all(12),
                          child: Text(
                            'No highlights available',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),

                      const SizedBox(height: 30),

                      //TRENDING MOVIES SECTION
                      if (state.movies.isNotEmpty) ...[
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: horizontalPadding,
                          ),
                          child: Text(
                            'Trending Movies',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: titleFontSize,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: gridSpacing),

                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: horizontalPadding - 2,
                          ),
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: gridColumns,
                                  crossAxisSpacing: gridSpacing,
                                  mainAxisSpacing: gridSpacing,
                                  childAspectRatio: 0.60,
                                ),
                            itemCount: state.movies.length,
                            itemBuilder: (context, index) {
                              return MovieCard(movie: state.movies[index]);
                            },
                          ),
                        ),

                        const SizedBox(height: 20),
                      ] else
                        const Padding(
                          padding: EdgeInsets.all(12),
                          child: Text(
                            'No movies available',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            );
          }

          return const Center(
            child: Text('Unknown state', style: TextStyle(color: Colors.white)),
          );
        },
      ),
    );
  }
}