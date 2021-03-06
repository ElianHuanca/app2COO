import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  String nombre = '';
  String email = '';
  String password = '';
  String celular = '';
  String especialidad = '';
  String grupo = '';
  String cargo = '';
  
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    print(formKey.currentState?.validate());

    print('$email - $password - $nombre - $celular - $especialidad');

    return formKey.currentState?.validate() ?? false;
  }
}
