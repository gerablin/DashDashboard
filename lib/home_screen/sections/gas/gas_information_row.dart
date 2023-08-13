import 'package:flutter/material.dart';

import '../../../model/gas_station.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/size_config.dart';

class GasStationRow extends StatelessWidget {
  final GasStation station;

  const GasStationRow({
    super.key,
    required this.station,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.blockSizeHorizontal * 17,
      height: SizeConfig.blockSizeVertical * 32,
      child: Card(
        color: Colors.black12,
        shape: const RoundedRectangleBorder(
            side: BorderSide(color: AppColors.accentBlue),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    GasPriceText(station: station),
                    StationDistanceText(station: station)
                  ],
                ),
              ),
              StationNameText(station: station),
              StationAdressText(station: station)
            ],
          ),
        ),
      ),
    );
  }
}

class StationAdressText extends StatelessWidget {
  const StationAdressText({
    super.key,
    required this.station,
  });

  final GasStation station;

  @override
  Widget build(BuildContext context) {
    return Text(
        textAlign: TextAlign.center,
        maxLines: 2,
        style: Theme.of(context).textTheme.bodyMedium,
        "${station.street}");
  }
}

class StationNameText extends StatelessWidget {
  const StationNameText({
    super.key,
    required this.station,
  });

  final GasStation station;

  @override
  Widget build(BuildContext context) {
    return Text(
        textAlign: TextAlign.center,
        maxLines: 2,
        style: Theme.of(context).textTheme.bodyMedium,
        "${station.name}");
  }
}

class GasPriceText extends StatelessWidget {
  const GasPriceText({
    super.key,
    required this.station,
  });

  final GasStation station;

  @override
  Widget build(BuildContext context) {
    return Text(
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleMedium,
        "${station.getSuperPrice()} €");
  }
}

class StationDistanceText extends StatelessWidget {
  const StationDistanceText({
    super.key,
    required this.station,
  });

  final GasStation station;

  @override
  Widget build(BuildContext context) {
    return Text(
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleSmall,
        "${station.dist.toString()} KM");
  }
}
