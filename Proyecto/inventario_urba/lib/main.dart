import 'package:flutter/material.dart';
import 'package:inventario_urba/router/app_routes.dart';
import 'package:inventario_urba/screens/screens.dart';

void main() {
  runApp(const Urba());
}

class Urba extends StatelessWidget {
  const Urba({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: app_routes.intialRoute,
      routes: app_routes.routes,
      onGenerateRoute: app_routes.onGenerateRoute,
      theme: ThemeData.light().copyWith(
        primaryColor: const Color(0xFF225A4D),
        appBarTheme: const AppBarTheme(
          color:Color(0xFF225A4D),
          elevation: 0,
          
        ),
      ),
    );
  }
}
