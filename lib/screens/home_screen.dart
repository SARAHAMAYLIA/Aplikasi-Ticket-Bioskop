// lib/screens/home_screen.dart

import 'package:flutter/material.dart';
import '../utils/colors.dart';

// Konsistenkan tinggi gambar yang dipakai di dashboard dan card
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
      'date': '05 Nov 2025',
      'likes': '132'
    },
    {
      'title': 'THE FIRST RIDE',
      'rating': '4.7',
      'genre': 'Drama',
      'duration': '2h 12m',
      'poster': 'assets/Posters/Interstellar.jpg',
      'date': '07 Nov 2025',
      'likes': '189'
    },
    {
      'title': 'AMALA',
      'rating': '4.2',
      'genre': 'Action',
      'duration': '2h 12m',
      'poster': 'assets/Posters/marvel.jpg',
      'date': '10 Nov 2025',
      'likes': '98'
    },
  ];

  final List<Map<String, dynamic>> upcomingMovies = const [
    {
      'title': 'Vaathi',
      'reminder': true,
      'genre': 'Action · Thriller',
      'poster': 'assets/Posters/mulan.jpg'
    },
    {
      'title': 'Shehzada',
      'reminder': false,
      'genre': 'Action · Comedy',
      'poster': 'assets/Posters/StarWars.jpg'
    },
    {
      'title': 'New Film Title',
      'reminder': true,
      'genre': 'Drama',
      'poster': 'assets/Posters/thelastofus.jpg'
    },
    {
      'title': 'Another Film',
      'reminder': false,
      'genre': 'Sci-Fi',
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
            children: <Widget>[
              _buildCustomAppBar(context),
              const SizedBox(height: 20),
              _buildSearchBar(context),
              const SizedBox(height: 16),

              // Banner Promo
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/Posters/StarWars.jpg',
                    height: kDashboardImageHeight,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 18),
              _buildMovieSectionHeader(context, 'Explore Movies'),
              const SizedBox(height: 12),
              _buildNowShowingList(),
              const SizedBox(height: 20),

              _buildMovieSectionHeader(context, 'Upcoming Movies'),
              const SizedBox(height: 12),
              _buildUpcomingMoviesList(context),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildCustomAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Row(
                children: [
                  Icon(Icons.location_on, color: kAccentColor, size: 20),
                  SizedBox(width: 4),
                  Text('Chennai',
                      style: TextStyle(
                          color: kTextColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  Icon(Icons.keyboard_arrow_down, color: kTextColor, size: 20),
                ],
              ),
              Text('Welcome to Cinemasy',
                  style: TextStyle(color: kTextSecondary, fontSize: 14)),
            ],
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon:
                      const Icon(Icons.notifications_none, color: kTextColor)),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.qr_code_scanner, color: kTextColor)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
          color: kInputFillColor, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          const Icon(Icons.search, color: kAccentColor),
          const SizedBox(width: 8),
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Search movies or theatres',
                  hintStyle: TextStyle(color: kTextSecondary),
                  border: InputBorder.none),
              style: TextStyle(color: kTextColor),
            ),
          ),
          const Icon(Icons.mic, color: kAccentColor),
        ],
      ),
    );
  }

  Widget _buildMovieSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: const TextStyle(
                  color: kTextColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          TextButton(
              onPressed: () {},
              child: const Text('View all',
                  style: TextStyle(color: kAccentColor))),
        ],
      ),
    );
  }

  Widget _buildNowShowingList() {
    return SizedBox(
      // Sesuaikan tinggi list agar proporsional dengan tinggi gambar baru
      height: kDashboardImageHeight + 80,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 20.0),
        scrollDirection: Axis.horizontal,
        itemCount: nowShowingMovies.length,
        itemBuilder: (context, index) {
          final movie = nowShowingMovies[index];
          return _buildMoviePosterCard(
            movie['title']!,
            movie['rating']!,
            movie['genre']!,
            movie['duration']!,
            movie['poster']!,
          );
        },
      ),
    );
  }

  Widget _buildMoviePosterCard(String title, String rating, String genre,
      String duration, String posterPath) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              posterPath,
              height: kDashboardImageHeight,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(title,
              style: const TextStyle(
                  color: kTextColor, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis),
          Row(
            children: [
              const Icon(Icons.star, color: Colors.yellow, size: 14),
              const SizedBox(width: 4),
              Text(rating, style: const TextStyle(color: kTextSecondary)),
              const Spacer(),
              Text('U · $duration',
                  style: const TextStyle(color: kTextSecondary)),
            ],
          ),
          Text(genre,
              style: const TextStyle(color: kTextSecondary, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildUpcomingMoviesList(BuildContext context) {
    // Hitung childAspectRatio secara dinamis agar tinggi card sesuai
    // dengan tinggi gambar (`kDashboardImageHeight`) ditambah ruang konten.
    final screenWidth = MediaQuery.of(context).size.width;
    const horizontalPadding = 20.0 * 2; // left + right padding dari parent
    const crossAxisSpacing = 15.0; // sama seperti grid spacing
    // Lebar item (2 kolom)
    final itemWidth = (screenWidth - horizontalPadding - crossAxisSpacing) / 2;
    // Perkiraan tinggi konten di bawah gambar (judul, genre, tombol) — sesuaikan jika perlu
    const contentHeight = 86.0;
    final itemHeight = kDashboardImageHeight + contentHeight;
    final childAspectRatio = itemWidth / itemHeight;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: crossAxisSpacing,
          mainAxisSpacing: crossAxisSpacing,
          childAspectRatio: childAspectRatio,
        ),
        itemCount: upcomingMovies.length,
        itemBuilder: (context, index) {
          final movie = upcomingMovies[index];
          return _buildUpcomingMovieCard(
            movie['title']!,
            movie['reminder'],
            movie['genre']!,
            movie['poster']!,
          );
        },
      ),
    );
  }

  Widget _buildUpcomingMovieCard(
      String title, bool isReminderSet, String genre, String posterPath) {
    return Card(
      color: kInputFillColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              posterPath,
              height: kDashboardImageHeight,
              width: double.infinity,
              fit: BoxFit.cover, // ⭐ Gambar pas dan proporsional
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        color: kTextColor, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis),
                const SizedBox(height: 4),
                Text(genre,
                    style:
                        const TextStyle(color: kTextSecondary, fontSize: 12)),
                const SizedBox(height: 6),
                if (!isReminderSet)
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.schedule, size: 16),
                    label: const Text('Remind me'),
                    style: TextButton.styleFrom(
                        foregroundColor: kAccentColor,
                        padding: EdgeInsets.zero),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kInputFillColor,
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 10)
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        selectedItemColor: kAccentColor,
        unselectedItemColor: kTextSecondary,
        currentIndex: 0,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.movie_filter_rounded), label: 'Movies'),
          BottomNavigationBarItem(
              icon: Icon(Icons.theaters_rounded), label: 'Theatres'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border), label: 'Saved'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }
}
