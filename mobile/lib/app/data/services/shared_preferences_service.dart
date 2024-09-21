/*import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  SharedPreferencesService._privateConstructor();

  static final SharedPreferencesService _instance = SharedPreferencesService._internal();
  factory SharedPreferencesService() => _instance;

  SharedPreferences? _prefs;
  late bool hasSeenWelcome;
  late bool isLoggedIn;
  late String role;
  late String userToken;

  SharedPreferencesService._internal();

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    hasSeenWelcome = _prefs?.getBool('hasSeenWelcome') ?? false;
    isLoggedIn = _prefs?.getBool('isLoggedIn') ?? false;
    role = _prefs?.getString('role') ?? '';
    userToken = _prefs?.getString('userToken') ?? '';
  }
}*/

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static final SharedPreferencesService _instance = SharedPreferencesService._internal();
  factory SharedPreferencesService() => _instance;

  late final SharedPreferences _prefs;

  bool? get hasSeenWelcome => _prefs.getBool('hasSeenWelcome');
  bool? get isLoggedIn => _prefs.getBool('isLoggedIn');
  String? get role => _prefs.getString('role');

  SharedPreferencesService._internal();

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }
}
