import 'package:flutter/material.dart';
import 'package:wether_app/shared/cubit/cubit.dart';

import 'other_city_card.dart';

class OtherCityList extends StatelessWidget {
  const OtherCityList({super.key});

  @override
  Widget build(BuildContext context) {
    var weatherDataList = WeatherCubit.get(context).weatherData;
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => OtherCityCard(cityName: WeatherCubit.get(context).cities[index],weatherData: weatherDataList[index]),
      separatorBuilder: (context, index) => const SizedBox(width: 10,),
      itemCount: weatherDataList.length,
    );
  }
}