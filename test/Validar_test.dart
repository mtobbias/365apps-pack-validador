import 'package:flutter_test/flutter_test.dart';
import 'package:validadores/Validador.dart';

class _Contants {
  static final testName = "GERAL";
  static final defaultMessageInvalid = "Campo Inválido";
  static final valorValido = "valor de teste";
  static final valorInvalido =null;

}
void main() {

    test(_Contants.testName + ' valorInvalido', () {
      var validador = Validador().add(
      Validar.OBRIGATORIO, msg: _Contants.defaultMessageInvalid);
      expect(_getDefaultResp(), validador.valido(_Contants.valorInvalido));
    });

    test(_Contants.testName + ' valorValido', () {
      var validador = Validador().add(
      Validar.OBRIGATORIO, msg: _Contants.defaultMessageInvalid);
      expect(null, validador.valido(_Contants.valorValido));
    });

    test(_Contants.testName + ' OBRIGATORIO_SE_NULO_INVALIDO', () {
      var validador = Validador().add(
          Validar.OBRIGATORIO_SE_NULO, msg: _Contants.defaultMessageInvalid);
      expect(null, validador.valido(_Contants.valorValido, seNulo: null));
    });

    test(_Contants.testName + ' OBRIGATORIO_SE_NULO_INVALIDO#2', () {
      var validador = Validador().add(
          Validar.OBRIGATORIO_SE_NULO, msg: _Contants.defaultMessageInvalid);
      expect(null, validador.valido(_Contants.valorInvalido, seNulo: "null"));
    });

    test(_Contants.testName + ' OBRIGATORIO_SE_NULO_INVALIDO#3', () {
      var validador = Validador().add(
          Validar.OBRIGATORIO_SE_NULO, msg: _Contants.defaultMessageInvalid);
      expect(_getDefaultResp(), validador.valido(_Contants.valorInvalido, seNulo: _Contants.valorInvalido));
    });


}

  _getDefaultResp() {
    return List.from({_Contants.defaultMessageInvalid}).toString().toString();
  }


