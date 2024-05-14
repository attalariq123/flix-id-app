import '../../../../domain/entities/movie_detail.dart';
import '../../../misc/methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<Widget> movieShortInfo({
  required AsyncValue<MovieDetail?> asyncMovieDetail,
  required BuildContext context,
}) =>
    [
      Row(
        children: [
          SizedBox(
            width: 14,
            height: 14,
            child: Image.asset('assets/duration.png'),
          ),
          horizontalSpace(5.0),
          SizedBox(
            width: 95,
            child: Text(
                asyncMovieDetail.when(
                  data: (data) =>
                      data != null ? '${data.runtime} minutes' : '-',
                  error: (error, stackTrace) => '-',
                  loading: () => '-',
                ),
                style: const TextStyle(fontSize: 12)),
          ),
          SizedBox(
            width: 14,
            height: 14,
            child: Image.asset('assets/genre.png'),
          ),
          horizontalSpace(5.0),
          Expanded(
            child: asyncMovieDetail.when(
              data: (data) {
                String genres = data?.genres.join(", ") ?? '-';

                return Text(
                  genres,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12),
                );
              },
              error: (error, stackTrace) =>
                  const Text('-', style: TextStyle(fontSize: 12)),
              loading: () => const Text('-', style: TextStyle(fontSize: 12)),
            ),
          ),
        ],
      ),
      verticalSpace(10.0),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: Image.asset('assets/star.png'),
          ),
          horizontalSpace(5.0),
          Text((asyncMovieDetail.valueOrNull?.voteAverage ?? 0.0)
              .toStringAsFixed(1))
        ],
      ),
    ];
