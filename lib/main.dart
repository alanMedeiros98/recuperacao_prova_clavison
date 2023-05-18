import 'package:recuperacao_prova_clavison/telas/tela_acoes.dart';
import 'package:recuperacao_prova_clavison/telas/tela_bitcoin.dart';
import 'package:recuperacao_prova_clavison/telas/tela_moedas.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/telaMoedas',
      routes: {
        '/telaMoedas': (context) => TelaMoedas(),
        '/telaAcoes': (context) => TelaAcoes(),
        '/telaBitcoin': (context) => TelaBitcoin(),
      },
    );
  }
}
