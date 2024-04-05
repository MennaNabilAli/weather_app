import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../cubit/cubit.dart';

class MainCityCard extends StatelessWidget {
  const MainCityCard({super.key});

  @override
  Widget build(BuildContext context) {
    // final cityController = TextEditingController();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                color: Colors.white70,
                size: 16,
              ),
              SizedBox(width: 5,),
              Text(
                '${WeatherCubit.get(context).currentWeather?.name}',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white70
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8,),
        Align(
          alignment: Alignment.center,
          child: Text(
            WeatherCubit.get(context).currentWeather?.main?.temp != null?
            '${(WeatherCubit.get(context).currentWeather?.main?.temp - 273.15).round().toString()}\u2103':
            '',
            style: TextStyle(
                fontSize: 65,
                // fontWeight: FontWeight.bold,
                color: Colors.white70
            ),
          ),
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${WeatherCubit.get(context).currentWeather?.weather?[0].description} - ',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white70
                  ),
                ),
                Text(
                  WeatherCubit.get(context).currentWeather?.main?.tempMin != null ?
                  'Min : ${(WeatherCubit.get(context)
                      .currentWeather?.main?.tempMin
                      - 273.15).round().toString()}\u2103 | Max : ${(WeatherCubit.get(context)
                      .currentWeather?.main?.tempMax
                      - 273.15).round().toString()}\u2103' :
                  '',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,

                      color: Colors.white70
                  ),
                ),
              ],
            ),
            Text(
              'wind ${WeatherCubit.get(context).currentWeather?.wind?.speed} M/S',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white70
              ),
            ),
          ],
        ),
      ],
    );
    //   Container(
    //   height: 300,
    //   width: double.infinity,
    //   decoration: const BoxDecoration(
    //     borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),bottomRight: Radius.circular(25)),
    //     image: DecorationImage(
    //       colorFilter:
    //       ColorFilter.mode(Colors.black38, BlendMode.darken),
    //       image: AssetImage('assets/images/cloud-in-blue-sky.jpg',),
    //       fit: BoxFit.cover,
    //     ),
    //   ),
    //   child: Stack(
    //     children: [
    //       AppBar(
    //         leading: IconButton(
    //           onPressed: (){},
    //           icon: const Icon(
    //             Icons.menu,
    //           ),
    //         ),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.only(top: 100,right: 20,left: 20),
    //         child: TextFormField(
    //           style: const TextStyle(
    //               color: Colors.white
    //           ),
    //           controller: cityController,
    //           cursorColor: Colors.grey[100],
    //           decoration: InputDecoration(
    //             prefixIcon: const Icon(
    //               Icons.search,
    //               color: Colors.white,
    //             ),
    //             labelText: 'Search',
    //             labelStyle: const TextStyle(
    //               color: Colors.white,
    //             ),
    //             focusedBorder: OutlineInputBorder(
    //               borderRadius: BorderRadius.circular(10),
    //               borderSide: const BorderSide(color: Colors.white54),
    //             ),
    //             enabledBorder: OutlineInputBorder(
    //               borderRadius: BorderRadius.circular(10),
    //               borderSide: const BorderSide(color: Colors.white),
    //             ),
    //           ),
    //         ),
    //       ),
    //       Align(
    //         alignment: const Alignment(0.0, 1.0),
    //         child: SizedBox(
    //           height: 10,
    //           child: OverflowBox(
    //             minWidth: 0.0,
    //             maxWidth: MediaQuery.of(context).size.width,
    //             minHeight: 0.0,
    //             maxHeight: (MediaQuery.of(context).size.height / 3.68),
    //             child: Padding(
    //               padding: const EdgeInsets.only(right: 15,left: 15),
    //               child: PhysicalModel(
    //                 color: Colors.white,
    //                 elevation:  5,
    //                 shadowColor: Colors.grey,
    //                 borderRadius: BorderRadius.circular(20),
    //                 child: Container(
    //                   padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
    //                   decoration: BoxDecoration(
    //                     color: Theme.of(context).backgroundColor,
    //                     borderRadius: BorderRadius.all(Radius.circular(20)),
    //                   ),
    //                   child: Column(
    //                     children: [
    //                       Text(
    //                         '${WeatherCubit.get(context).currentWeather?.name}',
    //                         style: TextStyle(
    //                             fontSize: 22,
    //                             fontWeight: FontWeight.bold,
    //                             color: Colors.black45
    //                         ),
    //                       ),
    //                       Text(
    //                         DateFormat()
    //                             .add_MMMMEEEEd()
    //                             .format(DateTime.now()),
    //                         style: const TextStyle(
    //                           fontSize: 15,
    //                           color: Colors.black45,
    //                         ),
    //                       ),
    //                       Padding(
    //                         padding: const EdgeInsets.only(top: 7.0),
    //                         child: Container(
    //                           color: Colors.grey[200],
    //                           width: double.infinity,
    //                           height: 1,
    //                         ),
    //                       ),
    //                       Spacer(),
    //                       Row(
    //                         children: [
    //                           Column(
    //                             children: [
    //                               Text(
    //                                 '${WeatherCubit.get(context).currentWeather?.weather?[0].description}',
    //                                 style: TextStyle(
    //                                     fontSize: 20,
    //                                     color: Colors.black45
    //                                 ),
    //                               ),
    //                               Text(
    //                                   WeatherCubit.get(context).currentWeather?.main?.temp != null?
    //                                 '${(WeatherCubit.get(context).currentWeather?.main?.temp - 273.15).round().toString()}\u2103':
    //                                 '',
    //                                 style: TextStyle(
    //                                     fontSize: 27,
    //                                     fontWeight: FontWeight.w500,
    //                                     color: Colors.black45
    //                                 ),
    //                               ),
    //
    //                               // Text((WeatherCubit.get(context)
    //                               //     .weatherData.length
    //                               //     - 1).round().toString()),
    //
    //                               Text(
    //                                   WeatherCubit.get(context).currentWeather?.main?.tempMin != null ?
    //                                 'Min : ${(WeatherCubit.get(context)
    //                                     .currentWeather?.main?.tempMin
    //                                     - 273.15).round().toString()}\u2103 | Max : ${(WeatherCubit.get(context)
    //                                     .currentWeather?.main?.tempMax
    //                                     - 273.15).round().toString()}\u2103' :
    //                                 '',
    //                                 style: TextStyle(
    //                                     fontSize: 15,
    //                                     fontWeight: FontWeight.w500,
    //
    //                                     color: Colors.black45
    //                                 ),
    //                               ),
    //                             ],
    //                           ),
    //                           Spacer(),
    //                           Column(
    //                             children: [
    //                               WeatherCubit.get(context).currentWeather?.weather?[0].description != 'overcast clouds' ?
    //                               Image(
    //                                 image: AssetImage('assets/images/icon-01.jpg',),
    //                                 width: 110,
    //                                 height: 90,
    //                               ) :
    //                               Image(
    //                                 image: AssetImage('assets/images/rain.png',),
    //                                 width: 100,
    //                                 height: 75,
    //                               ) ,
    //                               SizedBox(height: 5,),
    //                               Text(
    //                                 'wind ${WeatherCubit.get(context).currentWeather?.wind?.speed} M/S',
    //                                 style: TextStyle(
    //                                     fontSize: 14,
    //                                     fontWeight: FontWeight.w500,
    //                                     color: Colors.black45
    //                                 ),
    //                               ),
    //                             ],
    //                           ),
    //                         ],
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
