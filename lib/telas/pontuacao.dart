import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Pontuacao extends StatefulWidget {
  final int numRespCorretas;
  const Pontuacao({super.key, required this.numRespCorretas});

  @override
  State<Pontuacao> createState() => _PontuacaoState();
}

class _PontuacaoState extends State<Pontuacao> {
  int get numRespCorretas => widget.numRespCorretas;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Jogo de quiz')),
      ),
      body: Center(
          child: Text(
        'Pontuação: ${numRespCorretas * 10}',
        style: Theme.of(context)
            .textTheme
            .headline3!
            .copyWith(color: Colors.black),
      )),
    );
  }
}
