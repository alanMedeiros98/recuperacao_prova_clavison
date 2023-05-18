import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../classes/final.dart';
import '../componentes/botao.dart';
import '../componentes/container.dart';

class TelaBitcoin extends StatefulWidget {
  const TelaBitcoin({super.key});

  @override
  State<TelaBitcoin> createState() => _TelaBitcoinState();
}

class _TelaBitcoinState extends State<TelaBitcoin> {

  proximo(){
    Navigator.of(context).pushReplacementNamed('/telaMoedas');
  }

  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments as Final;

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
              'BitCoin',
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
                              nome: 'Blockchain.info',
                              valor: '${args.bitCoin!.block!.valor.toStringAsFixed(2)}',
                              variacao: args.bitCoin!.block!.variacao,
                            ),
                            ColocarContainer(
                              nome: 'BitStamp',
                              valor: '${args.bitCoin!.bitStamp!.valor.toStringAsFixed(2)}',
                              variacao: args.bitCoin!.bitStamp!.variacao,
                            ),
                            ColocarContainer(
                              nome: 'Mercado Bitcoin',
                              valor: '${args.bitCoin!.merBitcoin!.valor.toStringAsFixed(2)}',
                              variacao: args.bitCoin!.merBitcoin!.variacao,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          children: [
                            ColocarContainer(
                              nome: 'Coinbase',
                              valor: '${args.bitCoin!.coinBase!.valor.toStringAsFixed(2)}',
                              variacao: args.bitCoin!.coinBase!.variacao,
                            ),
                            ColocarContainer(
                              nome: 'FoxBit',
                              valor: '${args.bitCoin!.foxBit!.valor.toStringAsFixed(2)}',
                              variacao: args.bitCoin!.foxBit!.variacao,
                            ),
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
            texto: 'Página Principal',
            corFonte: Colors.white,
            corFundo: const Color.fromARGB(255, 0, 71, 2),
            funcao: proximo,
          ),
        ],
      ),
    );
  }
}
