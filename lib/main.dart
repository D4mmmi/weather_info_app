import 'package:flutter/material.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeatherHomePage(),
    );
  }
}

class WeatherHomePage extends StatefulWidget {
  @override
  _WeatherHomePageState createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  final TextEditingController _cityController = TextEditingController();
  String cityName = 'Atlanata';
  String temperature = '18';
  String weatherCondition = 'Rainy';

  void _fetchWeather() {
    setState(() {
      cityName = _cityController.text;
      // Simulate weather data
      temperature = (15 + (30 - 15) * (new DateTime.now().second % 10) / 10)
              .toStringAsFixed(1) +
          '°C';
      weatherCondition =
          ['Sunny', 'Cloudy', 'Rainy'][new DateTime.now().second % 3];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _cityController,
              decoration: InputDecoration(
                labelText: 'Enter city name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _fetchWeather,
              child: Text('Fetch Weather'),
            ),
            SizedBox(height: 20),
            // Display the city name
            Text(
              'City: $cityName',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            // Display the temperature
            Text(
              'Temperature: $temperature',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            // Display the weather condition
            Text(
              'Condition: $weatherCondition',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
