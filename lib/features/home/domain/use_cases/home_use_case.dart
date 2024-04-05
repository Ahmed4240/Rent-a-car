import 'package:fpdart/fpdart.dart';
import 'package:rent_a_car/core/error/Failure.dart';
import 'package:rent_a_car/core/usecases/use_case.dart';
import 'package:rent_a_car/features/home/domain/models/car_item.dart';
import 'package:rent_a_car/features/home/domain/repositories/home_repository.dart';

import '../../../../core/entities/no_params.dart';

class HomeUseCase implements UseCase<List<CarItem>, NoParams> {
  final HomeRepository homeRepository;

  HomeUseCase(this.homeRepository);

  @override
  Future<Either<Failure, List<CarItem>>> call(NoParams params) {
    return homeRepository.loadAllCars();
  }
}
