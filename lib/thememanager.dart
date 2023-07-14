import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeManager with ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  ThemeManager() {
    _loadThemePreference();
  }

  void _loadThemePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool('isDarkMode') ?? false;
    notifyListeners();
  }

  void toggleTheme() async {
    _isDarkMode = !_isDarkMode;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', _isDarkMode);
    notifyListeners();
  }

  ThemeData getCurrentTheme() {
    return _isDarkMode ? _buildDarkTheme() : _buildLightTheme();
  }

  ThemeData _buildLightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      accentColor: Colors.blueAccent,
      // Add more customizations as needed
    );
  }

  ThemeData _buildDarkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.indigo,
      accentColor: Colors.indigoAccent,
      // Add more customizations as needed
    );
  }

  Color getPrimaryColor() {
    return _isDarkMode ? Colors.indigo : Colors.blue;
  }

  Color getTextPrimaryColor() {
    return _isDarkMode ? Colors.black : Colors.white;
  }

  Color getIconsPrimaryColor() {
    return _isDarkMode ? Colors.white : Colors.black;
  }

  Color getBackgroundPrimaryColor() {
    return _isDarkMode ? Color.fromARGB(255, 24, 28, 38) : Colors.white;
  }

  Color getBoxshadwoPrimaryColor() {
    return _isDarkMode ? Color.fromARGB(125, 0, 0, 0) : Color.fromARGB(122, 158, 158, 158);
  }
  Color getIconPrimaryColor() {
    return _isDarkMode ? Colors.black : Colors.grey;
  }
  Color getTogglePrimaryColor() {
    return _isDarkMode ? Color.fromARGB(119, 0, 0, 0) : Colors.white;
  }
}
