import 'package:flutter_test/flutter_test.dart';
import 'package:validadores/Validador.dart';

class _Contants {
  static final testName = "CNPJ";
  static final defaultMessageInvalid = "Campo Inválido";
  static final validValue = "77287898000155";
  static final invalidValue = "77287898000154";
  static final invalidValue00 = "00000000000";
  static final invalidValueInc = "77287898000";
  static final invalidValueNull = null;

}
void main() {

    test(_Contants.testName + ' invalidValueInc', () {
      var validador = Validador().add(
          Validar.CPF, msg: _Contants.defaultMessageInvalid);
      expect(_getDefaultResp(), validador.valido(_Contants.invalidValueNull));
    });

    test(_Contants.testName + ' invalidValueInc', () {
      var validador = Validador().add(
          Validar.CNPJ, msg: _Contants.defaultMessageInvalid);
      expect(_getDefaultResp(), validador.valido(_Contants.invalidValueInc));
    });

    test(_Contants.testName + ' invalidValue00', () {
      var validador = Validador().add(
          Validar.CNPJ, msg: _Contants.defaultMessageInvalid);
      expect(_getDefaultResp(), validador.valido(_Contants.invalidValue00));
    });

    test(_Contants.testName + ' VALIDO', () {
      var validador = Validador().add(
          Validar.CNPJ, msg: _Contants.defaultMessageInvalid);
      expect(null, validador.valido(_Contants.validValue));
    });

    test(_Contants.testName + ' INVALIDO', () {
      var validador = Validador().add(
          Validar.CNPJ, msg: _Contants.defaultMessageInvalid);
      expect(_getDefaultResp(), validador.valido(_Contants.invalidValue));
    });
  }

  _getDefaultResp() {
    return List.from({_Contants.defaultMessageInvalid}).toString().toString();
  }


