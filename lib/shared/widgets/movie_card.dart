import 'package:flutter/material.dart';
import '../models/movie_model.dart';

class MovieCard extends StatelessWidget {
  final MovieModel movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1000;

    // Responsive dimensions
    final imageHeight =
        isMobile
            ? 200.0
            : isTablet
            ? 280.0
            : 320.0;
    final borderRadius = isMobile ? 10.0 : 12.0;
    final titleFontSize =
        isMobile
            ? 12.0
            : isTablet
            ? 14.0
            : 16.0;
    final tagFontSize = isMobile ? 9.0 : 11.0;
    final episodeFontSize = isMobile ? 10.0 : 12.0;
    final spacing = isMobile ? 6.0 : 10.0;
    final verticalSpacing = isMobile ? 6.0 : 8.0;
    final iconSize = isMobile ? 14.0 : 18.0;

    return GestureDetector(
      onTap: () {
        //Handle movie tap
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Movie Poster
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(borderRadius),
                child: Image.network(
                  movie.image,
                  height: imageHeight,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: imageHeight,
                      color: Colors.grey[800],
                      child: Center(
                        child: Icon(
                          Icons.broken_image,
                          color: Colors.grey,
                          size: iconSize * 1.5,
                        ),
                      ),
                    );
                  },
                ),
              ),
              //Bookmark Icon
              Positioned(
                top: isMobile ? 6 : 8,
                right: isMobile ? 6 : 8,
                child: Container(
                  padding: EdgeInsets.all(isMobile ? 4 : 6),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(isMobile ? 4 : 6),
                  ),
                  child: Icon(
                    Icons.bookmark_outline,
                    color: Colors.white,
                    size: iconSize,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: verticalSpacing),

          // 📝 Movie Title
          Text(
            movie.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: titleFontSize,
            ),
          ),
          SizedBox(height: verticalSpacing),

          // 🏷️ Tags (Year, Type, Sound)
          Wrap(
            spacing: spacing * 0.7,
            runSpacing: spacing * 0.5,
            children: [
              _buildTag(movie.year.toString(), tagFontSize),
              _buildTag(movie.type.toUpperCase(), tagFontSize),
              _buildTag(
                movie.soundType == 'humanVoice' ? 'Human Voice' : 'AI Voice',
                tagFontSize,
              ),
            ],
          ),
          SizedBox(height: verticalSpacing),

          // 📺 Episode Count (if applicable)
          if (movie.category != 'documentary')
            Text(
              '${(movie.rating.toInt())} episodes',
              style: TextStyle(color: Colors.grey, fontSize: episodeFontSize),
            ),
        ],
      ),
    );
  }

  Widget _buildTag(String label, double fontSize) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: fontSize > 10 ? 8 : 6,
        vertical: fontSize > 10 ? 4 : 3,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(fontSize > 10 ? 4 : 3),
      ),
      child: Text(
        label,
        style: TextStyle(color: Colors.white70, fontSize: fontSize),
      ),
    );
  }
}
