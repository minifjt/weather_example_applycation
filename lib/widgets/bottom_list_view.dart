import 'package:flutter/material.dart';
import 'package:weather_application/models/weather_forecast_daily.dart';
import 'package:weather_application/widgets/forecast_card_view.dart';

class ButtonListView extends StatelessWidget {
  const ButtonListView({super.key, required this.snapshot});

  final AsyncSnapshot<WeatherForecast> snapshot;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '7-day weather forecast'.toUpperCase(),
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Container(
            height: 128,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(width: 8),
              itemCount: snapshot.data!.list!.length,
              itemBuilder: (context, index) => Container(
                color: Colors.black87,
                // decoration: BoxDecoration(border: Border.all()),
                width: MediaQuery.of(context).size.width / 2.7,
                child: forecastCard(snapshot, index),
              ),
            ))
      ],
    );
  }
}
