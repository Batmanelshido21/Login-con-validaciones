import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_de_login/screens/screens.dart';
import 'package:proyecto_de_login/services/services.dart';

void main() {
  runApp(AppState());
}

// ignore: use_key_in_widget_constructors
class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ProductServices())],
      child: MyApp(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login app',
      initialRoute: 'homeScreen',
      routes: {
        'loginScreen': (_) => LoginScreen(),
        'homeScreen': (_) => HomeScreen(),
        'registerScreen': (_) => RegisterScreen(),
        'productScreen': (_) => ProductScreen()
      },
    );
  }
}
