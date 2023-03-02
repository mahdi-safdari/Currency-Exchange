import 'package:exchange/ui/widgets/theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  //! for device orientation always portrait
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      <DeviceOrientation>[DeviceOrientation.portraitUp]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Currency Exchange',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          actions: const <Widget>[
            ThemeSwitcher(),
          ],
          title: const Text('Exchange'),
        ),
      ),
    );
  }
}
