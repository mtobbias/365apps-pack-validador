import 'package:flutter_test/flutter_test.dart';
import 'package:validadores/Validador.dart';


class _Constants {
  static final testName ="EMAIL";
  static final defaultMessageInvalid ="Campo Inválido";
  static final validValue = "marcelo.tobbias@gmail.com";
  static final validValueBr = "contato@registro.br";
  static final validValueComBr = "contato@365apps.com.br";
  static final invalidValue = "marcelo.tobbias@gmail";
  static final invalidValueNull = null;
}


void main(){

  /**
   *  @see https://github.com/mtobbias/365apps-pack-validador/issues/1
   */
  test(_Constants.testName +' VALIDO_COM_BR', () {
    var validador = Validador().add(Validar.EMAIL, msg: _Constants.defaultMessageInvalid);
    expect(null,validador.valido(_Constants.validValueComBr));
  });

  test(_Constants.testName +' VALIDO_BR', () {
    var validador = Validador().add(Validar.EMAIL, msg: _Constants.defaultMessageInvalid);
    expect(null,validador.valido(_Constants.validValueBr));
  });


  test(_Constants.testName +' VALIDO', () {
    var validador = Validador().add(Validar.EMAIL, msg: _Constants.defaultMessageInvalid);
    expect(null,validador.valido(_Constants.validValue));
  });

  test(_Constants.testName +' INVALIDO', () {
    var validador = Validador().add(Validar.EMAIL, msg: _Constants.defaultMessageInvalid);
    expect(List.from({_Constants.defaultMessageInvalid}).toString(),validador.valido(_Constants.invalidValue));
  });

  test(_Constants.testName +' INVALIDO', () {
    var validador = Validador().add(Validar.EMAIL, msg: _Constants.defaultMessageInvalid);
    expect(List.from({_Constants.defaultMessageInvalid}).toString(),validador.valido(_Constants.invalidValueNull));
  });

}



