import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:test_aja/models/car_models.dart';

class Api {
  Future<List<Cars>> readCars() async {
    final jsonData =
        await rootBundle.loadString('assets/json/data_berita.json');
    final decoded = json.decode(jsonData) as List<dynamic>;

    return decoded.map((e) => Cars.fromJson(e)).toList();
  }
}
