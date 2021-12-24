import 'package:flutter/material.dart';
import 'package:inventario_urba/screens/screens.dart';

class app_routes {
  static const intialRoute = 'login';
  static Map<String, Widget Function(BuildContext)> routes = {
    'usuario': (BuildContext context) => const UserScreen(),
    'menu': (BuildContext context) => const MenuScreen(),
    'login': (BuildContext context) => const LoginScreen(),
    'producto': (BuildContext context) => const ProductoScreen(),
    'inventario': (BuildContext context) => const ListProduct(),
  };
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const ListProduct(),
    );
  }
}
