import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:recuperacao_prova_clavison/classes/final.dart';

import '../componentes/botao.dart';
import '../componentes/container.dart';

class TelaAcoes extends StatefulWidget {

  const TelaAcoes({super.key,});

  @override
  State<TelaAcoes> createState() => _TelaAcoesState();
}

class _TelaAcoesState extends State<TelaAcoes> {

  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments as Final;

    Final total = Final(args.moedas, args.acoes, args.bitCoin);

  proximo(){
    Navigator.of(context).pushNamed('/telaBitcoin', arguments: total);
  }

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
              'Ações',
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
                              nome: 'IBOVESPA',
                              valor: '${args.acoes!.ibovespa!.valor.toStringAsFixed(2)}',
                              variacao: args.acoes!.ibovespa!.variacao,
                            ),
                            ColocarContainer(
                              nome: 'NASDAQ',
                              valor: '${args.acoes!.nasdaq!.valor.toStringAsFixed(2)}',
                              variacao: args.acoes!.nasdaq!.variacao,
                            ),
                            ColocarContainer(
                              nome: 'CAC',
                              valor: '${args.acoes!.cac!.valor.toStringAsFixed(2)}',
                              variacao: args.acoes!.cac!.variacao,
                            ),
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
                              nome: 'IFIX',
                              valor: '${args.acoes!.ifix!.valor.toStringAsFixed(2)}',
                              variacao: args.acoes!.ifix!.variacao,
                            ),
                            ColocarContainer(
                              nome: 'DOWJONES',
                              valor: '${args.acoes!.dowjones!.valor.toStringAsFixed(2)}',
                              variacao: args.acoes!.dowjones!.variacao,
                            ),
                            ColocarContainer(
                              nome: 'NIKKEI',
                              valor: '${args.acoes!.nikkei!.valor.toStringAsFixed(2)}',
                              variacao: args.acoes!.nikkei!.variacao,
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
            texto: 'Ir para Bitcoin',
            corFonte: Colors.white,
            corFundo: const Color.fromARGB(255, 0, 71, 2),
            funcao: proximo,
          ),
        ],
      ),
    );
  }
}
