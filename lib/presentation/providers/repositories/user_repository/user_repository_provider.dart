import 'package:flix_id/data/dummies/dummy_user_repository.dart';
import 'package:flix_id/data/repositories/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_repository_provider.g.dart';

@riverpod
UserRepository userRepository(UserRepositoryRef ref) => DummyUserRepository();
