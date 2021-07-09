import 'package:daily_spending/screens/maps.dart';
import 'package:daily_spending/screens/qr/qr_main.dart';
import 'package:daily_spending/src/loginPage.dart';
import 'package:daily_spending/screens/ocr.dart';
import 'package:daily_spending/src/welcomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import './screens/home_screen.dart';
import './screens/new_transaction.dart';
import './models/transaction.dart';

import 'package:provider/provider.dart';

import 'DBhelp/TransactionService.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => Transactions(),
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Massroufi',
            theme: ThemeData(
              primaryColor: Color(0xfffbb448),
              fontFamily: 'Quicksand',
              textTheme: ThemeData.light().textTheme.copyWith(
                    headline1: const TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    button: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
              appBarTheme: AppBarTheme(
                textTheme: ThemeData.light().textTheme.copyWith(
                      headline1: const TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
              ),
            ),
            routes: {
              "/": (_) => HomeScreen(),
              "/Welcome": (_) => WelcomePage(),
              "/contact": (_) => HomeScreen(),
              "/profile": (_) => HomeScreen(),
              "/Ocr": (_) => CameraPage(),
              "/new_transaction": (_) => NewTransaction(),
              "/deconnexion": (_) => LoginPage(),
              "/maps": (_) => MapView(),
              "/qrscan": (_) => QrMain(),
            },
            initialRoute: "/Welcome",
          );
        });
  }
}
