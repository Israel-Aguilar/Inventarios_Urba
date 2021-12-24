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
      retornoDatos.add(
        Row(
          children: [
            Text('$key :',textAlign: TextAlign.left,),Text(value,textAlign: TextAlign.left)
          ],
        )
       
        );
    });
    return retornoDatos;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: const FadeInImage(placeholder: AssetImage('assets/lodingtrsansparent.gif'), image: NetworkImage('https://definicion.de/wp-content/uploads/2009/06/producto.png')),
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
