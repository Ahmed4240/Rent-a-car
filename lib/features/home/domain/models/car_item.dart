class CarItem {
  final String carID;
  final String make;
  final String model;
  final int year;
  final String color;
  final String bodyStyle;
  final String fuelType;
  final String transmission;
  final double engineSize;
  final double fuelEconomy;
  final double price;
  final int mileage;
  final String vin;
  final String registration;
  final String insurance;
  final String ownerID;
  final DateTime purchaseDate;
  final DateTime lastServiceDate;
  final DateTime nextServiceDate;
  final String warranty;

  CarItem({
    required this.carID,
    required this.make,
    required this.model,
    required this.year,
    required this.color,
    required this.bodyStyle,
    required this.fuelType,
    required this.transmission,
    required this.engineSize,
    required this.fuelEconomy,
    required this.price,
    required this.mileage,
    required this.vin,
    required this.registration,
    required this.insurance,
    required this.ownerID,
    required this.purchaseDate,
    required this.lastServiceDate,
    required this.nextServiceDate,
    required this.warranty,
  });

  factory CarItem.fromJson(Map<String, dynamic> json) {
    return CarItem(
      carID: json['CarID'],
      make: json['Make'],
      model: json['Model'],
      year: json['Year'],
      color: json['Color'],
      bodyStyle: json['BodyStyle'],
      fuelType: json['FuelType'],
      transmission: json['Transmission'],
      engineSize: json['EngineSize'].toDouble(),
      fuelEconomy: json['FuelEconomy'].toDouble(),
      price: json['Price'].toDouble(),
      mileage: json['Mileage'],
      vin: json['VIN'],
      registration: json['Registration'],
      insurance: json['Insurance'],
      ownerID: json['OwnerID'],
      purchaseDate: DateTime.parse(json['PurchaseDate']),
      lastServiceDate: DateTime.parse(json['LastServiceDate']),
      nextServiceDate: DateTime.parse(json['NextServiceDate']),
      warranty: json['Warranty'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'CarID': carID,
      'Make': make,
      'Model': model,
      'Year': year,
      'Color': color,
      'BodyStyle': bodyStyle,
      'FuelType': fuelType,
      'Transmission': transmission,
      'EngineSize': engineSize,
      'FuelEconomy': fuelEconomy,
      'Price': price,
      'Mileage': mileage,
      'VIN': vin,
      'Registration': registration,
      'Insurance': insurance,
      'OwnerID': ownerID,
      'PurchaseDate': purchaseDate.toIso8601String(),
      'LastServiceDate': lastServiceDate.toIso8601String(),
      'NextServiceDate': nextServiceDate.toIso8601String(),
      'Warranty': warranty,
    };
  }
}
