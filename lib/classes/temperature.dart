class Temperature {
  final double temp;
  final String name;
  final int timezone;
  Temperature({
    required this.temp,
    required this.name,
    required this.timezone,
  });

  factory Temperature.fromJson(Map<String, dynamic> json) {
    return Temperature(
      temp: json['main']['temp'],
      name: json['name'],
      timezone: json['timezone'],
    );
  }
}

