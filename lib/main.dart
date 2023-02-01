import 'package:flutter/material.dart';
import 'package:foft/api/AuthService.dart';
import 'package:foft/api/AuthServiceEnseignant.dart';
import 'package:foft/api/FicheEnseignantService.dart';
import 'package:foft/api/FicheService.dart';
import 'package:foft/api/date.dart';
//import 'package:foft/screens/enseignant/HomeScreen.dart';
import 'package:foft/screens/HomeScreen.dart';
//import 'package:foft/screens/enseignant/login.dart';
import 'package:foft/screens/login.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AuthService()),
      ChangeNotifierProvider(create: (context) => Data()),
      ChangeNotifierProvider(create: (context) => FicheService()),
      ChangeNotifierProvider(create: (context) => FicheEnseignantService()),
      ChangeNotifierProvider(create: (context) => AuthEnseignantService()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final authService = context.watch<AuthService>();
    //final authService = context.watch<AuthEnseignantService>();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: !authService.authenticate ? Login() : HomeScreen(),
    );
  }
}
