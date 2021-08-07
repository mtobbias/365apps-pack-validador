import 'package:flutter_test/flutter_test.dart';
import 'package:validadores/Validador.dart';


class _Constants {
  static final TEST_NAME ="EMAIL";
  static final DEFAULT_MESSAGE_INVALID ="Campo Inválido";
  static final VALID_VALUE = "marcelo.tobbias@gmail.com";
  static final VALID_VALUE_BR = "contato@registro.br";
  static final VALID_VALUE_COM_BR = "contato@365apps.com.br";
  static final INVALID_VALUE = "marcelo.tobbias@gmail";
}


void main(){

  /**
   *  @see https://github.com/mtobbias/365apps-pack-validador/issues/1
   */
  test(_Constants.TEST_NAME +' VALIDO_COM_BR', () {
    var validador = Validador().add(Validar.EMAIL, msg: _Constants.DEFAULT_MESSAGE_INVALID);
    expect(null,validador.valido(_Constants.VALID_VALUE_COM_BR));
  });

  test(_Constants.TEST_NAME +' VALIDO_BR', () {
    var validador = Validador().add(Validar.EMAIL, msg: _Constants.DEFAULT_MESSAGE_INVALID);
    expect(null,validador.valido(_Constants.VALID_VALUE_BR));
  });


  test(_Constants.TEST_NAME +' VALIDO', () {
    var validador = Validador().add(Validar.EMAIL, msg: _Constants.DEFAULT_MESSAGE_INVALID);
    expect(null,validador.valido(_Constants.VALID_VALUE));
  });

  test(_Constants.TEST_NAME +' INVALIDO', () {
    var validador = Validador().add(Validar.EMAIL, msg: _Constants.DEFAULT_MESSAGE_INVALID);
    expect(List.from({_Constants.DEFAULT_MESSAGE_INVALID}).toString(),validador.valido(_Constants.INVALID_VALUE));
  });

}



