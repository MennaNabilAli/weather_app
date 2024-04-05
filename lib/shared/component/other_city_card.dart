import 'package:flutter/material.dart';
import '../../models/current_weather_model.dart';
import '../cubit/cubit.dart';

class OtherCityCard extends StatelessWidget {
  final String cityName;
  final CurrentWeather? weatherData;
  const OtherCityCard({
    super.key, required this.cityName, required this.weatherData,
  });

  @override
  Widget build(BuildContext context) {
    final DateTime currentTime = DateTime.now();
    bool isBefore7PM = currentTime.hour >= 18 || currentTime.hour < 5;
    return Container(
      padding: const EdgeInsets.only(top: 6 , bottom: 6),
      width: 150,
      height: 130,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        children: [
          Text(
            '${weatherData?.name}',
            style: const TextStyle(
                color: Colors.white70,
                fontSize: 18,
                fontWeight: FontWeight.bold
            ),
          ),
          Text(
              weatherData!.main?.temp != null ?
            '${(weatherData!.main?.temp - 273.15).round().toString()}\u2103' :
            '',
            style: const TextStyle(
                color: Colors.white70,
                fontSize: 17,
                fontWeight: FontWeight.w500
            ),
          ),
          weatherData!.weather?[0].description == 'overcast clouds' ?
          Image(
            image: AssetImage('assets/images/rain.png',),
            width: 50,
            height: 50,
          ):
          isBefore7PM == false ?
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
            '${weatherData!.weather?[0].description}',
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
