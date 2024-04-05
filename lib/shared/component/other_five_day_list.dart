import 'package:flutter/material.dart';
import 'package:wether_app/shared/component/other_five_day_card.dart';
import 'package:wether_app/shared/cubit/cubit.dart';

import 'other_city_card.dart';

class OtherFiveDayList extends StatelessWidget {
  const OtherFiveDayList({super.key});

  @override
  Widget build(BuildContext context) {
    var weatherDataList = WeatherCubit.get(context).weatherFiveDay!.list;
    return  Container(
      padding: const EdgeInsets.only(top: 6 , bottom: 6),
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20)
      ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => OtherFiveDayCard(weatherData: weatherDataList[index]),
        separatorBuilder: (context, index) => const SizedBox(width: 3,),
        itemCount: weatherDataList!.length,
      ),
    );
  }
}

