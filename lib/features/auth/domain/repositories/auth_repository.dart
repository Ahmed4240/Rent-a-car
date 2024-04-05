import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:rent_a_car/core/error/Failure.dart';
import 'package:rent_a_car/features/auth/data/models/user_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserModel>> signUpWithEmailPassword(
      {required String name, required String email, required String password});

  Future<Either<Failure, UserModel>> signInWithEmailPassword(
      {required String email, required String password});

  Future<Either<Failure, UserModel>> getCurrentUserData();
  Future<Either<Failure, bool>> userLogout();
}
