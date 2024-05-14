import 'package:flix_id/domain/entities/movie_detail.dart';
import 'package:flix_id/domain/entities/transaction.dart';
import 'package:flix_id/presentation/extensions/build_context_extension.dart';
import 'package:flix_id/presentation/misc/constants.dart';
import 'package:flix_id/presentation/misc/methods.dart';
import 'package:flix_id/presentation/pages/schedule_booking_page/methods/options.dart';
import 'package:flix_id/presentation/providers/router/router_provider.dart';
import 'package:flix_id/presentation/providers/user_data/user_data_provider.dart';
import 'package:flix_id/presentation/widgets/back_navigation_bar.dart';
import 'package:flix_id/presentation/widgets/network_image_card.dart';
import 'package:intl/intl.dart';

import '../../widgets/selectable_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScheduleBookingPage extends ConsumerStatefulWidget {
  final MovieDetail movieDetail;

  const ScheduleBookingPage(this.movieDetail, {super.key});

  @override
  ConsumerState<ScheduleBookingPage> createState() =>
      _ScheduleBookingPageState();
}

class _ScheduleBookingPageState extends ConsumerState<ScheduleBookingPage> {
  final List<String> theaters = [
    'XXI The Botanica',
    'XXI Cihampelas Walk',
    'CGV Paris Van Java',
    'CGV Paskal 23',
  ];

  final List<DateTime> dates = List.generate(7, (index) {
    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);

    return date.add(Duration(days: index));
  });

  final List<int> hours = List.generate(12, (index) => index + 11);

  String? selectedTheater;
  DateTime? selectedDate;
  int? selectedHour;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(24),
                child: BackNavigationBar(
                  title: widget.movieDetail.title,
                  onTap: () => ref.read(routerProvider).pop(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                child: NetworkImageCard(
                  width: MediaQuery.of(context).size.width - 48,
                  height: (MediaQuery.of(context).size.width - 48) * 0.6,
                  fit: BoxFit.cover,
                  imageUrl:
                      'https://image.tmdb.org/t/p/w500${widget.movieDetail.backdropPath ?? widget.movieDetail.posterPath}',
                ),
              ),
              ...options(
                title: 'Select a theater',
                options: theaters,
                selectedItem: selectedTheater,
                onTap: (object) => setState(() {
                  selectedTheater = object;
                }),
              ),
              verticalSpace(24.0),
              ...options(
                title: 'Select date',
                options: dates,
                selectedItem: selectedDate,
                isOptionsEnable: (object) => selectedTheater != null,
                converter: (date) => DateFormat('EEE, d MMMM y').format(date),
                onTap: (object) => setState(() {
                  selectedDate = object;
                }),
              ),
              verticalSpace(24.0),
              ...options(
                title: 'Select show time',
                options: hours,
                selectedItem: selectedHour,
                converter: (object) => '$object:00',
                isOptionsEnable: (object) =>
                    selectedDate != null &&
                    DateTime(selectedDate!.year, selectedDate!.month,
                            selectedDate!.day, object)
                        .isAfter(DateTime.now()),
                onTap: (object) => setState(() {
                  selectedHour = object;
                }),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
                child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            textStyle:
                                const TextStyle(fontWeight: FontWeight.bold),
                            foregroundColor: backgroundColor,
                            backgroundColor: saffron,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {
                          if (selectedTheater == null ||
                              selectedDate == null ||
                              selectedHour == null) {
                            context.showSnackBar('Please select all options');
                          } else {
                            Transaction transaction = Transaction(
                              uid: ref.read(userDataProvider).value!.uid,
                              title: widget.movieDetail.title,
                              adminFee: 3000,
                              total: 0,
                              watchingTime: DateTime(
                                selectedDate!.year,
                                selectedDate!.month,
                                selectedDate!.day,
                                selectedHour!,
                              ).millisecondsSinceEpoch,
                              theaterName: selectedTheater,
                              transactionImage: widget.movieDetail.posterPath,
                              ticketPrice: 0,
                            );

                            ref.read(routerProvider).pushNamed('seat-booking',
                                extra: (widget.movieDetail, transaction));
                          }
                        },
                        child: const Text('Next'))),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
