import 'package:dash_dashboard/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../model/gas_station.dart';
import '../../../services/gas_service.dart';
import '../../../utils/mocks/MockGasStations.dart';
import '../../../utils/size_config.dart';

class GasInformation extends StatefulWidget {
  const GasInformation({super.key});

  @override
  State<GasInformation> createState() => _GasInformationState();
}

class _GasInformationState extends State<GasInformation> {
  var _gasService = GasService();
  var _gasStations = List.empty();

  void onClick() async {
    // _gasStations = await _gasService.fetchNearbyGasStations();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _gasStations = MockGasStations().gasStationList;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ..._gasStations.map(
          (station) => GasStationRow(station: station),
        ),
      ],
    );
  }
}

class GasStationRow extends StatelessWidget {
  final GasStation station;

  const GasStationRow({
    super.key,
    required GasStation this.station,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black12,
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: AppColors.accentBlue),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10))),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(style: TextStyle(fontSize: SizeConfig.blockSizeVertical*7),"${station.e5}"),
          ),
          Text("${station.name}"),
          Text("${station.street}")
        ],
      ),
    );
  }
}
