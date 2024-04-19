import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:stripe_demo/screens/home_screen.dart';

import 'constants/stripe.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  unawaited(SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));

  await dotenv.load(fileName: "stripe.env");
  // unawaited(getIt.init());

  HttpOverrides.global = MyHttpOverrides();

  Stripe.publishableKey = PUBLISHABLE_KEY;
  await Stripe.instance.applySettings();

  // dotenv.env['STRIPE_SECRET']!;

  runApp(const MainApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF000A1F),
          secondary: Color(0xFF000A1F),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: Colors.white,
      ),
      home: Homescreen(),
    );
  }
}
