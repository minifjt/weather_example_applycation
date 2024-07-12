import 'package:flutter/material.dart';
import 'package:weather_application/models/weather_forecast_daily.dart';
import 'package:weather_application/utilities/util.dart';

class CityView extends StatelessWidget {
  const CityView({super.key, required this.snapshot});

  final AsyncSnapshot<WeatherForecast> snapshot;

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data?.list;
    var city = snapshot.data?.city.name;
    var country = snapshot.data?.city.country;
    var dateTime =
        DateTime.fromMillisecondsSinceEpoch(forecastList![0].dt * 1000);
    return Column(
      children: [
        Text(
          '$city $country',
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        Text(
          Util.getFormattedDate(dateTime),
          style: const TextStyle(fontSize: 16),
        )
      ],
    );
  }
}
