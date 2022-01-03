import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:inventario_urba/theme/app_theme.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: _Menu(),
      ),
    );
  }
}

class _Menu extends StatelessWidget {
  const _Menu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            color: AppTheme.primary,
            width: MediaQuery.of(context).size.width * 0.15,
            height: double.infinity,
          ),
          Container(
            margin:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.15),
            width: MediaQuery.of(context).size.width * 0.85,
            height: double.infinity,
            child: SafeArea(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Image(image: AssetImage("assets/login.png")),
                const Divider(),
                _paddignText("Usuario Restringido", 18, FontWeight.bold, 25),
                _paddignText(
                    "inventarioapp@gmail.com", 18, FontWeight.normal, 10),
                _paddignText("Entidades", 20, FontWeight.bold, 20),
              ],
            )),
          ),
        ],
      ),
    );
  }

  Padding _paddignText(
      String texto, double size, FontWeight weight, double topSpace) {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, top: topSpace),
      child: Text(texto,
          textAlign: TextAlign.left,
          textWidthBasis: TextWidthBasis.parent,
          style: TextStyle(
            color: AppTheme.primary_shade(40),
            fontWeight: weight,
            fontSize: size,
          )),
    );
  }
}
