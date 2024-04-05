import 'package:fpdart/fpdart.dart';

import '../../../../core/entities/no_params.dart';
import '../../../../core/error/Failure.dart';
import '../../../../core/usecases/use_case.dart';
import '../../data/models/user_model.dart';
import '../repositories/auth_repository.dart';

class CurrentUser implements UseCase<UserModel, NoParams> {
  final AuthRepository authRepository;

  CurrentUser(this.authRepository);

  @override
  Future<Either<Failure, UserModel>> call(params) async {
    return await authRepository.getCurrentUserData();
  }
}

