import 'package:fpdart/fpdart.dart';
import 'package:get_it/get_it.dart';
import 'package:rent_a_car/core/error/Failure.dart';
import 'package:rent_a_car/core/error/exceptions.dart';
import 'package:rent_a_car/features/home/data/data_sources/home_data_source.dart';
import 'package:rent_a_car/features/home/domain/models/car_item.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<CarItem>>> loadAllCars();
}

class HomeRepositoryImpl implements HomeRepository{
  final HomeDataSource homeDataSource;

  HomeRepositoryImpl(this.homeDataSource);
  @override
  Future<Either<Failure, List<CarItem>>> loadAllCars() async{
    try{
      final carsList = await homeDataSource.loadAddCars();
      if(carsList.isNotEmpty){
        return right(carsList);
      }else{
        return left(Failure('Desire data list is not found!'));
      }
    }on ServerException catch (e){
      return left(Failure(e.message));
    }
  }
}