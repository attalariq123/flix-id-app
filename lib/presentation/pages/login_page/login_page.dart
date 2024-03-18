// import 'package:flix_id/data/dummies/dummy_authentication.dart';
// import 'package:flix_id/data/dummies/dummy_user_repository.dart';
import 'package:flix_id/data/firebase/firebase_authentication.dart';
import 'package:flix_id/data/firebase/firebase_user_repository.dart';
import 'package:flix_id/domain/usecases/login/login.dart';
import 'package:flix_id/presentation/pages/main_page/main_page.dart';
import 'package:flix_id/presentation/providers/usecase/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Login login = ref.watch(loginProvider);

            login(LoginParams(email: 'atta@gmail.com', password: 'atta123'))
                .then((result) => {
                      if (result.isSuccess)
                        {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                MainPage(user: result.resultValue!),
                          ))
                        }
                      else
                        {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(result.errorMessage!),
                          ))
                        }
                    });
          },
          child: const Text('Login'),
        ),
      ),
    );
  }
}
