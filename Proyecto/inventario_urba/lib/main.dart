import 'package:flutter/material.dart';
import 'package:inventario_urba/router/app_routes.dart';
import 'package:inventario_urba/theme/app_theme.dart';

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
      theme: AppTheme.lightTheme,
    );
  }
}
