import 'package:flutter/material.dart';
import '../utils/colors.dart';

const double kDashboardImageHeight = 140.0;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Map<String, String>> nowShowingMovies = const [
    {
      'title': 'PREDATOR: BADLANDS',
      'rating': '4.5',
      'genre': 'Action',
      'duration': '2h 15m',
      'poster': 'assets/Posters/inception.jpg',
    },
    {
      'title': 'THE FIRST RIDE',
      'rating': '4.7',
      'genre': 'Drama',
      'duration': '2h 12m',
      'poster': 'assets/Posters/Interstellar.jpg',
    },
    {
      'title': 'AMALA',
      'rating': '4.2',
      'genre': 'Action',
      'duration': '2h 12m',
      'poster': 'assets/Posters/marvel.jpg',
    },
  ];

  final List<Map<String, dynamic>> upcomingMovies = const [
    {
      'title': 'Vaathi',
      'reminder': true,
      'genre': 'Action · Thriller',
      'description':
          'Seorang guru melawan ketidakadilan dalam sistem pendidikan.',
      'poster': 'assets/Posters/mulan.jpg'
    },
    {
      'title': 'Shehzada',
      'reminder': false,
      'genre': 'Action · Comedy',
      'description': 'Seorang pria mengetahui rahasia masa lalunya yang rumit.',
      'poster': 'assets/Posters/StarWars.jpg'
    },
    {
      'title': 'New Film Title',
      'reminder': true,
      'genre': 'Drama',
      'description': 'Sebuah perjalanan emosional penuh konflik batin.',
      'poster': 'assets/Posters/thelastofus.jpg'
    },
    {
      'title': 'Another Film',
      'reminder': false,
      'genre': 'Sci-Fi',
      'description': 'Dunia masa depan penuh misteri dan teknologi.',
      'poster': 'assets/Posters/thewindrises.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCustomAppBar(),
              const SizedBox(height: 20),
              _buildSearchBar(),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/Posters/StarWars.jpg',
                    height: kDashboardImageHeight,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _buildSectionTitle('Now Showing'),
              const SizedBox(height: 10),
              _buildNowShowingList(),
              const SizedBox(height: 25),
              _buildSectionTitle('Upcoming Movies'),
              const SizedBox(height: 10),
              _buildUpcomingMoviesList(),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildCustomAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text('Welcome to Cinemasy',
              style: TextStyle(
                  color: kTextColor,
                  fontSize: 19,
                  fontWeight: FontWeight.bold)),
          Icon(Icons.notifications_none, color: kTextColor)
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: kInputFillColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: const [
          Icon(Icons.search, color: kAccentColor),
          SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search movies...',
                border: InputBorder.none,
                hintStyle: TextStyle(color: kTextSecondary),
              ),
              style: TextStyle(color: kTextColor),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(title,
          style: const TextStyle(
              color: kTextColor, fontSize: 20, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildNowShowingList() {
    return SizedBox(
      height: kDashboardImageHeight + 80,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 20),
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: nowShowingMovies.length,
        itemBuilder: (context, index) {
          final movie = nowShowingMovies[index];
          return Container(
            width: 150,
            margin: const EdgeInsets.only(right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    movie['poster']!,
                    height: kDashboardImageHeight,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 8),
                Text(movie['title']!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: kTextColor, fontWeight: FontWeight.bold)),
                Text("${movie['genre']} • ${movie['duration']}",
                    style:
                        const TextStyle(color: kTextSecondary, fontSize: 12)),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildUpcomingMoviesList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: 0.65,
        ),
        itemCount: upcomingMovies.length,
        itemBuilder: (context, index) {
          final movie = upcomingMovies[index];
          return _buildUpcomingMovieCard(movie);
        },
      ),
    );
  }

  Widget _buildUpcomingMovieCard(Map<String, dynamic> movie) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Gambar Poster - Fixed Height
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: SizedBox(
              height: 160,
              width: double.infinity,
              child: Image.asset(
                movie['poster'],
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Konten Info Film
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Judul Film
                  Text(
                    movie['title'],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 3),

                  // Genre
                  Text(
                    movie['genre'],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 10,
                    ),
                  ),
                  const SizedBox(height: 4),

                  // Deskripsi
                  Expanded(
                    child: Text(
                      movie['description'],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 10,
                        height: 1.3,
                      ),
                    ),
                  ),

                  // Bookmark Button di pojok kanan bawah
                  const SizedBox(height: 4),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          print('Bookmark clicked for ${movie['title']}');
                        },
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: kAccentColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            movie['reminder']
                                ? Icons.bookmark
                                : Icons.bookmark_border,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      selectedItemColor: kAccentColor,
      unselectedItemColor: kTextSecondary,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.movie), label: "Movies"),
        BottomNavigationBarItem(icon: Icon(Icons.theaters), label: "Theatres"),
        BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border), label: "Saved"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],
    );
  }
}
