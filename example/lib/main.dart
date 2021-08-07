import 'package:flutter/material.dart';
import 'package:validadores/Validador.dart';

void main() => runApp(MalidadoresMain());

class MalidadoresMain extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final _formKey = GlobalKey<FormState>();

    return MaterialApp(
      title: 'Validador',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Validadores'),
        ),
        body: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                TextFormField(
                  validator: (value) {
                    // Aqui entram as validações
                    return Validador()
                        .add(Validar.CPF, msg: 'CPF Inválido')
                        .add(Validar.OBRIGATORIO, msg: 'Campo obrigatório')
                        .minLength(11)
                        .maxLength(11)
                        .valido(value,clearNoNumber: true);

                  },
                  decoration: InputDecoration(
                    helperText: 'informe seu cpf',
                    hintText: '123.456.789-00',
                    labelText: 'CPF'
                  ),
                ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState.validate()) {
              print('Valido');
            }
          },
          child: Text('Enviar'),
        )
              ],
            )
          ),
        ),
      )
      ,
    );
  }

}