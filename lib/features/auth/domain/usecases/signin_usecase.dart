import 'package:fpdart/fpdart.dart';
import 'package:rent_a_car/core/error/Failure.dart';
import 'package:rent_a_car/core/usecases/use_case.dart';
import 'package:rent_a_car/features/auth/data/models/user_model.dart';
import 'package:rent_a_car/features/auth/domain/repositories/auth_repository.dart';

class SignInUseCase implements UseCase<UserModel, UserSignInParams> {
  final AuthRepository authRepository;

  SignInUseCase(this.authRepository);

  @override
  Future<Either<Failure, UserModel>> call(UserSignInParams params) async {
    return await authRepository.signInWithEmailPassword(
        email: params.email, password: params.password);
  }
}

class UserSignInParams {
  final String email;
  final String password;

  UserSignInParams({required this.email, required this.password});
}
