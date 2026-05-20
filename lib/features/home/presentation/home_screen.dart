import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviemate_app/features/home/bloc/home_bloc.dart';
import 'package:moviemate_app/features/home/bloc/home_event.dart';
import 'package:moviemate_app/features/home/bloc/home_state.dart';
import 'package:moviemate_app/features/home/data/home_repository.dart';
import 'package:moviemate_app/features/home/presentation/movie_detail_screen.dart';
import 'package:moviemate_app/features/home/presentation/search_page.dart';
import 'package:moviemate_app/shared/widgets/highlight_widget.dart';
import 'package:moviemate_app/shared/widgets/movie_card.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Image.asset('assets/app_Logo.png', height: 36),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchPage()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Image.asset(
                'assets/search_Button.png',
                width: 40,
                height: 40,
                fit: BoxFit.contain,
              ),
            ),
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

            final gridColumns =
                isMobile
                    ? 2
                    : isTablet
                    ? 3
                    : 4;
            final horizontalPadding =
                isMobile
                    ? 12.0
                    : isTablet
                    ? 16.0
                    : 20.0;
            final gridSpacing =
                isMobile
                    ? 12.0
                    : isTablet
                    ? 14.0
                    : 16.0;
            final titleFontSize =
                isMobile
                    ? 18.0
                    : isTablet
                    ? 20.0
                    : 24.0;

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

                       //CATEGORY FILTER SECTION
                      if (state.movies.isNotEmpty)
                        SizedBox(
                          height: 48,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.symmetric(
                              horizontal: horizontalPadding,
                            ),
                            children:
                                [
                                      'All Movies',
                                      'Drama',
                                      'Action',
                                      'Sports',
                                      'Kids',
                                    ]
                                    .map(
                                      (category) => Padding(
                                        padding: const EdgeInsets.only(
                                          right: 8,
                                        ),
                                        child: GestureDetector(
                                          onTap: () {
                                            context.read<HomeBloc>().add(
                                              SelectCategoryEvent(
                                                category: category,
                                              ),
                                            );
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 16,
                                              vertical: 8,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  state.selectedCategory ==
                                                          category
                                                            ? const Color(0xFFD946A6)
                                                            : const Color(0xFF222222),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Center(
                                              child: Text(
                                                category,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: isMobile ? 12 : 14,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                          ),
                        ),

                      const SizedBox(height: 20),

                      //HIGHLIGHT SLIDER
                      if (state.highlights.isNotEmpty) ...[
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: horizontalPadding,
                          ),
                          child: Text(
                            'Highlights',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: titleFontSize,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: gridSpacing),
                        HighlightSliderWidget(highlights: state.highlights),
                      ] else
                        const Padding(
                          padding: EdgeInsets.all(12),
                          child: Text(
                            'No highlights available',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),

                      const SizedBox(height: 30),

                      //TRENDING MOVIES SECTION
                      if (state.filteredMovies.isNotEmpty) ...[
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
                            itemCount: state.filteredMovies.length,
                            itemBuilder: (context, index) {
                              final movie = state.filteredMovies[index];
                              return MovieCard(
                                movie: movie,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) =>
                                              MovieDetailScreen(movie: movie),
                                    ),
                                  );
                                },
                              );
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
