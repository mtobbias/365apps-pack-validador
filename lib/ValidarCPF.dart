/**
 * Validador original 
 * autor: Thiago P. Martinez
 * git: https://github.com/thiagopereiramartinez
 * https://github.com/thiagopereiramartinez/dart-cpfcnpj/blob/master/lib/src/cpf.dart
 */


class CPF {
  // Validar número de CPF
  static bool isValid(String cpf) {
    if (cpf == null) return false;

    // Obter somente os números do CPF
    var numeros = cpf.replaceAll(RegExp(r'[^0-9]'), '');

    // Testar se o CPF possui 11 dígitos
    if (numeros.length != 11) return false;

    // Testar se todos os dígitos do CPF são iguais
    if (RegExp(r'^(\d)\1*$').hasMatch(numeros)) return false;

    // Dividir dígitos
    List<int> digitos =
        numeros.split('').map((String d) => int.parse(d)).toList();

    // Calcular o primeiro dígito verificador
    var calc_dv1 = 0;
    for (var i in Iterable<int>.generate(9, (i) => 10 - i)) {
      calc_dv1 += digitos[10 - i] * i;
    }
    calc_dv1 %= 11;
    var dv1 = calc_dv1 < 2 ? 0 : 11 - calc_dv1;

    // Testar o primeiro dígito verificado
    if (digitos[9] != dv1) return false;

    // Calcular o segundo dígito verificador
    var calc_dv2 = 0;
    for (var i in Iterable<int>.generate(10, (i) => 11 - i)) {
      calc_dv2 += digitos[11 - i] * i;
    }
    calc_dv2 %= 11;
    var dv2 = calc_dv2 < 2 ? 0 : 11 - calc_dv2;

    // Testar o segundo dígito verificador
    if (digitos[10] != dv2) return false;

    return true;
  }
}