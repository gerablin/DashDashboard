import 'package:dash_dashboard/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../model/gas_station.dart';
import '../../../services/gas_service.dart';
import '../../../utils/mocks/MockGasStations.dart';
import '../../../utils/size_config.dart';
import 'gas_information_row.dart';

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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.titleMedium,
                  "Tankstellen",
                ),
                const ReloadButton()
              ],
            ),
          ),
          Row(
            children: [
              ..._gasStations.map(
                (station) => GasStationRow(station: station),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ReloadButton extends StatelessWidget {
  const ReloadButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 8.0),
      child: InkWell(
        child: FaIcon(
          FontAwesomeIcons.rotateLeft,
          color: AppColors.white,
        ),
      ),
    );
  }
}
