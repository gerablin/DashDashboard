import 'dart:convert';
import 'package:dash_dashboard/services/gas_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/gas_station.dart';

final gasStations = FutureProvider<List<GasStation>>((ref) async {
  List gasStations = List.empty();
  final response = await GasService().requestNearbyGasStations();
  gasStations = json.decode(response.body)["stations"];
  print(gasStations);
  return gasStations.map((station) => GasStation.fromJson(station)).toList();
});