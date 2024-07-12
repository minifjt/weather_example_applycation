// import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_application/api/weather_api.dart';
import 'package:weather_application/models/weather_forecast_daily.dart';
import 'package:weather_application/screens/city_screen.dart';
import 'package:weather_application/widgets/widgets.dart';

class WeatherForecastScreen extends StatefulWidget {
  const WeatherForecastScreen({super.key});

  @override
  State<WeatherForecastScreen> createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  late Future<WeatherForecast> forecastObject;
  late String cityName = 'Novosibirsk';

  @override
  void initState() {
    super.initState();
    forecastObject = WeatherApi().fetchWeatherForecast(cityName, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: const Icon(Icons.my_location),
        // ),
        actions: [
          IconButton(
            onPressed: () async {
              Route route =
                  MaterialPageRoute(builder: (context) => const CityScreen());
              // Navigator.push(context, route);
              final newCity = await Navigator.push(context, route);
              if (newCity != null) {
                setState(() {
                  cityName = newCity;
                  forecastObject =
                      WeatherApi().fetchWeatherForecast(cityName, true);
                });
              }
            },
            icon: const Icon(Icons.location_city),
          )
        ],
        backgroundColor: Colors.black87,
        // centerTitle: true,
        title: const Text(
          'Weather Application',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          Center(
            child: FutureBuilder<WeatherForecast>(
                future: forecastObject,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        const SizedBox(height: 40),
                        CityView(snapshot: snapshot),
                        const SizedBox(height: 40),
                        TempView(snapshot: snapshot),
                        const SizedBox(height: 40),
                        DetailView(snapshot: snapshot),
                        const SizedBox(height: 40),
                        ButtonListView(snapshot: snapshot),
                      ],
                    );
                  } else {
                    return const Padding(
                      padding: EdgeInsets.only(top: 16.0),
                      child: SpinKitDoubleBounce(
                        color: Colors.black87,
                        size: 64,
                      ),
                    );
                  }
                }),
          )
        ],
      ),
    );
  }
}
