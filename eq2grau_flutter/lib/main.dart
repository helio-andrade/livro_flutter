import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Solução de uma Equação do 2º Grau',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true, // Centraliza o texto
          title: Text(
            'Solução de uma Equação do 2º Grau',
            textAlign: TextAlign.center, // Alinha o texto ao centro
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 20.0), // Espaço de 20 pixels abaixo da AppBar
          child: Center(
            child: EquationSolverForm(),
          ),
        ),
      ),
    );
  }
}

class EquationSolverForm extends StatefulWidget {
  @override
  _EquationSolverFormState createState() => _EquationSolverFormState();
}

class _EquationSolverFormState extends State<EquationSolverForm> {
  final _formKey = GlobalKey<FormState>(); // Chave global para o formulário
  final TextEditingController _inputAController = TextEditingController(); // Controlador para o campo de entrada "a"
  final TextEditingController _inputBController = TextEditingController(); // Controlador para o campo de entrada "b"
  final TextEditingController _inputCController = TextEditingController(); // Controlador para o campo de entrada "c"
  String _result = ''; // Variável para armazenar o resultado da equação

  @override
  void dispose() {
    _inputAController.dispose(); // Libera recursos do controlador ao sair da tela
    _inputBController.dispose(); // Libera recursos do controlador ao sair da tela
    _inputCController.dispose(); // Libera recursos do controlador ao sair da tela
    super.dispose();
  }

  void _calculateRoots() {
    if (_formKey.currentState!.validate()) { // Verifica se os campos do formulário são válidos
      double a = double.parse(_inputAController.text); // Obtém o valor de "a"
      double b = double.parse(_inputBController.text); // Obtém o valor de "b"
      double c = double.parse(_inputCController.text); // Obtém o valor de "c"

      double delta = pow(b, 2) - 4 * a * c; // Calcula o valor de delta
      double raiz1, raiz2;

      if (delta > 0) { // Se delta for maior que zero, possui duas raízes reais
        raiz1 = (-b + sqrt(delta)) / (2 * a); // Calcula a primeira raiz
        raiz2 = (-b - sqrt(delta)) / (2 * a); // Calcula a segunda raiz
      } else if (delta == 0) { // Se delta for igual a zero, possui uma raiz real
        raiz1 = raiz2 = -b / (2 * a); // Calcula a única raiz
      } else { // Se delta for menor que zero, não possui raízes reais
        raiz1 = raiz2 = double.nan; // Define o valor como NaN (Não é um número)
      }

      setState(() {
        _result = 'x\' = $raiz1\nx\'\' = $raiz2'; // Atualiza o resultado com as raízes calculadas
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey, // Associa a chave global ao formulário
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 200, // Largura fixa dos campos de entrada
                child: TextFormField(
                  controller: _inputAController, // Associa o controlador ao campo de entrada "a"
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'a ='), // Texto do rótulo do campo
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira um valor para a'; // Mensagem de validação caso o campo esteja vazio
                    }
                    return null; // Campo válido
                  },
                ),
              ),
              SizedBox(
                width: 200, // Largura fixa dos campos de entrada
                child: TextFormField(
                  controller: _inputBController, // Associa o controlador ao campo de entrada "b"
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'b ='), // Texto do rótulo do campo
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira um valor para b'; // Mensagem de validação caso o campo esteja vazio
                    }
                    return null; // Campo válido
                  },
                ),
              ),
              SizedBox(
                width: 200, // Largura fixa dos campos de entrada
                child: TextFormField(
                  controller: _inputCController, // Associa o controlador ao campo de entrada "c"
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'c ='), // Texto do rótulo do campo
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira um valor para c'; // Mensagem de validação caso o campo esteja vazio
                    }
                    return null; // Campo válido
                  },
                ),
              ),
              SizedBox(height: 20), // Espaço vertical de 20 pixels
              ElevatedButton(
                onPressed: _calculateRoots, // Função a ser executada quando o botão for pressionado
                child: Text('Calcular Raízes'), // Texto do botão
              ),
              SizedBox(height: 20), // Espaço vertical de 20 pixels
              Text(
                'Resultado:', // Título do resultado
                style: TextStyle(fontSize: 20), // Estilo do texto
              ),
              Text(
                _result, // Resultado da equação
                style: TextStyle(fontSize: 18), // Estilo do texto
              ),
            ],
          ),
        ),
      ),
    );
  }
}
