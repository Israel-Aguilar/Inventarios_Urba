import 'package:flutter/material.dart';
import 'package:inventario_urba/screens/screens.dart';

void main() {
  runApp(const Urba());
}

class Urba extends StatelessWidget {
  const Urba({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, initialRoute: 'home',
        //home: const ListProduct(),
        routes: {
          'home': (BuildContext context) => const ListProduct(),
          'usuario': (BuildContext context) => const UserScreen(),
          'menu': (BuildContext context) => const MenuScreen(),
          'login': (BuildContext context) => const LoginScreen(),
          'producto': (BuildContext context) => const ProductoScreen(),
          'inventario': (BuildContext context) => const ListProduct(),
        });
  }
}
