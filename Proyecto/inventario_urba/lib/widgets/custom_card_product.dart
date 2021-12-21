import 'package:flutter/material.dart';

class CustomCardProduct extends StatefulWidget {
  final String product;
  final Map<String, String> datos;

  const CustomCardProduct(
      {Key? key, required this.product, required this.datos})
      : super(key: key);

  @override
  State<CustomCardProduct> createState() => _CustomCardProductState();
}

class _CustomCardProductState extends State<CustomCardProduct> {
  bool ocultar = false;
  List<Widget> datosAMostrar = <Widget>[];
  Icon iconoMostrar = const Icon(Icons.keyboard_arrow_down);
  void changeList() {
    if (ocultar) {
      ocultar = false;
      datosAMostrar = <Widget>[];
      iconoMostrar = const Icon(Icons.keyboard_arrow_down);
    } else {
      ocultar = true;
      datosAMostrar = enlistaDatos(widget.datos);
      iconoMostrar = const Icon(Icons.keyboard_arrow_up);
    }
    setState(() {});
  }

  List<Widget> enlistaDatos(Map<String, String> data) {
    List<Widget> retornoDatos = <Widget>[];
    data.forEach((key, value) {
      retornoDatos.add(Text('$key : $value'));
    });
    return retornoDatos;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.ac_unit_rounded),
            title: Text('clave - ${widget.product}'),
            subtitle: const Text('Descripcion'),
            trailing: iconoMostrar,
            onTap: changeList,
          ),
          ...datosAMostrar.toList(),
        ],
      ),
    );
  }
}
