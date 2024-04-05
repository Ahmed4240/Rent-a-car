import '../../features/home/domain/models/car_item.dart';

List<CarItem> getDummyCars() {
  List<String> makes = ['Toyota', 'Tesla', 'Honda', 'Ford', 'Chevrolet', 'BMW', 'Mercedes', 'Audi', 'Lexus', 'Hyundai'];

  List<String> models = ['Camry', 'Model S', 'Civic', 'Mustang', 'Cruze', '3 Series', 'E-Class', 'A4', 'RX', 'Elantra'];

  return List.generate(10, (index) {
    return CarItem(
      carID: 'CarID_$index',
      make: makes[index % makes.length],
      model: models[index % models.length],
      year: 2020 + index,
      color: 'Color_$index',
      bodyStyle: 'BodyStyle_$index',
      fuelType: 'FuelType_$index',
      transmission: 'Transmission_$index',
      engineSize: 2.0 + index,
      fuelEconomy: 30.0 + index,
      price: 20000.0 + (index * 1000),
      mileage: 10000 + (index * 500),
      vin: 'VIN_$index',
      registration: 'Registration_$index',
      insurance: 'Insurance_$index',
      ownerID: 'OwnerID_$index',
      purchaseDate: DateTime(2020 + index, 1, 1),
      lastServiceDate: DateTime(2020 + index, 1, 15),
      nextServiceDate: DateTime(2020 + index, 2, 1),
      warranty: 'Warranty_$index',
    );
  });
}