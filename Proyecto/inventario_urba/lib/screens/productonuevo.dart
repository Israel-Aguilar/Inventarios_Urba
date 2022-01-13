import 'package:flutter/material.dart';
import 'package:inventario_urba/theme/app_theme.dart';

class ProductoScreen extends StatelessWidget {
  const ProductoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        shadowColor: AppTheme.primary_shade(50),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: Icon(
                  Icons.close,
                  color: AppTheme.primary,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Text(
              "Agregar Elemento",
              style: TextStyle(color: AppTheme.primary),
            ),
            ElevatedButton(
              child: Text(
                "Guardar",
                style: TextStyle(color: AppTheme.primary, fontSize: 12),
              ),
              onPressed: () {},
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: AppTheme.primary)))),
            )
          ],
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            TextFormField(
              decoration: InputDecoration(
                icon: const Icon(
                  Icons.lock,
                  color: AppTheme.primary,
                ),
                hintText: '',
                labelText: 'Contraseña',
              ),
              validator: (String? value) {
                return (value == null || value.length == 0) ? 'Campo requerido.' : null;
              },
            )
          ],
        ),
      ),
    );
  }
}
