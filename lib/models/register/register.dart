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
    IconData icon = Icons.arrow_forward_ios;

    if (position <= icons.length) {
      icon = icons[position];
    }

    return RegisterField(
        controller: controller,
        label: fieldName,
        icon: icon,
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
    return ['name', 'email', 'phone', 'password'];
  }

  factory Register.fromMap(Map<String, dynamic> map) {
    return Register(
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
    );
  }
}

class RegisterProvider extends ChangeNotifier {
  List<Register> cadastro;

  RegisterProvider({
    required this.cadastro,
  });

  void add(Register register) {
    cadastro.add(register);
    notifyListeners();
  }
}
