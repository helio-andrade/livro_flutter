import 'package:flutter/material.dart';
import 'package:qrcode_reader/qrcode_reader.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Method to capture a QR code
  void _captureQR() {
    Future<String> futureString = QRCodeReader().scan();
    futureString.then((qrText) {
      _showDialog(qrText);
    });
  }

  // Method to show a dialog with the scanned QR code text
  void _showDialog(final String qrText) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Texto do QR Code"),
          content: Text(qrText),
          actions: <Widget>[
            TextButton(
              child: Text("Fechar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // The build method for the MyHomePage widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('Ler QR Code'),
              onPressed: () {
                _captureQR();
              },
            )
          ],
        ),
      ),
    );
  }
}
