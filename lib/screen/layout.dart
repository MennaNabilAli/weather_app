import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:wether_app/shared/component/main_city_card.dart';
import 'package:wether_app/shared/component/other_city_list.dart';
import 'package:wether_app/shared/component/other_five_day_list.dart';
import 'package:wether_app/shared/cubit/cubit.dart';
import 'package:wether_app/shared/cubit/states.dart';

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit()..getWeatherOtherCity()..fetchWeatherData(),
      child: BlocConsumer<WeatherCubit, WeatherStats>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final DateTime currentTime = DateTime.now();
          bool isBefore7PM = currentTime.hour >= 18 || currentTime.hour < 5;
          return Scaffold(
            body:  WeatherCubit.get(context).currentWeather != null && WeatherCubit.get(context).weatherFiveDay != null?
            Container(
              decoration:  BoxDecoration(
                image: DecorationImage(
                  colorFilter:
                      ColorFilter.mode(Colors.black45, BlendMode.darken),
                  image: isBefore7PM == false ?
                  AssetImage(
                    'assets/images/cloud-in-blue-sky.jpg',
                  ):
                  AssetImage(
                    'assets/images/sky_night.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  AppBar(
                    leading: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.menu,
                      ),
                    ),
                  ),
                  const MainCityCard(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0 , vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '5-Day Forcast',
                          style: TextStyle(
                            color: Colors.white70
                          ),
                        ),
                        const SizedBox(height: 8,),
                        Container(
                          height: 163,
                          child: const OtherFiveDayList(),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5,left: 15,right: 15 ,bottom: 15),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Other City',
                              style: TextStyle(
                                color: Colors.white70
                              ),
                            ),
                            SizedBox(height: 5,),
                            Container(
                              height: 141,
                              child: OtherCityList(),
                            )
                          ],
                        )
                    ),
                  ),
                ],
              ),
            ) :
            const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
