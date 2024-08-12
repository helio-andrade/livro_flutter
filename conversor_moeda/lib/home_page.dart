import 'package:flutter/material.dart';
import 'currency_service.dart';
import 'currency_text_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final euroController = TextEditingController();
  final bitcoinController = TextEditingController();

  late double dolar;
  late double euro;
  late double bitcoin;

  void _clearAll() {
    realController.text = "";
    dolarController.text = "";
    euroController.text = "";
    bitcoinController.text = "";
  }

  void _realChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double real = double.parse(text);
    dolarController.text = (real / dolar).toStringAsFixed(2);
    euroController.text = (real / euro).toStringAsFixed(2);
    bitcoinController.text = (real / bitcoin).toStringAsFixed(6);
  }

  void _dolarChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double dolar = double.parse(text);
    realController.text = (dolar * this.dolar).toStringAsFixed(2);
    euroController.text = (dolar * this.dolar / euro).toStringAsFixed(2);
    bitcoinController.text = (dolar * this.dolar / bitcoin).toStringAsFixed(6);
  }

  void _euroChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double euro = double.parse(text);
    realController.text = (euro * this.euro).toStringAsFixed(2);
    dolarController.text = (euro * this.euro / dolar).toStringAsFixed(2);
    bitcoinController.text = (euro * this.euro / bitcoin).toStringAsFixed(6);
  }

  void _bitcoinChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double bitcoin = double.parse(text);
    realController.text = (bitcoin * this.bitcoin).toStringAsFixed(2);
    dolarController.text = (bitcoin * this.bitcoin / dolar).toStringAsFixed(2);
    euroController.text = (bitcoin * this.bitcoin / euro).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Conversor de moeda"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: FutureBuilder<Map>(
        future: getData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const Center(
                child: Text(
                  "Aguarde...",
                  style: TextStyle(color: Colors.green, fontSize: 30.0),
                  textAlign: TextAlign.center,
                ),
              );
            default:
              if (snapshot.hasError) {
                return const Center(
                  child: Text(
                    "Ops, houve uma falha ao buscar os dados",
                    style: TextStyle(color: Colors.green, fontSize: 25.0),
                    textAlign: TextAlign.center,
                  ),
                );
              } else {
                dolar = double.parse(snapshot.data!["USDBRL"]["bid"]);
                euro = double.parse(snapshot.data!["EURBRL"]["bid"]);
                bitcoin = double.parse(snapshot.data!["BTCBRL"]["bid"]);

                return SingleChildScrollView(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Container(
                      width: 450.0, // Limite a largura dos campos
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          const Icon(
                            Icons.attach_money,
                            size: 180.0,
                            color: Colors.green,
                          ),
                          CurrencyTextField(
                            label: "Reais",
                            prefix: "R\$ ",
                            controller: realController,
                            onChanged: _realChanged,
                          ),
                          const SizedBox(height: 15.0), // Espaçamento entre os campos
                          CurrencyTextField(
                            label: "Dólares",
                            prefix: "US\$ ",
                            controller: dolarController,
                            onChanged: _dolarChanged,
                          ),
                          const SizedBox(height: 15.0), // Espaçamento entre os campos
                          CurrencyTextField(
                            label: "Euros",
                            prefix: "€ ",
                            controller: euroController,
                            onChanged: _euroChanged,
                          ),
                          const SizedBox(height: 15.0), // Espaçamento entre os campos
                          CurrencyTextField(
                            label: "Bitcoin",
                            prefix: "BTC ",
                            controller: bitcoinController,
                            onChanged: _bitcoinChanged,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
          }
        },
      ),
    );
  }
}
