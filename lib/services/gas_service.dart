
import 'package:dash_dashboard/utils/secrets.dart';
import 'package:http/http.dart' as http;

class GasService  {
  Future<http.Response> requestNearbyGasStations()  {
    final queryParameters = {
      'lat': '49.99545336085801',
      'lng': '8.23069815940411',
      'rad' : '5.0',
      'type': 'all',
      'apikey' : Secrets.gasApiKey
    };
    final gasUri = Uri.https(Secrets.gasApiBaseUrl, Secrets.gasApiList,
        queryParameters);

    return http.get(gasUri);
  }
}