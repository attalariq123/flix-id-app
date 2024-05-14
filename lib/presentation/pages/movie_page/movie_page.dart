import '../../misc/methods.dart';
import 'methods/movie_list.dart';
import 'methods/promotion_list.dart';
import 'methods/search_bar.dart';
import 'methods/user_info.dart';
import '../../providers/movies/now_playing_provider.dart';
import '../../providers/movies/upcoming_provider.dart';
import '../../providers/router/router_provider.dart';
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
              onTap: (movie) =>
                  ref.watch(routerProvider).pushNamed('detail', extra: movie),
            ),
            verticalSpace(30.0),
            ...promotionList(promotionImageFile),
            verticalSpace(30.0),
            ...movieList(
              title: 'Upcoming',
              movies: ref.watch(upcomingProvider),
              onTap: (movie) =>
                  ref.watch(routerProvider).pushNamed('detail', extra: movie),
            ),
            verticalSpace(100.0),
          ],
        ),
      ],
    );
  }
}
