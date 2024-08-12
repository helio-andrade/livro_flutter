import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fetch_client/fetch_client.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

Future<Map> getData() async {
  final Uri request = Uri.parse('https://economia.awesomeapi.com.br/last/USD-BRL,EUR-BRL,BTC-BRL');
  http.Client client;

  if (kIsWeb) {
    // Para a web, usa FetchClient
    client = FetchClient(mode: RequestMode.cors);
  } else {
    // Para outras plataformas, usa http.Client
    client = http.Client();
  }

  final response = await client.get(request);
  return json.decode(response.body);
}
