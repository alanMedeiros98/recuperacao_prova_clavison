import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart';
import 'package:recuperacao_prova_clavison/classes/acoes.dart';
import 'package:recuperacao_prova_clavison/classes/bitcoin.dart';
import 'package:recuperacao_prova_clavison/componentes/botao.dart';
import 'package:recuperacao_prova_clavison/componentes/container.dart';

import '../classes/final.dart';
import '../classes/item.dart';
import '../classes/moedas.dart';

class TelaMoedas extends StatefulWidget {
  const TelaMoedas({super.key});

  @override
  State<TelaMoedas> createState() => _TelaMoedasState();
}

class _TelaMoedasState extends State<TelaMoedas> {

  Item? dolar;
  Item? euro;
  Item? peso;
  Item? yen;

  Item? ibovespa;
  Item? nasdaq;
  Item? cac;
  Item? ifix;
  Item? dowjones;
  Item? nikkei;

  Item? block;
  Item? bit;
  Item? mer;
  Item? coinBase;
  Item? foxBit;

  Moedas? moedas;
  Acoes? acoes;
  Bitcoin? bitCoin;

  Final? total;

  hgFinance() async {
    const String urlHgFinance = 'https://api.hgbrasil.com/finance?format=json-cors&key=d59eb2d1';
    Response resposta = await get(Uri.parse(urlHgFinance));
    Map resp = json.decode(resposta.body);
    
    setState(() {
      dolar = Item('Dólar', resp['results']['currencies']['USD']['buy'], resp['results']['currencies']['USD']['variation']);
      euro = Item('Euro', resp['results']['currencies']['EUR']['buy'], resp['results']['currencies']['EUR']['variation']);
      peso = Item('Peso', resp['results']['currencies']['ARS']['buy'], resp['results']['currencies']['ARS']['variation']);
      yen = Item('Yen', resp['results']['currencies']['JPY']['buy'], resp['results']['currencies']['JPY']['variation']);

      ibovespa = Item('IBOVESPA', resp['results']['stocks']['IBOVESPA']['points'], resp['results']['stocks']['IBOVESPA']['variation']);
      nasdaq = Item('NASDAQ', resp['results']['stocks']['NASDAQ']['points'], resp['results']['stocks']['NASDAQ']['variation']);
      cac = Item('CAC', resp['results']['stocks']['CAC']['points'], resp['results']['stocks']['CAC']['variation']);
      ifix = Item('IFIX', resp['results']['stocks']['IFIX']['points'], resp['results']['stocks']['IFIX']['variation']);
      dowjones = Item('DOWJONES', resp['results']['stocks']['DOWJONES']['points'], resp['results']['stocks']['DOWJONES']['variation']);
      nikkei = Item('NIKKEI', resp['results']['stocks']['NIKKEI']['points'], resp['results']['stocks']['NIKKEI']['variation']);

      block = Item('Blockchain.info', resp['results']['bitcoin']['blockchain_info']['buy'], resp['results']['bitcoin']['blockchain_info']['variation']);
      bit = Item('BitStamp', resp['results']['bitcoin']['bitstamp']['buy'], resp['results']['bitcoin']['bitstamp']['variation']);
      mer = Item('Mercado Bitcoin', resp['results']['bitcoin']['mercadobitcoin']['buy'], resp['results']['bitcoin']['mercadobitcoin']['variation']);
      coinBase = Item('Coinbase', resp['results']['bitcoin']['coinbase']['last'], resp['results']['bitcoin']['coinbase']['variation']);
      foxBit = Item('FoxBit', resp['results']['bitcoin']['foxbit']['last'], resp['results']['bitcoin']['foxbit']['variation']);

      moedas = Moedas(dolar, euro, peso, yen);
      acoes = Acoes(ibovespa, nasdaq, cac, ifix, dowjones, nikkei);
      bitCoin = Bitcoin(block, bit, mer, coinBase, foxBit);

      total = Final(moedas, acoes, bitCoin);
    });
  }

  proximo(){
    Navigator.of(context).pushNamed('/telaAcoes', arguments: total);
  }

  @override
  Widget build(BuildContext context) {
    hgFinance();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Finanças de Hoje',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 71, 2),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top:20.0, bottom: 30),
            child: Text(
              'MOEDAS',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
              border: Border.all(
                  color:  const Color.fromARGB(255, 87, 86, 86), width: 2.0),
              borderRadius: BorderRadius.circular(15.0)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Column(
                          children: [
                            ColocarContainer(
                              nome: 'Dólar',
                              valor: '${dolar!.valor.toStringAsFixed(4)}',
                              variacao: dolar!.variacao,
                            ),
                            ColocarContainer(
                              nome: 'Peso',
                              valor: '${peso!.valor.toStringAsFixed(4)}',
                              variacao: peso!.variacao,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Column(
                          children: [
                            ColocarContainer(
                              nome: 'Euro',
                              valor: '${euro!.valor.toStringAsFixed(4)}',
                              variacao: euro!.variacao,
                            ),
                            ColocarContainer(
                              nome: 'Yen',
                              valor: '${yen!.valor.toStringAsFixed(4)}',
                              variacao: yen!.variacao,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          ColocarBotao(
            texto: 'Ir para Ações',
            corFonte: Colors.white,
            corFundo: const Color.fromARGB(255, 0, 71, 2),
            funcao: proximo,
          ),
        ],
      ),
    );
  }
}
