import '../../widgets/ticket.dart';
import '../../providers/transaction_data/transaction_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TicketPage extends ConsumerStatefulWidget {
  const TicketPage({super.key});

  @override
  ConsumerState<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends ConsumerState<TicketPage> {
  @override
  void didUpdateWidget(covariant TicketPage oldWidget) {
    ref.watch(transactionDataProvider.notifier).refreshTransactionData();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ref.watch(transactionDataProvider).isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: ref.watch(transactionDataProvider).when(
                          data: (tx) => (tx
                                  .where((e) =>
                                      e.title != 'Top Up' &&
                                      e.watchingTime! >=
                                          DateTime.now().millisecondsSinceEpoch)
                                  .toList()
                                ..sort((a, b) =>
                                    a.watchingTime!.compareTo(b.watchingTime!)))
                              .map((e) => Ticket(
                                    transaction: e,
                                  ))
                              .toList(),
                          error: (error, stackTrace) => [],
                          loading: () => [const Center(child: SizedBox())],
                        ),
                  ),
                ),
              ],
            ),
    );
  }
}
