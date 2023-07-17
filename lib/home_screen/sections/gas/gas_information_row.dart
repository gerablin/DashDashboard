import 'package:flutter/material.dart';

import '../../../model/gas_station.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/size_config.dart';

class GasStationRow extends StatelessWidget {
  final GasStation station;

  const GasStationRow({
    super.key,
    required GasStation this.station,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.blockSizeHorizontal * 16,
      height: SizeConfig.blockSizeVertical * 30,
      child: Card(
        color: Colors.black12,
        shape: const RoundedRectangleBorder(
            side: BorderSide(color: AppColors.accentBlue),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(textAlign: TextAlign.center, style: Theme
                        .of(context)
                        .textTheme
                        .titleMedium, "${station.getSuperPrice()} €"),
                    Text(textAlign: TextAlign.center, style: Theme
                        .of(context)
                        .textTheme
                        .titleSmall, "${station.dist.toString()} KM")
                  ],
                ),
              ),
              Text(textAlign: TextAlign.center, style: Theme
                  .of(context)
                  .textTheme
                  .bodyMedium, "${station.name}"),
              Text(textAlign: TextAlign.center, style: Theme
                  .of(context)
                  .textTheme
                  .bodyMedium, "${station.street}")
            ],
          ),
        ),
      ),
    );
  }
}