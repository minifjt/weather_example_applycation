import 'package:flutter/material.dart';
import 'package:weather_application/models/weather_forecast_daily.dart';

class TempView extends StatelessWidget {
  const TempView({super.key, required this.snapshot});

  final AsyncSnapshot<WeatherForecast> snapshot;

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data?.list;
    var icon = forecastList![0].getIconUrl();
    var temp = forecastList[0].temp.day.toStringAsFixed(0);
    var description = forecastList[0].weather[0].description.toUpperCase();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          icon,
          scale: 0.4,
          color: Colors.black87,
        ),
        const SizedBox(width: 16),
        Column(
          children: [
            Text(
              '$temp *C',
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
            ),
            Text(
              description,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        )
      ],
    );
  }
}
