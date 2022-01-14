import 'package:flutter/material.dart';
import 'package:inventario_urba/providers/login_form_provider.dart';
import 'package:inventario_urba/router/app_routes.dart';
import 'package:inventario_urba/screens/screens.dart';
import 'package:inventario_urba/theme/app_theme.dart';
import 'package:provider/provider.dart';

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
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Image(image: AssetImage('assets/login.png')),
            const SizedBox(
              height: 70,
            ),
            const Icon(
              Icons.people,
              color: AppTheme.primary,
              size: 70,
            ),
            ChangeNotifierProvider(
              create: (_) => LoginFormProvider(),
              child: _LoginForm(),
            ),
            const SizedBox(
              height: 80,
            ),
          ],
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LoginForm = Provider.of<LoginFormProvider>(context);
    return Container(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 25),
        child: Form(
          key: LoginForm.formkey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const Padding(
              padding: EdgeInsets.only(top: 35, bottom: 18.0),
              child: Text(
                'Iniciar Sesión',
                style: TextStyle(
                  color: AppTheme.primary,
                  fontSize: 20,
                ),
              ),
            ),
            TextFormField(
              onChanged: (value) => LoginForm.email = value,
              decoration: const InputDecoration(
                icon: Icon(
                  Icons.alternate_email,
                  color: AppTheme.primary,
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
              onChanged: (value) => LoginForm.password = value,
              decoration: InputDecoration(
                icon: const Icon(
                  Icons.lock,
                  color: AppTheme.primary,
                ),
                suffixIcon: IconButton(
                    icon: Icon(
                      LoginForm.isObscure
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      LoginForm.isObscure = !LoginForm.isObscure;
                      print("mostrar ocultar pass ");
                      //LoginForm.notifyListeners();
                      //setState(() {
                      //_isObscure = !_isObscure;
                      //});
                    }),
                hintText: '',
                labelText: 'Contraseña',
              ),
              obscureText: LoginForm.isObscure,
              validator: (String? value) {
                return (value == null || value.length == 0)
                    ? 'Campo requerido.'
                    : null;
              },
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: ElevatedButton(
                  onPressed: LoginForm.isLoading
                      ? null
                      : () async {
                          //Navigator.pushReplacementNamed(context, 'inventario');
                          LoginForm.isLoading = true;
                          FocusScope.of(context).unfocus();
                          if (!LoginForm.isValidForm())
                            return;
                          else
                            Navigator.pushReplacementNamed(
                                context, 'inventario');
                          await Future.delayed(Duration(seconds: 2));
                        },
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor:
                        MaterialStateProperty.all(AppTheme.primary),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            horizontal: 70, vertical: 15)),
                  ),
                  child: Text(
                    LoginForm.isLoading ? 'Iniciando sesión' : 'Iniciar sesión',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
    );
  }
}
