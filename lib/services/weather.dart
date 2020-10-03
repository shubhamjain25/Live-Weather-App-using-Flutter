import 'package:live_climate_app/services/location.dart';
import 'package:live_climate_app/services/networking.dart';

const apiKey= '38d1912e698a4a8fa35a371e404ef9cf';

class WeatherModel {

  double latitude,longitude;

  Future<dynamic> getWeatherDataFromCityName(String cityName) async {
    ActualData actualData = ActualData(url: 'http://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey');
    var weatherInformation=await actualData.getAPIData();
    return weatherInformation;
  }

  Future<dynamic> getWeatherData() async{
    Location location = Location();
    await location.getCurrentLocation();
    latitude=location.startLatitude;
    longitude=location.startLongitude;
    ActualData actualData=ActualData(url: 'http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');
    var weatherInformation=await actualData.getAPIData();
    return weatherInformation;
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
