// import 'package:shared_preferences/shared_preferences.dart';
//
// class SharedPreferenceUtils {
//   savePreferences(String key, var value) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     if (value.runtimeType == bool)
//       prefs.setBool(key, value);
//     else if (value.runtimeType == String)
//       prefs.setString(key, value);
//     else if (value.runtimeType == double)
//       prefs.setDouble(key, value);
//     else if (value.runtimeType == int) prefs.setInt(key, value);
//   }
//
//   Future<String?> getStringPreference(String key) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getString(key);
//   }
//
//   Future<int?> getIntegerPreference(String key) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getInt(key);
//   }
//
//   Future<bool?> getBooleanPreference(String key) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getBool(key);
//   }
//
//   Future<double?> getDoublePreference(String key) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getDouble(key);
//   }
//
//   void clearSecurePreference() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.clear();
//   }
// }
