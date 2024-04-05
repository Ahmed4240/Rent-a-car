import 'package:rent_a_car/core/error/exceptions.dart';
import 'package:rent_a_car/core/utils/get_dummy_cars.dart';
import 'package:rent_a_car/features/home/domain/models/car_item.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class HomeDataSource {
  Future<List<CarItem>> loadAddCars();
}

class HomeDataSourceImp implements HomeDataSource {
  final SupabaseClient supabaseClient;

  HomeDataSourceImp(this.supabaseClient);

  @override
  Future<List<CarItem>> loadAddCars() async {
    try {
      return getDummyCars();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
