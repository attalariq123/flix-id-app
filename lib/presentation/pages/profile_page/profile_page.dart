import '../../providers/router/router_provider.dart';
import '../../widgets/back_navigation_bar.dart';

import '../../misc/methods.dart';
import '../../providers/user_data/user_data_provider.dart';

import 'methods/profile_item.dart';
import 'methods/user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePage extends ConsumerWidget {
  final bool canPop;

  const ProfilePage({this.canPop = false, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                verticalSpace(20),
                canPop
                    ? BackNavigationBar(
                        title: '',
                        onTap: () => ref.read(routerProvider).pop(),
                      )
                    : const SizedBox(),
                ...userInfo(ref),
                verticalSpace(10),
                const Divider(),
                verticalSpace(20),
                profileItem('Update Profile'),
                verticalSpace(20),
                profileItem('My Wallet',
                    onTap: () => ref.read(routerProvider).pushNamed('wallet')),
                verticalSpace(20),
                profileItem('Change Password'),
                verticalSpace(20),
                profileItem('Change Language'),
                verticalSpace(20),
                const Divider(),
                verticalSpace(20),
                profileItem('Contact Us'),
                verticalSpace(20),
                profileItem('Privacy Policy'),
                verticalSpace(20),
                profileItem('Terms and Conditions'),
                verticalSpace(20),
                const Divider(),
                verticalSpace(60),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () =>
                        ref.read(userDataProvider.notifier).logout(),
                    child: const Text('Logout'),
                  ),
                ),
                verticalSpace(20),
                const Text(
                  'Version 0.0.1',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
