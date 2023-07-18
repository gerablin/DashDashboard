import 'package:dash_dashboard/services/gas_repository.dart';
import 'package:dash_dashboard/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../model/gas_station.dart';
import 'gas_information_row.dart';

class GasInformation extends ConsumerWidget {
  const GasInformation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<GasStation>> stations = ref.watch(gasStations);

    return stations.when(
      data: (stations) => Padding(
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...stations.map(
                    (station) => GasStationRow(station: station),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      error: (err, stack) => Text('Error: $err',style: const TextStyle(fontSize: 20,color: Colors.red),),
      loading: () => const CircularProgressIndicator(),
    );
  }
}

// class _GasInformationState extends State<GasInformation> {
//   var _gasService = GasService();
//   var _gasStations = List.empty();
//
//   void onClick() async {
//     // _gasStations = await _gasService.fetchNearbyGasStations();
//     setState(() {});
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _gasStations = MockGasStations().gasStationList;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 Text(
//                   textAlign: TextAlign.left,
//                   style: Theme.of(context).textTheme.titleMedium,
//                   "Tankstellen",
//                 ),
//                 const ReloadButton()
//               ],
//             ),
//           ),
//           Row(
//             children: [
//               ..._gasStations.map(
//                 (station) => GasStationRow(station: station),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

class ReloadButton extends StatelessWidget {
  const ReloadButton({
    super.key,
  });

  void onClick() async {
    print("Clicked");
    // _gasStations = await _gasService.fetchNearbyGasStations();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: InkWell(
        onTap: () => onClick(),
        child: const FaIcon(
          FontAwesomeIcons.rotateLeft,
          color: AppColors.white,
        ),
      ),
    );
  }
}
