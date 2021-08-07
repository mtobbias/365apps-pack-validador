import 'package:flutter_test/flutter_test.dart';
import 'package:validadores/Validador.dart';

class _Contants {
  static final testeName = "CPF";
  static final defaultMessageInvalid = "Campo Inválido";
  static final validValue = "99988877714";
  static final invalidValue = "99988877713";
  static final invalidValue00 = "00000000000";
  static final invalidValueInc = "999888777";
  static final invalidValueNull = null;

}
  void main() {

    test(_Contants.testeName + ' invalidValueInc', () {
      var validador = Validador().add(
          Validar.CPF, msg: _Contants.defaultMessageInvalid);
      expect(_getDefaultResp(), validador.valido(_Contants.invalidValueNull));
    });

    test(_Contants.testeName + ' invalidValueInc', () {
      var validador = Validador().add(
          Validar.CPF, msg: _Contants.defaultMessageInvalid);
      expect(_getDefaultResp(), validador.valido(_Contants.invalidValueInc));
    });

    test(_Contants.testeName + ' invalidValue00', () {
      var validador = Validador().add(
          Validar.CPF, msg: _Contants.defaultMessageInvalid);
      expect(_getDefaultResp(), validador.valido(_Contants.invalidValue00));
    });

    test(_Contants.testeName + ' VALIDO', () {
      var validador = Validador().add(
          Validar.CPF, msg: _Contants.defaultMessageInvalid);
      expect(null, validador.valido(_Contants.validValue));
    });

    test(_Contants.testeName + ' INVALIDO', () {
      var validador = Validador().add(
          Validar.CPF, msg: _Contants.defaultMessageInvalid);
      expect(_getDefaultResp(), validador.valido(_Contants.invalidValue));
    });
  }

  _getDefaultResp() {
    return List.from({_Contants.defaultMessageInvalid}).toString().toString();
  }


