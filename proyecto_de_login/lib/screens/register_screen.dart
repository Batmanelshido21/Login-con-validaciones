import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_de_login/providers/login_form_provider.dart';
import 'package:proyecto_de_login/widgets/widgets.dart';

// ignore: use_key_in_widget_constructors
class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
          child: SingleChildScrollView(
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            // ignore: prefer_const_constructors
            SizedBox(height: 250),
            CardContainer(
                child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 10,
                ),
                // ignore: prefer_const_constructors
                SizedBox(height: 10),
                Text(
                  'Registrar usuario',
                  style: Theme.of(context).textTheme.headline4,
                ),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 30,
                ),
                ChangeNotifierProvider(
                    // ignore: prefer_const_constructors
                    create: (_) => LoginFormProvider(),
                    // ignore: prefer_const_constructors
                    child: InputForm())
              ],
            ))
          ],
        ),
      )),
    );
  }
}

class InputForm extends StatefulWidget {
  const InputForm({Key? key}) : super(key: key);

  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
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
            _InputCorreoForm(),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 30,
            ),
            InputContrasenaForm(),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 30,
            ),
            // ignore: prefer_const_constructors
            BotonRegistrar()
          ],
        ),
      ),
    );
  }
}

class BotonRegistrar extends StatelessWidget {
  const BotonRegistrar({
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
          // ignore: prefer_const_constructors
          padding: EdgeInsets.symmetric(horizontal: 70, vertical: 15),
          child: Text(loginForm.isLoading ? 'Espere' : 'Ingresar'),
        ),
        onPressed: loginForm.isLoading
            ? null
            : () async {
                //Quitar teclado de la pantalla
                FocusScope.of(context).unfocus();
                if (loginForm.isValidForm()) {
                  if (loginForm.email == 'javierjuarez.jj28@gmail.com' &&
                      loginForm.password == 'Jogabonito20') {
                    loginForm.isLoading = true;
                    // ignore: prefer_const_constructors
                    await Future.delayed(Duration(seconds: 2));
                    Navigator.pushReplacementNamed(context, 'homeScreen');
                  }
                }
              });
  }
}

// ignore: use_key_in_widget_constructors
class InputContrasenaForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: "Introduce tu contraseña",
        labelText: "Password",
        // ignore: prefer_const_constructors
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

class _InputCorreoForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: "Correo electrónico",
          labelText: "Email",
          // ignore: prefer_const_constructors
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
