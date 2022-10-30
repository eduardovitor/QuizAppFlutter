import 'package:flutter/material.dart';
import 'package:quiz_app/telas/quiz.dart';

class BoasVindas extends StatefulWidget {
  const BoasVindas({super.key});

  @override
  State<BoasVindas> createState() => _BoasVindasState();
}

class _BoasVindasState extends State<BoasVindas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Jogo de quiz')),
      ),
      body: buildBody(context),
    );
  }
}

buildBody(BuildContext context) {
  return SafeArea(
      child: Center(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Spacer(), // Estudar mais sobre esse tal de Spacer
          Text("Vamos jogar Quiz",
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Colors.black)),
          const Spacer(),
          Text("Digite as suas informações abaixo",
              style: Theme.of(context).textTheme.titleSmall),
          const Spacer(),
          buildInputNome(),
          const Spacer(),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  backgroundColor: Colors.teal),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Quiz(),
                  ),
                );
              },
              child: const Text('Iniciar quiz')),
          const Spacer(flex: 2)
        ],
      ),
    ),
  ));
}

buildInputNome() {
  return const SizedBox(
    width: double.infinity,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Digite o seu nome',
          border: OutlineInputBorder(borderRadius: BorderRadius.zero),
        ),
      ),
    ),
  );
}
