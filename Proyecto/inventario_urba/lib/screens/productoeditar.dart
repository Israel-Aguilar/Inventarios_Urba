import 'package:flutter/material.dart';
import 'package:inventario_urba/theme/app_theme.dart';

class ProductoEditarScreen extends StatelessWidget {
  const ProductoEditarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.close,
                  color: AppTheme.primary_shade(50),
                )),
            Text("Agregar Elemento"),
          ],
        ),
      ),
      body: Center(
        child: Text('ProductoScreen'),
      ),
    );
  }
}
