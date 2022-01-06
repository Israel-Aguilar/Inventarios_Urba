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
                _paddignText("Usuario Restringido", 18, FontWeight.bold, 25,
                    AppTheme.primary_shade(40)),
                _paddignText(
                    "inventarioapp@gmail.com", 17, FontWeight.normal, 10),
                _paddignText("Entidades", 20, FontWeight.bold, 20,
                    AppTheme.primary_shade(40)),
                _paintPermisions(['sucursales', 'inventario']),
                const Divider(),
                _paddignText("Cambiar Contraseña", 20, FontWeight.bold, 20,
                    AppTheme.primary_shade(40)),
              ],
            )),
          ),
        ],
      ),
    );
  }

  Widget _paintPermisions(List<String> permisions) {
    List<Widget> permisosWidgets = [];
    permisions.forEach((permiso) {
      switch (permiso) {
        case 'sucursales':
          permisosWidgets.add(_addSucursalPermision());
          break;
        case 'inventario':
          permisosWidgets.add(_addInventariosPermision());
          break;
      }
    });

    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [...permisosWidgets.toList()],
      ),
    );
  }

  Widget _addInventariosPermision() {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        children: [
          Icon(
            Icons.crop_free,
            color: AppTheme.primary_shade(50),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 25),
            child: Text(
              'Invetarios',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: AppTheme.primary_shade(50),
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding _addSucursalPermision() {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        children: [
          Icon(
            Icons.home,
            color: AppTheme.primary_shade(50),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 25),
            child: Text(
              'Sucursales',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: AppTheme.primary_shade(50),
                fontSize: 18,
              ),
            ),
          ),
          Icon(
            Icons.arrow_drop_down,
            color: AppTheme.primary_shade(50),
          )
        ],
      ),
    );
  }

  Padding _paddignText(
      String texto, double size, FontWeight weight, double topSpace,
      [Color colorText = Colors.black87]) {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, top: topSpace),
      child: Text(texto,
          textAlign: TextAlign.left,
          textWidthBasis: TextWidthBasis.parent,
          style: TextStyle(
            color: colorText,
            fontWeight: weight,
            fontSize: size,
          )),
    );
  }
}
