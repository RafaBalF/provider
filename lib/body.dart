import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:proj_login/controller.dart';
import 'package:provider/provider.dart';

class BodyWidget extends StatelessWidget {
  _textField({String? labelText, onChanged, String? errorText}) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
        // ignore: prefer_if_null_operators
        errorText: errorText == null ? null : errorText,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<Controller>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Observer(
            builder: (_) {
              return _textField(
                  errorText: controller.validateLogin(),
                  labelText: "login",
                  onChanged: controller.client.chaLogin);
            },
          ),
          const SizedBox(
            height: 30,
          ),
          Observer(
            builder: (_) {
              return _textField(
                  errorText: controller.validateSenha(),
                  labelText: "Senha",
                  onChanged: controller.client.chaSenha);
            },
          ),
          const SizedBox(
            height: 90,
          ),
          Observer(builder: (_) {
            return ElevatedButton(
              onPressed: controller.isValid ? () {} : null,
              child: const Text('Entrar'),
            );
          }),
        ],
      ),
    );
  }
}
