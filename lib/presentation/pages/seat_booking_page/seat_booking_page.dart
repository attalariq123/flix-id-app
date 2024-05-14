import 'dart:math';

import '../../extensions/build_context_extension.dart';
import '../../misc/constants.dart';
import '../../misc/methods.dart';
import 'methods/legend.dart';
import 'methods/movie_screen.dart';
import 'methods/seat_section.dart';
import '../../widgets/seat.dart';

import '../../../domain/entities/movie_detail.dart';
import '../../../domain/entities/transaction.dart';
import '../../providers/router/router_provider.dart';
import '../../widgets/back_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SeatBookingPage extends ConsumerStatefulWidget {
  final (MovieDetail, Transaction) transactionDetail;

  const SeatBookingPage({super.key, required this.transactionDetail});

  @override
  ConsumerState<SeatBookingPage> createState() => _SeatBookingPageState();
}

class _SeatBookingPageState extends ConsumerState<SeatBookingPage> {
  List<int> selectedSeats = [];
  List<int> reservedSeats = [];

  @override
  void initState() {
    super.initState();

    Random random = Random();
    int seatNumber = random.nextInt(36) + 1;

    while (reservedSeats.length < 8) {
      if (!reservedSeats.contains(seatNumber)) {
        reservedSeats.add(seatNumber);
      }
      seatNumber = random.nextInt(36) + 1;
    }
  }

  void onSeatTap(number) {
    if (!selectedSeats.contains(number)) {
      setState(() {
        selectedSeats.add(number);
      });
    } else {
      setState(() {
        selectedSeats.remove(number);
      });
    }
  }

  SeatStatus seatStatusChecker(seatNumber) => reservedSeats.contains(seatNumber)
      ? SeatStatus.reserved
      : selectedSeats.contains(seatNumber)
          ? SeatStatus.selected
          : SeatStatus.available;

  @override
  Widget build(BuildContext context) {
    final (movieDetail, transaction) = widget.transactionDetail;

    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                BackNavigationBar(
                  title: movieDetail.title,
                  onTap: () => ref.read(routerProvider).pop(),
                ),
                movieScreen(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    seatSection(
                      seatNumbers: List.generate(18, (index) => index + 1),
                      onTap: onSeatTap,
                      seatStatusChecker: seatStatusChecker,
                    ),
                    horizontalSpace(30.0),
                    seatSection(
                      seatNumbers: List.generate(18, (index) => index + 19),
                      onTap: onSeatTap,
                      seatStatusChecker: seatStatusChecker,
                    ),
                  ],
                ),
                verticalSpace(20),
                legend(),
                verticalSpace(40),
                Text(
                  '${selectedSeats.length} seats selected',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                verticalSpace(40.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (selectedSeats.isEmpty) {
                        context.showSnackBar('Please select at least one seat');
                      } else {
                        var updatedTransaction = transaction.copyWith(
                          seats:
                              (selectedSeats..sort()).map((e) => '$e').toList(),
                          ticketAmount: selectedSeats.length,
                          ticketPrice: 25000,
                        );

                        ref.read(routerProvider).pushNamed(
                          'booking-confirmation',
                          extra: (movieDetail, updatedTransaction),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: saffron,
                        foregroundColor: backgroundColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: const Text(
                      'Next',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
