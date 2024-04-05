import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wether_app/models/wethear_five_day_model.dart';
import 'package:wether_app/shared/cubit/states.dart';
import 'package:wether_app/shared/network/remote/dio_helper.dart';
import 'package:geolocator/geolocator.dart';
import '../../models/current_weather_model.dart';

class WeatherCubit extends Cubit <WeatherStats> {
  WeatherCubit() : super (WeatherInitialStats());

  static WeatherCubit get(context) => BlocProvider.of(context);


//TODO function to get lan log by geoLocator

  // double ? lat ;
  // double ? long ;
  //
  // void getCurrentLocation() async {
  //   bool serviceEnabled;
  //   LocationPermission locationPermission;
  //
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (serviceEnabled == false) {
  //     return ;
  //   }
  //
  //   locationPermission = await Geolocator.checkPermission();
  //   if (locationPermission == LocationPermission.denied) {
  //     locationPermission = await Geolocator.requestPermission();
  //   }
  //
  //   if(locationPermission == LocationPermission.whileInUse){
  //     Position position = await Geolocator.getCurrentPosition();
  //     lat = position.latitude;
  //    long = position.longitude;
  //
  //     print('======================');
  //     print(lat);
  //     print(long);
  //     print('=======================');
  //   }
  // }


  //TODO function to get weather by lan log
  //TODO function to get Location
  Future<Position?> getLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return null; // Return null if location services are disabled
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return null; // Return null if location permission is denied
      }
    }

    if (permission == LocationPermission.whileInUse || permission == LocationPermission.always) {
      Position position = await Geolocator.getCurrentPosition();
      return position;
    }

    return null;
  }


  //TODO function to get current weather by lat & lon
  CurrentWeather ? currentWeather;
  Future<CurrentWeather?> getWeather(double lat, double long) async {
    emit(CurrentWeatherLoading());

    DioHelper.getData(
        url: 'data/2.5/weather',
        query: {
          'appid': 'd874251c9881c99e5da185fc7e1f5232',
          'lat': lat.toString(),
          'lon': long.toString()
        }
    ).then((value) {
      emit(CurrentWeatherSuccess());
      currentWeather = CurrentWeather.fromJson(value.data);
      return currentWeather;
      // print('///////////////////////////');
      // print(currentWeather?.coord?.lat);
    }).catchError((error) {
      emit(CurrentWeatherError());
      print(error);
      return null;
    });
  }


  //TODO function to get Five Day Forcast by current lat & lon
  WeatherFiveDay ? weatherFiveDay;
  Future<WeatherFiveDay?> getFiveDayWeather(double lat, double long) async {
    emit(CurrentWeatherLoading());

    DioHelper.getData(
        url: 'data/2.5/forecast',
        query: {
          'appid': 'd874251c9881c99e5da185fc7e1f5232',
          'lat': lat.toString(),
          'lon': long.toString()
        }
    ).then((value) {
      emit(CurrentWeatherSuccess());
      weatherFiveDay = WeatherFiveDay.fromJson(value.data);
      print(weatherFiveDay?.list?[0].main?.temp);
      return weatherFiveDay;
      // print('///////////////////////////');
      // print(currentWeather?.coord?.lat);
    }).catchError((error) {
      emit(CurrentWeatherError());
      print(error);
      return null;
    });
  }


  //TODO function to get Five Day Forcast & current weather by current lat & lon
  void fetchWeatherData() async {
    Position? position = await getLocation();
    if (position != null) {
      CurrentWeather? weather = await getWeather(position.latitude, position.longitude);
      WeatherFiveDay? weatherFive = await getFiveDayWeather(position.latitude, position.longitude);
      if (weather != null && weatherFive != null) {
        // Process the weather data as needed
      } else {
        // print('Failed to fetch weather data');
      }
    } else {
      // print('Failed to get location');
    }
  }


  //TODO List of Cities
  List<String> cities = [
    'Cairo',
    'Alexandria',
    'Luxor',
    'Aswan',
    'Kafr El-Sheikh',
    'Giza',
    'Port Said',
    'Suez',
    'Asyut',
    'Fayoum',
    'Ismailia',
    'Beheira',
    'Minya',
    'Damietta',
    'Qena',
    'Beni Suef',
    'Sohag',
  ];


  //TODO function to get weather by city name
  List<CurrentWeather> weatherData = [];
  void getWeatherOtherCity({String ? city}) {
    for (String city in cities) {
      emit(CurrentWeatherLoading());
      DioHelper.getData(
          url: 'data/2.5/weather',
          query: {
            'appid': 'd874251c9881c99e5da185fc7e1f5232',
            'q': city
          }
      ).then((value) {
        emit(CurrentWeatherSuccess());
        weatherData.add(CurrentWeather.fromJson(value.data));
      }).catchError((error) {
        emit(CurrentWeatherError());
        print(error);
      });
    }
  }

}