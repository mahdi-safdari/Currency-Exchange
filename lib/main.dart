import 'package:exchange/logic/providers/crypto_data_provider.dart';
import 'package:exchange/logic/providers/market_view_provider.dart';
import 'package:exchange/logic/providers/theme_provider.dart';
import 'package:exchange/logic/providers/user_data_provider.dart';
import 'package:exchange/theme/my_theme.dart';
import 'package:exchange/presentation/ui/main_wrapper.dart';
import 'package:exchange/presentation/ui/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
        ChangeNotifierProvider(
          create: (context) => CryptoDataProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MarketViewProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserDataProvider(),
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
          locale: const Locale('en'),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const <Locale>[
            Locale('en'), // # English
            Locale('fa'), // # Persian
          ],
          themeMode: themeProvider.themeMode,
          theme: MyThemes.lightTheme,
          darkTheme: MyThemes.darkTheme,
          home: Directionality(
            textDirection: TextDirection.ltr,
            child: MainWrapper(),
            // # child: SignUpScreen(),
          ),
        );
      },
    );
  }
}
