import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/current_weather_model.dart';
import '../../models/wethear_five_day_model.dart';
import '../cubit/cubit.dart';

class OtherFiveDayCard extends StatelessWidget {
  final Weathers ? weatherData;
  const OtherFiveDayCard({
    super.key, this.weatherData
  });

  @override
  Widget build(BuildContext context) {
    final DateTime parsedDateTime = DateTime.parse(weatherData!.dtTxt!);
    bool isNightTime = parsedDateTime.hour >= 18 || parsedDateTime.hour < 5;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 10),
      child: Column(
        children: [
          Text(
            '${DateFormat.jm().format(DateTime.parse(weatherData!.dtTxt!))}',
            style: const TextStyle(
                color: Colors.white70,
                fontSize: 18,
                fontWeight: FontWeight.bold
            ),
          ),
          Text(
            '${DateFormat.E().format(DateTime.parse(weatherData!.dtTxt!))}',
            style: const TextStyle(
                color: Colors.white70,
                fontSize: 18,
                fontWeight: FontWeight.bold
            ),
          ),
          weatherData!.weather?[0].description == 'overcast clouds' ?
          Image(
            image: AssetImage('assets/images/rain.png',),
            width: 50,
            height: 50,
          ):
          isNightTime == false ?
          Image(
            image: AssetImage('assets/images/sun.png',),
            width: 50,
            height: 50,
          ) :
          Image(
            image: AssetImage('assets/images/moon.png',),
            width: 50,
            height: 50,
          ),
          Text(
            '${(weatherData!.main?.temp - 273.15).round().toString()}\u2103 \| ${weatherData!.weather?[0].description}',
            style: const TextStyle(
                color: Colors.white70,
                fontSize: 15,
                fontWeight: FontWeight.w500
            ),
          ),
        ],
      ),
    );

  }
}
