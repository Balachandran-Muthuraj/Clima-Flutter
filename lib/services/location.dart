import 'package:geolocator/geolocator.dart';
class location{
double longitude,latitude;

 Future<void>  Getlocation()
   async {
    try {

      Position position = await Geolocator().getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      longitude = position.longitude;
      latitude = position.latitude;
    }

    catch (exception) {
      throw exception;
    }

  }
  double getlatitude()
  {
    return latitude;
  }
double getlongitude()
{
  return longitude;
}



}