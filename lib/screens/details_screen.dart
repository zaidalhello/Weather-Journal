import 'package:flutter/material.dart';
import 'package:fluttertask/widgets/build-detail-row.dart';
import '../models/weather_model.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final weatherEntry =
        ModalRoute.of(context)!.settings.arguments as WeatherModel;

    return Scaffold(
      backgroundColor: Colors.blue[600],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue[600],
        title: const Text(
          'Weather Details',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    weatherEntry.city,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Icon(
                  Icons.cloud_queue,
                  size: 80,
                  color: Colors.white,
                ),
                const SizedBox(height: 20),
                Text(
                  '${weatherEntry.temperature}°C',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(
                  weatherEntry.condition,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                buildDetailRow(
                  icon: Icons.water_drop,
                  title: 'Humidity',
                  value: '${weatherEntry.humidity}%',
                ),
                const SizedBox(height: 16),
                buildDetailRow(
                  icon: Icons.air,
                  title: 'Wind Speed',
                  value: '${weatherEntry.windSpeed} km/h',
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
