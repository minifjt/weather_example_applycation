import 'package:flutter/material.dart';
import 'package:weather_application/models/weather_forecast_daily.dart';
import 'package:weather_application/utilities/util.dart';

Widget forecastCard(AsyncSnapshot<WeatherForecast> snapshot, int index) {
  var forecastList = snapshot.data?.list;
  var dayOfWeek = '';
  var dateTime =
      DateTime.fromMillisecondsSinceEpoch(forecastList![index].dt * 1000);
  var fullDate = Util.getFormattedDate(dateTime);
  dayOfWeek = fullDate.split(',')[0];

  var icon = forecastList[index].getIconUrl();
  var temp = forecastList[index].temp.day.toStringAsFixed(0);
  return Column(
    children: [
      Center(
        child: Text(
          dayOfWeek,
          style: const TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$temp *C',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          const SizedBox(width: 8),
          Image.network(icon, color: Colors.white),
        ],
      )
    ],
  );
}
