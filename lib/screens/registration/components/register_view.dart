import 'package:ascend/models/register/register.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../size_config.dart';
import '../../../theme.dart';

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
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: 40, vertical: getProportionateScreenHeight(225)),
      decoration: BoxDecoration(gradient: AppTheme.defaultGradient()),
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight,
      child: Form(
        key: formKey,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Register',
                style: AppTheme.labelText(
                    color: AppTheme.neutralColor, fontWeight: FontWeight.bold),
              ),
              ...List.generate(
                fields.length,
                (index) => CustomTextField(
                  field: fields[index],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                    onPressed: () {
                      Map<String, dynamic> currentRegister = {};

                      for (RegisterField item in fields) {
                        currentRegister[item.label] = item.controller.text;
                      }
                      Register result = Register.fromMap(currentRegister);

                      Provider.of<RegisterProvider>(context, listen: false)
                          .add(result);

                      Navigator.pushReplacementNamed(context, '/homepage');
                    },
                    child: Text(
                      "Registrar",
                      style: AppTheme.labelText(),
                    )),
              )
            ]),
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
          fillColor: AppTheme.neutralColor,
          filled: true,
          label: Text(field.label),
          prefixIcon: Icon(field.icon)),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: field.controller,
      validator: field.validator,
    );
  }
}
