import 'package:flutter/material.dart';

//# Create a ThemeProvider class using ChangeNotifier that uses the ChangeNotifier interface
//# to implement the Observer/Observable pattern for the ability to fluctuate and change themes.
class ThemeProvider extends ChangeNotifier {
  //# Create a variable to store the state of the theme (light/dark) using the ThemeMode enum.
  ThemeMode themeMode = ThemeMode.light;

  //# Define a getter to return the theme state as a boolean value, which will be true if the
  //# theme mode is dark and false otherwise.
  bool get isDarkMode => themeMode == ThemeMode.dark;

  //# Define a toggleTheme function that changes the theme state when called and then notifies
  //# listeners of the changes by calling the notifyListeners() function.
  void toggleTheme() {
    themeMode = themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
