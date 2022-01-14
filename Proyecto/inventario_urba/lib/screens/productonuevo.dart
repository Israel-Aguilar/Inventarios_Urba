import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:inventario_urba/theme/app_theme.dart';

class ProductoScreen extends StatelessWidget {
  const ProductoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _paintAppBarProduct(context),
      body: SingleChildScrollView(child: formProductWidget()),
    );
  }

  AppBar _paintAppBarProduct(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      shadowColor: AppTheme.primary_shade(50),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(
                Icons.close,
                color: AppTheme.primary,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          const Text(
            "Agregar Elemento",
            style: TextStyle(color: AppTheme.primary),
          ),
          ElevatedButton(
            child: const Text(
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
    );
  }
}

class formProductWidget extends StatelessWidget {
  const formProductWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Container(
        width: double.infinity,
        child: Form(
          child: Column(
            children: [
              SizedBox(height: 10,),
              TextFormField(
                decoration: const InputDecoration(
                  icon:  Icon(
                    Icons.text_fields,
                    color: AppTheme.primary,
                  ),
                  hintText: '',
                  labelText: 'Nombre',
                ),
                validator: (String? value) {
                  return (value == null || value.length == 0) ? 'Campo requerido.' : null;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  icon:  Icon(
                    Icons.pin_outlined,
                    color: AppTheme.primary,
                  ),
                  hintText: '',
                  labelText: 'Número',
    
                ),
                validator: (String? value) {
                  return (value == null || value.length == 0) ? 'Campo requerido.' : null;
                },
              ),
              TextFormField(
                initialValue:_today(),                
                readOnly: true,
                decoration:  const InputDecoration(
                  icon:   Icon(
                    Icons.event,
                    color: AppTheme.primary,
                  ),
                  hintText: '',
    
                ),
                validator: (String? value) {
                  return (value == null || value.length == 0) ? 'Campo requerido.' : null;
                },
              ),
              TextFormField(
                initialValue:_getLocation(),                
                readOnly: true,
                enableInteractiveSelection: false,
                decoration: InputDecoration(
                  icon:  Icon(
                    Icons.pin_drop,
                    color: AppTheme.primary,
                    size: 30,
                  ),
                  hintText: '',
                  labelText: 'Obtener geolocalización',
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.replay_outlined,
                    ),
                    onPressed: () {}),
                ),
                validator: (String? value) {
                  return (value == null || value.length == 0) ? 'Campo requerido.' : null;
                },
              ),
              TextFormField(
                initialValue:_getLocation(),                
                readOnly: true,
                enableInteractiveSelection: false,
                decoration: InputDecoration(
                  icon:  Icon(
                    Icons.file_present,
                    color: AppTheme.primary,
                    size: 30,
                  ),
                  
                  hintText: '',
                  labelText: 'Subir Archivo',
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.upload_rounded,
                    ),
                    onPressed: () {}),
                ),
                validator: (String? value) {
                  return (value == null || value.length == 0) ? 'Campo requerido.' : null;
                },
              ),
              TextFormField(
                initialValue:_getLocation(),                
                readOnly: true,
                enableInteractiveSelection: false,
                decoration: InputDecoration(
                  icon:  Icon(
                    Icons.camera_alt_outlined,
                    color: AppTheme.primary,
                    size: 30,
                  ),
                  
                  hintText: '',
                  labelText: 'Subir imagen',
                  suffixIcon: Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.camera,
                        ),
                        onPressed: () {}),
                      IconButton(
                        icon: Icon(
                          Icons.photo,
                        ),
                        onPressed: () {}),
                    
                    ],
                    
                  ),
                ),
                validator: (String? value) {
                  return (value == null || value.length == 0) ? 'Campo requerido.' : null;
                },
              ),
              SizedBox(height: 60,),
            ],
          ),
        ),
      ),
    );
  }

  String _today() {
    var datetime=DateTime.now();
    return datetime.toIso8601String().toString();
  }
  _getLocation(){

    _determinePosition().then((value) =>  print(value.latitude.toString()+","+value.longitude.toString()));
  }
  
  Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the 
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale 
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }
  
  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately. 
    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.');
  } 

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}
}
