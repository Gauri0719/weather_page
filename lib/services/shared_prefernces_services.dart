import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefServices{
    static const String latitudeKey='latitude';
    static const String longitudeKey='longitude';

    static Future<void> saveLocation(double lat,double long) async {
      final prefs=await SharedPreferences.getInstance();
      await prefs.setDouble(latitudeKey,lat);
      await prefs.setDouble(longitudeKey,long);
    }
    ///GET SAVED LATITUDE
    static Future<double?> getLatitude() async {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getDouble(latitudeKey);
    }
      ///GET SAVED LONGITUDE
      static Future<double?> getLongitude() async {
        final prefs=await SharedPreferences.getInstance();
        return prefs.getDouble(longitudeKey);
      }
      // LOAD SAVED LOCATION AS A MAP
      static Future<Map<String,double?>> getSavedLocation() async {
      final prefs=await SharedPreferences.getInstance();
      return{
        'latitude':prefs.getDouble(latitudeKey),
        'longitude':prefs.getDouble(longitudeKey),
      };
      }
      // CLEAR SAVED LOCATION
static Future<void> clearLocation() async {
      final prefs=await SharedPreferences.getInstance();
      await prefs.remove(latitudeKey);
      await prefs.remove(longitudeKey);
}
      }
