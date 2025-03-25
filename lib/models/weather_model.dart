class WeatherModel {
  final String city;
  final double temperature;
  final String condition;
  final int humidity;
  final double windSpeed;

  WeatherModel({
    required this.city,
    required this.temperature,
    required this.condition,
    required this.humidity,
    required this.windSpeed,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      city: json['name'] ?? json['city'],
      temperature: (json['main']?['temp'] ?? json['temp'])?.toDouble() ?? 0.0,
      condition: (json['weather']?[0]?['main'] ?? json['condition']) ?? '',
      humidity: (json['main']?['humidity'] ?? json['humidity']) ?? 0,
      windSpeed:
          (json['wind']?['speed'] ?? json['windSpeed'])?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() => {
        'city': city,
        'temp': temperature,
        'condition': condition,
        'humidity': humidity,
        'windSpeed': windSpeed,
      };
}
