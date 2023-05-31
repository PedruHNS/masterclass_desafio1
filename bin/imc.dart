import 'dart:io';

String input({required String messager}) {
  String? input;
  while (input == null) {
    print(messager);
    input = stdin.readLineSync();
  }
  return input;
}

void main() {
  Pessoa pessoa = Pessoa(
    nome: input(messager: 'digite o nome'),
    peso: double.parse(input(messager: 'digite o peso')),
    altura: double.parse(input(messager: 'digite o altura')),
  );
  print('\n');
  print('Nome: ${pessoa.nome}\nPeso: ${pessoa.peso}\nAltura: ${pessoa.altura}\nIMC: ${pessoa.imc()}');


}

class Pessoa {
  String nome;
  double peso;
  double altura;

  Pessoa({
    required this.nome,
    required this.peso,
    required this.altura,
  });

  String imc() {
    double imc = peso / (altura * altura);
    if (imc < 18.5) {
      return '${imc.toStringAsFixed(2)} abaixo do peso';
    }
    if (imc <= 24.9) {
      return '${imc.toStringAsFixed(2)} peso normal';
    }
    if (imc <= 29.9) {
      return '${imc.toStringAsFixed(2)} excesso de peso';
    }
    return '${imc.toStringAsFixed(2)} obeso';
  }
}