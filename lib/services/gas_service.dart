import 'dart:convert';

import 'package:dash_dashboard/utils/secrets.dart';
import 'package:http/http.dart' as http;
import '../model/gas_station.dart';

class GasService  {
  List _gasStations = List.empty();

  Future<List<GasStation>> fetchNearbyGasStations() async {
    final queryParameters = {
      'lat': '49.99545336085801',
      'lng': '8.23069815940411',
      'rad' : '5.0',
      'type': 'all',
      'apikey' : Secrets.gasApiKey
    };
    final gasUri = Uri.https(Secrets.gasApiBaseUrl, Secrets.gasApiList,
        queryParameters);

    http.Response response = await http.get(gasUri);
    _gasStations = json.decode(response.body)["stations"];
    print(_gasStations);
    return _gasStations.map((station) => GasStation.fromJson(station)).toList();
  }
}