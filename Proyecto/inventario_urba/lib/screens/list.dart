import 'package:flutter/material.dart';
import 'package:inventario_urba/widgets/widgets.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';

class ListProduct extends StatefulWidget {
  const ListProduct({Key? key}) : super(key: key);

  @override
  State<ListProduct> createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  Map<String, dynamic> mapPproducts = {
    'Producto 1': {
      'clave': '2146516',
      'nombre': 'Nombre 1',
      'descripcion': 'descripcion producto1',
      'Marca': 'Marca 1',
      'Sucursal': 'Sucursal 1',
      'Etiqueta': 'Etiqueta 1',
      'Modelo': 'Modelo 1',
      'Tipo': 'Tipo 1',
      'Importe': 'Importe 1',
      'FechaUbic': 'Fecha Ubicacion 1'
    },
    'Producto 2': {
      'clave': '2146512',
      'nombre': 'Nombre 2',
      'descripcion': 'descripcion producto2',
      'Marca': 'Marca 2',
      'Sucursal': 'Sucursal 2',
      'Etiqueta': 'Etiqueta 2',
      'Modelo': 'Modelo 2',
      'Tipo': 'Tipo 2',
      'Importe': 'Importe 2',
      'FechaUbic': 'Fecha Ubicacion 2'
    },
    'Producto 3': {
      'clave': '2146513',
      'nombre': 'Nombre 3',
      'descripcion': 'descripcion producto3',
      'Marca': 'Marca 3',
      'Sucursal': 'Sucursal 3',
      'Etiqueta': 'Etiqueta 3',
      'Modelo': 'Modelo 3',
      'Tipo': 'Tipo 3',
      'Importe': 'Importe 3',
      'FechaUbic': 'Fecha Ubicacion 3'
    },
  };

  void edit_product(String index, Map<String, String> data) {
    mapPproducts[index] = data;
  }

  @override
  Widget build(BuildContext context) {
    List<CustomCardProduct> lista = listarProductos(mapPproducts).toList();
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
                icon: const Icon(Icons.sort),
                onPressed: () {
                  Navigator.pushNamed(context, 'menu');
                }),
            TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  padding:
                      EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.21),
                  textStyle: const TextStyle(
                      fontSize: 20, color: Colors.white, decorationColor: Colors.white),
                ),
                onPressed: () {},
                child: const Text('Buscar')),
            IconButton(icon: const Icon(Icons.camera_alt), onPressed: () {}),
            IconButton(icon: const Icon(Icons.add), onPressed: () {}),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: lista.length,
        itemBuilder: (BuildContext context, int index) => lista[index],
        padding: const EdgeInsets.symmetric(vertical: 10),
        //children: [...],
      ),
    );
  }

  List<CustomCardProduct> listarProductos(Map<String, dynamic> productos) {
    List<CustomCardProduct> lista = <CustomCardProduct>[];
    productos.forEach((producto, data) {
      lista.add(CustomCardProduct(
        product: producto,
        datos: data,
      ));
    });
    return lista;
  }
}
