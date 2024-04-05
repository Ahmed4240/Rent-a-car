import 'package:fpdart/fpdart.dart';
import 'package:rent_a_car/core/error/Failure.dart';
import 'package:rent_a_car/core/usecases/use_case.dart';
import 'package:rent_a_car/features/auth/data/models/user_model.dart';
import 'package:rent_a_car/features/auth/domain/repositories/auth_repository.dart';

class SignUpUseCase implements UseCase<UserModel, UserSignUpParams> {
  final AuthRepository authRepository;

  SignUpUseCase(this.authRepository);

  @override
  Future<Either<Failure, UserModel>> call(UserSignUpParams params) async {
    return await authRepository.signUpWithEmailPassword(
        name: params.name, email: params.email, password: params.password);
  }
}

class UserSignUpParams {
  final String name;
  final String email;
  final String password;

  UserSignUpParams(
      {required this.name, required this.email, required this.password});
}
