import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/weather_model.dart';

class DatabaseService {
  static const String storageKey = 'weather_entries';

  static Future<void> initializeDatabase() async {
    await SharedPreferences.getInstance();
  }

  static Future<void> saveWeatherEntry(WeatherModel weather) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> entries = prefs.getStringList(storageKey) ?? [];
    final List<WeatherModel> weatherEntries =
        entries.map((e) => WeatherModel.fromJson(json.decode(e))).toList();

    final existingIndex = weatherEntries.indexWhere(
      (entry) => entry.city.toLowerCase() == weather.city.toLowerCase(),
    );

    if (existingIndex != -1) {
      weatherEntries[existingIndex] = weather;
    } else {
      weatherEntries.add(weather);
    }

    final updatedEntries =
        weatherEntries.map((e) => json.encode(e.toJson())).toList();

    await prefs.setStringList(storageKey, updatedEntries);
  }

  static Future<List<WeatherModel>> getAllWeatherEntries() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> entries = prefs.getStringList(storageKey) ?? [];
    return entries.map((e) => WeatherModel.fromJson(json.decode(e))).toList();
  }

  static Future<void> deleteWeatherEntry(int index) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> entries = prefs.getStringList(storageKey) ?? [];
    final List<WeatherModel> weatherEntries =
        entries.map((e) => WeatherModel.fromJson(json.decode(e))).toList();

    if (index >= 0 && index < weatherEntries.length) {
      weatherEntries.removeAt(index);
      final updatedEntries =
          weatherEntries.map((e) => json.encode(e.toJson())).toList();
      await prefs.setStringList(storageKey, updatedEntries);
    }
  }
}
