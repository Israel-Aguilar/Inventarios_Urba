import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginWidget(),
    );
  }
}

class LoginWidget extends StatelessWidget {
  const LoginWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 60),
          children: [
            const Image(image: AssetImage('assets/login.png')),
            const SizedBox(
              height: 70,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const FaIcon(
                  FontAwesomeIcons.userFriends,
                  color: Color(0xFF225A4D),
                  size: 60,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 10, left: 15, right: 25),
                    child: Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 18.0),
                              child: Text(
                                'Iniciar Sesión',
                                style: TextStyle(
                                  color: Color(0xFF225A4D),
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                icon: Icon(
                                  Icons.alternate_email,
                                  color: Color(0xFF225A4D),
                                ),
                                hintText: 'ejemplo@gmail.com',
                                labelText: 'Correo electrónico',
                              ),
                              validator: (String? value) {
                                return (value != null && !value.contains('@'))
                                    ? 'Debes ingresar un correo valido.'
                                    : null;
                              },
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                icon: Icon(
                                  Icons.lock,
                                  color: Color(0xFF225A4D),
                                ),
                                hintText: '',
                                labelText: 'Contraseña',
                              ),
                              obscureText: true,
                              validator: (String? value) {
                                return (value == null)
                                    ? 'Campo requerido.'
                                    : null;
                              },
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 25.0),
                                child: ElevatedButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                      elevation: MaterialStateProperty.all(0),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Color(0xFF225A4D)),
                                      padding: MaterialStateProperty.all(
                                          EdgeInsets.symmetric(
                                              horizontal: 70, vertical: 15)),
                                    ),
                                    child: Text('Iniciar sesión')),
                              ),
                            )
                          ]),
                    ),
                  ),
                  margin:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  height: MediaQuery.of(context).size.width * 0.85,
                  width: MediaQuery.of(context).size.width * 0.85,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.9),
                        spreadRadius: 3,
                        blurRadius: 2,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                )
              ],
            ),
          ]),
    );
  }
}
