import 'dart:io';

class BikeModel {
  String brand;
  String modelName;
  String? frontShockPsi;
  String? frontShockSag;
  String? frontShockHsc;
  String? frontShockLsc;
  String? frontShockHsr;
  String? frontShockLsr;
  String? rearShockPsi;
  String? rearShockSag;
  String? rearShockHsc;
  String? rearShockLsc;
  String? rearShockHsr;
  String? rearShockLsr;
  int? frontTirePsi;
  int? rearTirePsi;
  dynamic image;

  BikeModel({
    required this.brand,
    required this.modelName,
    this.frontShockPsi,
    this.frontShockSag,
    this.frontShockHsc,
    this.frontShockLsc,
    this.frontShockHsr,
    this.frontShockLsr,
    this.rearShockPsi,
    this.rearShockSag,
    this.rearShockHsc,
    this.rearShockLsc,
    this.rearShockHsr,
    this.rearShockLsr,
    this.frontTirePsi,
    this.rearTirePsi,
    required this.image,
  });

  factory BikeModel.fromJson(Map<String, dynamic> json) {
    return BikeModel(
      brand: json['brand'],
      modelName: json['model_name'],
      frontShockPsi: json['front_shock_psi'],
      frontShockSag: json['front_shock_sag'],
      frontShockHsc: json['front_shock_hsc'],
      frontShockLsc: json['front_shock_lsc'],
      frontShockHsr: json['front_shock_hsr'],
      frontShockLsr: json['front_shock_lsr'],
      rearShockPsi: json['rear_shock_psi'],
      rearShockSag: json['rear_shock_sag'],
      rearShockHsc: json['rear_shock_hsc'],
      rearShockLsc: json['rear_shock_lsc'],
      rearShockHsr: json['rear_shock_hsr'],
      rearShockLsr: json['rear_shock_lsr'],
      frontTirePsi: json['front_tire_psi'],
      rearTirePsi: json['rear_tire_psi'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'brand': brand,
      'model_name': modelName,
      'image': image,
    };

    if (frontShockPsi != null) data['front_shock_psi'] = frontShockPsi;
    if (frontShockSag != null) data['front_shock_sag'] = frontShockSag;
    if (frontShockHsc != null) data['front_shock_hsc'] = frontShockHsc;
    if (frontShockLsc != null) data['front_shock_lsc'] = frontShockLsc;
    if (frontShockHsr != null) data['front_shock_hsr'] = frontShockHsr;
    if (frontShockLsr != null) data['front_shock_lsr'] = frontShockLsr;
    if (rearShockPsi != null) data['rear_shock_psi'] = rearShockPsi;
    if (rearShockSag != null) data['rear_shock_sag'] = rearShockSag;
    if (rearShockHsc != null) data['rear_shock_hsc'] = rearShockHsc;
    if (rearShockLsc != null) data['rear_shock_lsc'] = rearShockLsc;
    if (rearShockHsr != null) data['rear_shock_hsr'] = rearShockHsr;
    if (rearShockLsr != null) data['rear_shock_lsr'] = rearShockLsr;
    if (frontTirePsi != null) data['front_tire_psi'] = frontTirePsi;
    if (rearTirePsi != null) data['rear_tire_psi'] = rearTirePsi;

    return data;
  }
}
