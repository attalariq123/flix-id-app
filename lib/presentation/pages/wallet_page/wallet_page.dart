import 'package:flix_id/presentation/pages/wallet_page/methods/wallet_card.dart';
import 'package:flix_id/presentation/providers/transaction_data/transaction_data_provider.dart';

import '../../misc/methods.dart';
import 'methods/recent_transactions.dart';
import '../../providers/router/router_provider.dart';
import '../../widgets/back_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WalletPage extends ConsumerWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var tx = ref.read(transactionDataProvider).valueOrNull!.isEmpty;

    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
            child: Column(
              children: [
                BackNavigationBar(
                  title: 'My Wallet',
                  onTap: () => ref.read(routerProvider).pop(),
                ),
                verticalSpace(24),
                walletCard(ref),
                verticalSpace(24),
                if (!tx) ...recentTransactions(ref) else const SizedBox()
              ],
            ),
          )
        ],
      ),
    );
  }
}
