import 'package:test_aja/controller/mock_data.dart';
import 'package:test_aja/models/car_models.dart';
import 'package:flutter/material.dart';

class CarProvider extends ChangeNotifier {
  final List<Cars> _cars = DUMMY_CAR_DATAS;

  List<Cars> get cars => _cars;

  // Stream and Sink Process di sini !!!
  Cars? selectedCar;

  void selectCar(Cars data) {
    selectedCar = data;
    notifyListeners();
  }
  // set selectingCar(Car data) => selectedCar = data;
  // Car get selectedCar => _selectedCar ?? _cars[0];
}
