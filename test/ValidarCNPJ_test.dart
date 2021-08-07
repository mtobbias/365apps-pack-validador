import 'package:flutter_test/flutter_test.dart';
import 'package:validadores/Validador.dart';

class _Contants {
  static final TEST_NAME = "CNPJ";
  static final DEFAULT_MESSAGE_INVALID = "Campo Inválido";
  static final VALID_VALUE = "77287898000155";
  static final INVALID_VALUE = "77287898000154";
  static final INVALID_VALUE_00 = "00000000000";
  static final INVALID_VALUE_INC = "77287898000";
  static final INVALID_VALUE_NULL = null;

}
void main() {

    test(_Contants.TEST_NAME + ' INVALID_VALUE_INC', () {
      var validador = Validador().add(
          Validar.CPF, msg: _Contants.DEFAULT_MESSAGE_INVALID);
      expect(_getDefaultResp(), validador.valido(_Contants.INVALID_VALUE_NULL));
    });

    test(_Contants.TEST_NAME + ' INVALID_VALUE_INC', () {
      var validador = Validador().add(
          Validar.CNPJ, msg: _Contants.DEFAULT_MESSAGE_INVALID);
      expect(_getDefaultResp(), validador.valido(_Contants.INVALID_VALUE_INC));
    });

    test(_Contants.TEST_NAME + ' INVALID_VALUE_00', () {
      var validador = Validador().add(
          Validar.CNPJ, msg: _Contants.DEFAULT_MESSAGE_INVALID);
      expect(_getDefaultResp(), validador.valido(_Contants.INVALID_VALUE_00));
    });

    test(_Contants.TEST_NAME + ' VALIDO', () {
      var validador = Validador().add(
          Validar.CNPJ, msg: _Contants.DEFAULT_MESSAGE_INVALID);
      expect(null, validador.valido(_Contants.VALID_VALUE));
    });

    test(_Contants.TEST_NAME + ' INVALIDO', () {
      var validador = Validador().add(
          Validar.CNPJ, msg: _Contants.DEFAULT_MESSAGE_INVALID);
      expect(_getDefaultResp(), validador.valido(_Contants.INVALID_VALUE));
    });
  }

  _getDefaultResp() {
    return List.from({_Contants.DEFAULT_MESSAGE_INVALID}).toString().toString();
  }


