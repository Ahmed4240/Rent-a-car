import 'package:fpdart/fpdart.dart';
import 'package:rent_a_car/core/error/Failure.dart';
import 'package:rent_a_car/core/error/exceptions.dart';
import 'package:rent_a_car/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:rent_a_car/features/auth/data/models/user_model.dart';
import 'package:rent_a_car/features/auth/domain/repositories/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/network/connection_checker.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final ConnectionChecker connectionChecker;

  AuthRepositoryImpl(this.authRemoteDataSource, this.connectionChecker);

  @override
  Future<Either<Failure, UserModel>> signInWithEmailPassword(
      {required String email, required String password}) async {
    return _getUser(() async => await authRemoteDataSource
        .signInWithEmailPassword(email: email, password: password));
  }

  @override
  Future<Either<Failure, UserModel>> signUpWithEmailPassword(
      {required String name, required String email, required String password}) {
    return _getUser(() async => await authRemoteDataSource
        .signUpWithEmailPassword(name: name, email: email, password: password));
  }

  @override
  Future<Either<Failure, bool>> userLogout() async {
    try {
      final result = await authRemoteDataSource.userLogout();
      return right(result);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } on AuthException catch (e) {
      return left(Failure(e.message));
    }
  }

  Future<Either<Failure, UserModel>> _getUser(
      Future<UserModel> Function() fn) async {
    try {
      final UserModel user = await fn();
      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } on AuthException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, UserModel>> getCurrentUserData() async {
    try {
      if (!await (connectionChecker.isConnected)) {
        final session = authRemoteDataSource.currentUserSession;
        if (session == null) {
          print('User data is not available!');
          return left(Failure('User data is not available!'));
        } else {
          print('email ${session.user.email}');
          return right(UserModel(
              id: session.user.id, email: session.user.email ?? '', name: ''));
        }
      }
      final user = await authRemoteDataSource.getCurrentUseData();
      if (user != null) {
        return right(user);
      } else {
        return left(Failure('User data is not available!'));
      }
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
