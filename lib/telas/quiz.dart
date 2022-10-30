import 'package:flutter/material.dart';
import '../controller/questao_controller.dart';
import '../model/questao.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  late List<Questao> questoes;
  QuestaoController controller = QuestaoController();
  @override
  void initState() {
    questoes = QuestaoController().questoes;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Center(child: Text('Jogo de quiz'))),
        body: buildBody());
  }

  buildBody() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Center(
              child: Container(
                  height: 380,
                  width: 350,
                  decoration: BoxDecoration(
                      border: Border.all(
                    width: 2,
                    color: Colors.black,
                  )),
                  child: buildQuestaoAlternativas()),
            ),
          ],
        ),
      ),
    );
  }

  buildQuestaoAlternativas() {
    var numQuestao = controller.numeroQuestao;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text('Questão $numQuestao',
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Colors.black)),
          const SizedBox(height: 15),
          Text(questoes[numQuestao - 1].questao!,
              style: Theme.of(context).textTheme.headline6),
          const SizedBox(height: 15),
          Expanded(
            child: ListView.separated(
                itemCount: questoes.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 30),
                itemBuilder: ((context, index) {
                  return buildAlternativa(
                      index, questoes[numQuestao - 1].opcoes![index], null);
                })),
          )
        ],
      ),
    );
  }

  buildAlternativa(int indice, String texto, Icon? icone) {
    var numAlter = indice + 1;
    return GestureDetector(
      child: Container(
        height: 35,
        decoration:
            BoxDecoration(border: Border.all(color: Colors.black, width: 2)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('$numAlter) $texto'),
              icone ?? const Icon(Icons.check_box_outline_blank_rounded)
            ],
          ),
        ),
      ),
    );
  }
}
