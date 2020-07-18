import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
class WeatherModel {
  static const  apikey='**************************************';
  String url;
  double latitude,longitude;
  Future<dynamic> GetlocationWeather()async
  {
    location loc = new location();
    await loc.Getlocation();
    longitude=loc.longitude;
    latitude=loc.latitude;
    print('latitude' + loc.getlatitude().toString());
    print('Longitude' + loc.getlongitude().toString());
     //url='https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apikey';
    url =
    'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apikey&units=metric';
    print(url);
    Networkhelper networkhelper = new Networkhelper(url);
    var data = await networkhelper.GetData();
    return data;
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
