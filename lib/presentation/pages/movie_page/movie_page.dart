import 'package:flix_id/presentation/misc/methods.dart';
import 'package:flix_id/presentation/pages/movie_page/methods/movie_list.dart';
import 'package:flix_id/presentation/pages/movie_page/methods/promotion_list.dart';
import 'package:flix_id/presentation/pages/movie_page/methods/search_bar.dart';
import 'package:flix_id/presentation/pages/movie_page/methods/user_info.dart';
import 'package:flix_id/presentation/providers/movies/now_playing_provider.dart';
import 'package:flix_id/presentation/providers/movies/upcoming_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoviePage extends ConsumerWidget {
  final List<String> promotionImageFile = const [
    'popcorn.jpg',
    'buy1get1.jpg',
  ];

  const MoviePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            userInfo(ref),
            verticalSpace(40.0),
            searchBar(context),
            verticalSpace(24.0),
            ...movieList(
              title: 'Now Playing',
              movies: ref.watch(nowPlayingProvider),
              onTap: (movie) {
                // TODO: Move to movie detail page
              },
            ),
            verticalSpace(30.0),
            ...promotionList(promotionImageFile),
            verticalSpace(30.0),
            ...movieList(
              title: 'Upcoming',
              movies: ref.watch(upcomingProvider),
            ),
            verticalSpace(100.0),
          ],
        ),
      ],
    );
  }
}
