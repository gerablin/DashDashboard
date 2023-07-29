import 'package:dash_dashboard/providers/gas_repository.dart';
import 'package:dash_dashboard/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import '../../../model/gas_station.dart';
import 'gas_information_row.dart';

class GasInformation extends ConsumerWidget {
  const GasInformation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<GasStation>> stations = ref.watch(gasStations);
    final lastUpdated = DateFormat("Hms").format(ref.watch(gasStationsLastUpdated));

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
                  const Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: ReloadButton(),
                  ) ,
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(lastUpdated.toString(),
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontStyle: FontStyle.italic)
                    ),
                  ),
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

class ReloadButton extends ConsumerStatefulWidget {
  const ReloadButton({
    super.key,
  });

  @override
  ReloadButtonState createState() => ReloadButtonState();
}

class ReloadButtonState extends ConsumerState<ReloadButton> {
  void onClick() async {
    // request api Again
    // refresh last updated time
    ref.refresh(gasStations);
    ref.refresh(gasStationsLastUpdated);
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
