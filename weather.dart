import 'dart:convert';

import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class Weather extends StatefulWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  _weatherState createState() => _weatherState();
}

class _weatherState extends State<Weather> {
  String city = "Tucker";
  double temp = 0;
  var humidity;
  var weathertype;
  var windspeed;
  double feelslike = 0;
  var sunrise;
  var sunset;

  Future Weathergetter() async {
    http.Response weather = await http.get(
        "http://api.openweathermap.org/data/2.5/weather?q=Tucker&appid=5f0d8ca9bff9d8827e06d772c2ce7c7e");
    var results = jsonDecode(weather.body);
    setState(() {
      this.temp = results['main']['temp'];
      this.temp = ((temp - 273.15) * 9 / 5 + 32);
      this.weathertype = results['weather'][0]['description'];
      this.humidity = results['main']['humidity'];
      this.windspeed = results['wind']['speed'];
      this.feelslike = results['main']['feels_like'];
      this.feelslike = ((feelslike - 273.15) * 9 / 5 + 32);
      this.sunrise = results['sys']['sunrise'];
      this.sunset = results['sys']['sunset'];
    });
  }

  @override
  void initState() {
    super.initState();
    this.Weathergetter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 3.5,
            width: MediaQuery.of(context).size.width,
            color: Colors.blue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(top: 50, bottom: 15),
                    child: Text(
                      "Current Weather in " + city,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    )),
                Text(
                  // ignore: unnecessary_null_comparison
                  temp == null
                      ? 'Loading'
                      : temp.toStringAsFixed(0) + " \u00B0" + "F",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 50,
                      fontWeight: FontWeight.w500),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: (Text(
                      weathertype == null ? 'loading' : weathertype.toString(),
                      style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    )))
              ],
            ),
          ),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.all(5),
                  child: ListView(children: [
                    ListTile(
                        leading:
                            FaIcon(FontAwesomeIcons.thermometerThreeQuarters),
                        title: Text("Temperature"),
                        trailing: Text(temp == null
                            ? 'Loading'
                            : temp.toStringAsFixed(1) + " \u00B0" + "F")),
                    ListTile(
                        leading: FaIcon(FontAwesomeIcons.water),
                        title: Text("Humidity"),
                        trailing: Text(humidity == null
                            ? 'Loading'
                            : humidity.toString())),
                    ListTile(
                        leading: FaIcon(FontAwesomeIcons.wind),
                        title: Text("WindSpeed"),
                        trailing: Text(windspeed == null
                            ? 'Loading'
                            : windspeed.toString() + " MPH")),
                    ListTile(
                        leading: FaIcon(FontAwesomeIcons.feather),
                        title: Text("Feels Like"),
                        trailing: Text(feelslike == null
                            ? 'Loading'
                            : feelslike.toStringAsFixed(1) + " \u00B0" + "F")),
                    ListTile(
                        leading: FaIcon(FontAwesomeIcons.sun),
                        title: Text("Sunrise"),
                        trailing: Text(
                            sunrise == null ? 'Loading' : sunrise.toString())),
                    ListTile(
                        leading: FaIcon(FontAwesomeIcons.moon),
                        title: Text("Sunset"),
                        trailing: Text(
                            sunset == null ? 'Loading' : sunset.toString())),
                    TextButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.home),
                        label: Text('Go back'))
                  ])))
        ],
      ),
    );
  }
}
