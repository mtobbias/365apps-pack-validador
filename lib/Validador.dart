
import 'ValidarCNPJ.dart';
import 'ValidarCPF.dart';
import 'ValidarEmail.dart';

enum Validar { CPF, CNPJ, OBRIGATORIO, EMAIL, OBRIGATORIO_SE_NULO }

class Validador {
  static const DEFAULT_MESSAGE ="Campo Inválido";

  Map<Validar, String> _lista = Map();
  List<String?> _erros = [];

  int? _minLength;
  String? _minLengthMsg;
  int? _maxLength;
  String? _maxLengthMsg;

  int? _minVal;
  String? _minValMsg;
  int? _maxVal;
  String? _maxValMsg;

  String? _equals;
  String? _equalsMsg;

  bool? _isBool;
  String? _isBoolMsg;

  Validador isTrue(bool boolValue, {String msg = DEFAULT_MESSAGE}) {
    this._isBool = boolValue;
    this._isBoolMsg = msg;
    return this;
  }
  Validador equals(String value, {String msg = DEFAULT_MESSAGE}) {
    this._equals = value;
    this._equalsMsg = msg;
    return this;
  }

  Validador maxVal(int max, {String msg = DEFAULT_MESSAGE}) {
    this._maxValMsg = msg;
    this._maxVal = max;
    return this;
  }

  Validador minVal(int min, {String msg = DEFAULT_MESSAGE}) {
    this._minValMsg = msg;
    this._minVal = min;
    return this;
  }

  Validador maxLength(int max, {String msg = DEFAULT_MESSAGE}) {
    this._maxLengthMsg = msg;
    this._maxLength = max;
    return this;
  }

  Validador minLength(int min, {String msg = DEFAULT_MESSAGE}) {
    this._minLengthMsg = msg;
    this._minLength = min;
    return this;
  }

  Validador add(Validar v, {String msg = DEFAULT_MESSAGE}) {
    this._lista[v] = msg;
    return this;
  }

  String? validar(String? valor, {clearNoNumber = false, seNulo}) {
      return this.valido(valor,clearNoNumber: clearNoNumber,  seNulo: seNulo );
  }

  String? valido(String? valor, {clearNoNumber = false, seNulo }) {
    bool isNotNull = (valor != null);

    if (clearNoNumber) {
      valor = valor!.replaceAll(RegExp(r'[^0-9]'), '');
    }

    if(!_lista.values.contains(Validar.OBRIGATORIO_SE_NULO)){
      if (this._equals != null) {
        if (!isNotNull || valor != this._equals) {
          _erros.add(this._equalsMsg);
        }
      }
    }

    if (this._minVal != null) {
      try {
        if (!isNotNull || int.parse(valor!) < this._minVal!) {
          _erros.add(this._minValMsg);
        }
      } catch (e) {
        _erros.add(this._minValMsg);
      }
    }

    if (this._maxVal != null) {
      try {
        if (!isNotNull || int.parse(valor!) > this._maxVal!) {
          _erros.add(this._maxValMsg);
        }
      } catch (e) {
        _erros.add(this._maxValMsg);
      }
    }

    if (this._minLength != null) {
      if (!isNotNull || valor!.length < this._minLength!) {
        _erros.add(this._minLengthMsg);
      }
    }

    if (this._maxLength != null) {
      if (!isNotNull || valor!.length > this._maxLength!) {
        _erros.add(this._maxLengthMsg);
      }
    }

    if (this._isBool != null) {
      if (!isNotNull || !this._isBool!) {
        _erros.add(this._isBoolMsg);
      }
    }


    _lista.forEach((validar, msg) {
      switch (validar) {

        case Validar.OBRIGATORIO:
          if (!isNotNull || valor!.trim().isEmpty) {
            _erros.add(msg);
          }
          break;

        case Validar.OBRIGATORIO_SE_NULO :
          if (seNulo==null) {
            if (!isNotNull || valor!.trim().isEmpty) {
              _erros.add(msg);
            }
          }

          break;
        case Validar.CPF:
          if (!CPF.isValid(valor)) {
            _erros.add(msg);
          }

          break;

        case Validar.CNPJ:
          if (!CNPJ.isValid(valor)) {
            _erros.add(msg);
          }
          break;

        case Validar.EMAIL:
          if (!EmailValidator.validate(valor)) {
            _erros.add(msg);
          }
          break;
        default:
      }
    });

    if (_erros.length > 0) {
      return _erros.toString();
    }

    return null;
  }
}
