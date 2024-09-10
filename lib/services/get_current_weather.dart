import 'dart:convert';

import 'package:http/http.dart' as http;
import '../essentials/secrets.dart';

Future<List<Map<String, dynamic>>> getCurrentWeather(String city) async {
  try {
    String cityName = city;
    final currentWeather = await http.get(
      Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?q=$cityName&APPID=$openWeatherApiKey',
      ),
    );
    final forecastWeather = await http.get(
      Uri.parse(
        'http://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$openWeatherApiKey',
      ),
    );

    final dataCurrent = jsonDecode(currentWeather.body);
    final dataForecast = jsonDecode(forecastWeather.body);

    if (dataCurrent['cod'] != 200) {
      throw 'An unexpected error occurred 1. \nError Code: ${dataCurrent['cod']}\n${dataCurrent['message']}';
    }
    if (dataForecast['cod'] != '200') {
      throw 'An unexpected error occurred 2. \nError Code: ${dataForecast['cod']}\n${dataForecast['message']}';
    }

    List<Map<String, dynamic>> data = [dataCurrent, dataForecast];
    return data;
  } catch (e) {
    throw e.toString();
  }
}
