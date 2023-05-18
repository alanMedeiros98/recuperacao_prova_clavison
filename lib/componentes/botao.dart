import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ColocarBotao extends StatefulWidget {

  final texto;
  final corFonte;
  final corFundo;
  final funcao;

  const ColocarBotao({super.key, this.texto, this.corFonte, this.corFundo, this.funcao});

  @override
  State<ColocarBotao> createState() => _ColocarBotaoState();
}

class _ColocarBotaoState extends State<ColocarBotao> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 450),
      child: Center(
          child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: widget.corFonte,
          backgroundColor: widget.corFundo,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          minimumSize: const Size(100, 50),
        ),
        onPressed: widget.funcao,
        child: Text(widget.texto),
      )),
    );
  }
}