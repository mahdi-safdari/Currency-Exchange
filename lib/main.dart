import 'package:exchange/providers/theme_provider.dart';
import 'package:exchange/theme/my_theme.dart';
import 'package:exchange/ui/widgets/theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() {
  //! for device orientation always portrait
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    <DeviceOrientation>[
      DeviceOrientation.portraitUp,
    ],
  );

  runApp(
    MultiProvider(
      providers: <SingleChildWidget>[
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder:
          (BuildContext context, ThemeProvider themeProvider, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Currency Exchange',
          themeMode: themeProvider.themeMode,
          theme: MyThemes.lightTheme,
          darkTheme: MyThemes.darkTheme,
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
      },
    );
  }
}
