import 'package:dash_dashboard/utils/secrets.dart';
import 'package:http/http.dart' as http;
import '../model/gas_station.dart';

class GasService  {
  List<GasStation> _gasStations = List.empty();

  Future<List<GasStation>> fetchNearbyGasStations() async {
    final queryParameters = {
      'lat': '49.99545336085801',
      'long': '8.23069815940411',
      'rad' : '5.0',
      'apiKey' : Secrets.gasApiKey
    };
    final gasUri = Uri.https(Secrets.gasApiBaseUrl, Secrets.gasApiList,
        queryParameters);
    final uri =
        Uri.https('www.myurl.com', '/api/v1/test', queryParameters);

    var response = await http.get(gasUri);
    print(response.toString());

    return _gasStations;
  }
}