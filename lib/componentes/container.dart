import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

import '../classes/final.dart';
import '../classes/item.dart';

class ColocarContainer extends StatefulWidget {
  final String? nome;
  final String? valor;
  final double? variacao;

  const ColocarContainer({super.key, this.nome, this.valor, this.variacao});

  @override
  State<ColocarContainer> createState() => _ColocarContainerState();
}

class _ColocarContainerState extends State<ColocarContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
          children: [
            Row(
              children: [
                Text('${widget.nome}',
                  style: const TextStyle(
                    fontSize: 17,
                    color: Color.fromARGB(255, 119, 119, 119),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text('${widget.valor}',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(width: 5),
                Container(
                  decoration: BoxDecoration(
                    color: widget.variacao! < 0 ? Colors.red : Colors.blue,
                    borderRadius: BorderRadius.circular(5.0)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text('${widget.variacao}',
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
    );
  }
}
