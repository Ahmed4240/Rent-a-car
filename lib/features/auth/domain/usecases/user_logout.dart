import 'package:fpdart/fpdart.dart';

import '../../../../core/entities/no_params.dart';
import '../../../../core/error/Failure.dart';
import '../../../../core/usecases/use_case.dart';
import '../repositories/auth_repository.dart';

class UserLogout implements UseCase<bool, NoParams> {
  final AuthRepository authRepository;

  UserLogout(this.authRepository);

  @override
  Future<Either<Failure, bool>> call(params) async {
    return await authRepository.userLogout();
  }
}
