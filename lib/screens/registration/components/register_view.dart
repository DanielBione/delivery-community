import 'package:ascend/models/register/register.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';

List<IconData> icons = [Icons.person, Icons.mail, Icons.phone, Icons.password];

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final formKey = GlobalKey();

  generateFields() {
    List<String> parameters = Register.parameters();

    final controllers =
        List.generate(parameters.length, (index) => TextEditingController());

    return List<RegisterField>.generate(
        parameters.length,
        (index) => RegisterField.fromGenerator(
            parameters[index], index, controllers[index]));
  }

  @override
  Widget build(BuildContext context) {
    final fields = generateFields();
    return SizedBox(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight,
      child: Form(
        key: formKey,
        child: Column(
          children: List.generate(
            fields.lenght,
            (index) => CustomTextField(
              field: fields[index],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final RegisterField field;
  const CustomTextField({Key? key, required this.field}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          label: Text(field.label), prefixIcon: Icon(field.icon)),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: field.controller,
      validator: field.validator,
    );
  }
}
