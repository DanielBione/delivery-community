// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import '../../screens/registration/components/register_view.dart';

class RegisterField {
  final String label; //*self
  final IconData icon; //*data set
  final String? Function(String?) validator;
  final TextEditingController controller;
  RegisterField({
    required this.controller,
    required this.label,
    required this.icon,
    required this.validator,
  });

  factory RegisterField.fromGenerator(
      String fieldName, int position, TextEditingController controller) {
    return RegisterField(
        controller: controller,
        label: fieldName,
        icon: icons[position],
        validator: (String? value) {
          if (value == null || value == "") return 'Preencha o campo!';
          return null;
        });
  }
}

class Register {
  String? name;
  String? email;
  String? phone;
  String? password;
  Register({
    this.name,
    this.email,
    this.phone,
    this.password,
  });

  static List<String> parameters() {
    return [
      'name',
      'email',
      'phone',
      'password',
    ];
  }
}

class RegisterProvider extends ChangeNotifier {
  List<Register> register;

  RegisterProvider({
    required this.register,
  });
}
