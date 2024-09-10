import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/components/exdrawer.dart';
import 'package:weather_app/components/items/additional_info_item.dart';
import 'package:weather_app/components/items/hourly_forecast_item.dart';
import 'package:weather_app/services/get_current_weather.dart';

class WeatherScreen extends StatefulWidget {
  final String selectedCity;
  const WeatherScreen({super.key, required this.selectedCity});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late Future<List<Map<String, dynamic>>> weather;

  String cityName = '';

  @override
  void initState() {
    super.initState();
    weather = getCurrentWeather(widget.selectedCity);
    cityName = widget.selectedCity;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            const SizedBox(
              height: 7,
            ),
            const Text(
              'Weather',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              cityName,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
            )
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  weather = getCurrentWeather(cityName);
                });
              },
              icon: const Icon(Icons.refresh)),
        ],
      ),
      drawer: const EXDrawer(),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: weather,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SizedBox(
                height: MediaQuery.of(context).size.height - 95,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(
                            height: 20,
                          ),
                          Text('Loading Please Wait')
                        ],
                      ),
                    )
                  ],
                ),
              );
            }

            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }

            final data1 = snapshot.data![0];
            final data2 = snapshot.data![1];

            final currentWeatherData = data1;
            final currentTemp =
                (currentWeatherData['main']['temp'] - 273.15).round();
            final currentStatus = currentWeatherData['weather'][0]['main'];
            final currentStatusDescription =
                currentWeatherData['weather'][0]['description'];
            final currentHumidity = currentWeatherData['main']['humidity'];
            final currentWindSpeed = currentWeatherData['wind']['speed'];
            final currentPressure = currentWeatherData['main']['pressure'];

            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              children: [
                                Text('${currentTemp.toString()}°C',
                                    style: const TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(height: 16),
                                Icon(
                                  currentStatus == 'Clouds'
                                      ? Icons.cloud
                                      : currentStatus == 'Rain'
                                          ? Icons.water_drop_outlined
                                          : Icons.sunny,
                                  size: 64,
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  '$currentStatus',
                                  style: const TextStyle(fontSize: 20),
                                ),
                                const SizedBox(height: 10),
                                Text('$currentStatusDescription'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 15),
                    child: Text(
                      'Hourly Forecast',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 155,
                    child: ListView.builder(
                      itemCount: 8,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final hourlyForecast = data2['list'][index + 2];
                        final hourlyTime =
                            DateTime.parse(hourlyForecast['dt_txt']);
                        final hourlyTemp =
                            (hourlyForecast['main']['temp'] - 273.15).round();
                        final hourlyStatus =
                            hourlyForecast['weather'][0]['main'];

                        return HourlyForecastItem(
                          time: DateFormat.j().format(hourlyTime),
                          icon: hourlyStatus == 'Clouds'
                              ? Icons.cloud
                              : hourlyStatus == 'Rain'
                                  ? Icons.water_drop_outlined
                                  : Icons.sunny,
                          status: hourlyStatus,
                          temperature: '${hourlyTemp.toString()}°C',
                        );
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 15),
                    child: Text(
                      'Additional Information',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AdditionalInfoItem(
                        icon: Icons.water_drop,
                        label: 'Humidity',
                        value: currentHumidity.toString(),
                      ),
                      AdditionalInfoItem(
                        icon: Icons.air,
                        label: 'Wind Speed',
                        value: currentWindSpeed.toString(),
                      ),
                      AdditionalInfoItem(
                        icon: Icons.beach_access,
                        label: 'Pressure',
                        value: currentPressure.toString(),
                      )
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
