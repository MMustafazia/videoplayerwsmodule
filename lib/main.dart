import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:videoplayerws/provider/getvideoprovider.dart';
import 'package:videoplayerws/screen/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   home: SplashScreenWS(),
    // );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GetStatusProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreenWS(),
      ),
    );
  }
}
