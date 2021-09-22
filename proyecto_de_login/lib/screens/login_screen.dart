// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_de_login/providers/login_form_provider.dart';
import 'package:proyecto_de_login/widgets/widgets.dart';

// ignore: use_key_in_widget_constructors
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
          child: SingleChildScrollView(
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            SizedBox(height: 250),
            CardContainer(
                child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                SizedBox(
                  height: 10,
                ),
                SizedBox(height: 10),
                Text(
                  'Login',
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(
                  height: 30,
                ),
                ChangeNotifierProvider(
                    create: (_) => LoginFormProvider(), child: InputLogin())
              ],
            ))
          ],
        ),
      )),
    );
  }
}

class InputLogin extends StatefulWidget {
  const InputLogin({Key? key}) : super(key: key);

  @override
  _InputLoginState createState() => _InputLoginState();
}

class _InputLoginState extends State<InputLogin> {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Form(
        key: loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            _InputCorreo(),
            SizedBox(
              height: 30,
            ),
            InputContrasena(),
            SizedBox(
              height: 30,
            ),
            BottonIngresar()
          ],
        ),
      ),
    );
  }
}

class BottonIngresar extends StatelessWidget {
  const BottonIngresar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        disabledColor: Colors.grey,
        elevation: 0,
        color: Colors.deepPurple,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 70, vertical: 15),
          child: Text('Ingresar'),
        ),
        onPressed: () {
          if (loginForm.isValidForm()) {
            if (loginForm.email == 'javierjuarez.jj28@gmail.com' &&
                loginForm.password == 'Jogabonito20') {
              Navigator.pushReplacementNamed(context, 'homeScreen');
            }
          }
        });
  }
}

class InputContrasena extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: "Introduce tu contraseña",
        labelText: "Password",
        icon: Icon(
          Icons.lock_outline,
          color: Colors.purple,
        ),
      ),
      onChanged: (value) {
        loginForm.password = value;
      },
      validator: (value) {
        if (value != null && value.length >= 6) {
          return null;
        } else {
          return 'La contaseña debe tener al menos 6 caracteres';
        }
      },
    );
  }
}

class _InputCorreo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: "Correo electrónico",
          labelText: "Email",
          icon: Icon(
            Icons.email,
            color: Colors.purple,
          )),
      onChanged: (value) {
        loginForm.email = value;
      },
      validator: (value) {
        String pattern =
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
        // ignore: unnecessary_new
        RegExp regExp = new RegExp(pattern);
        return regExp.hasMatch(value ?? '')
            ? null
            : 'El texto proporcionado no es un correo';
      },
    );
  }
}
