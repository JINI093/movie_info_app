import 'package:flutter/material.dart';
import 'package:flutter_movie_info_app/ui/widgets/movie_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 상단 메인 포스터
            Container(
              height: 500,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://image.tmdb.org/t/p/original/your_moana_image.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // 가장 인기있는 섹션
            const MovieSection(
              title: '가장 인기있는',
              movies: ['모아나2', '베놈', '엘리베이션'],
            ),

            // 현재 상영중 섹션
            const MovieSection(
              title: '현재 상영중',
              movies: ['모아나2', '베놈', '엘리베이션'],
            ),
          ],
        ),
      ),
    );
  }
}
