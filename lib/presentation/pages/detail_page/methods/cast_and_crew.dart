import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/entities/movie.dart';
import '../../../misc/methods.dart';
import '../../../providers/movies/actors_provider.dart';
import '../../../widgets/network_image_card.dart';

List<Widget> castAndCrew({
  required Movie movie,
  required WidgetRef ref,
}) =>
    [
      const Padding(
        padding: EdgeInsets.only(left: 24),
        child: Text(
          'Cast',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      verticalSpace(10.0),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            horizontalSpace(24.0),
            ...(ref.watch(actorsProvider(movieId: movie.id)).whenOrNull(
                      data: (actors) => actors
                          .where((e) => e.profilePath != null)
                          .map((e) => Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Column(
                                  children: [
                                    NetworkImageCard(
                                      width: 100,
                                      height: 152,
                                      imageUrl:
                                          'https://image.tmdb.org/t/p/w500${e.profilePath}',
                                      fit: BoxFit.cover,
                                    ),
                                    verticalSpace(5.0),
                                    SizedBox(
                                      width: 100,
                                      child: Text(
                                        e.name,
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                    ) ??
                []),
            horizontalSpace(14.0),
          ],
        ),
      ),
    ];
