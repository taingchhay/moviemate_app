import 'package:flutter/material.dart';
import '../../../shared/models/movie_model.dart';
import '../../../shared/widgets/custom_app_bar.dart';
import '../../../shared/widgets/movie_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<MovieModel> movies = [
      MovieModel(
        title: 'Avengers',
        image:
            'https://images.unsplash.com/photo-1489599849927-2ee91cede3ba',
      ),
      MovieModel(
        title: 'Batman',
        image:
            'https://images.unsplash.com/photo-1517604931442-7e0c8ed2963c',
      ),
      MovieModel(
        title: 'Interstellar',
        image:
            'https://images.unsplash.com/photo-1440404653325-ab127d49abc1',
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(),
              const SizedBox(height: 24),
              const Text(
                'Trending Movies',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 240,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    return MovieCard(movie: movies[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer),
            label: 'Promotion',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_collection),
            label: 'Rooms',
          ),
        ],
      ),
    );
  }
}