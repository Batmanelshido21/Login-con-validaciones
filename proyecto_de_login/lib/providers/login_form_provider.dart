import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  // ignore: unnecessary_new
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  String email = '';
  String password = '';

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
