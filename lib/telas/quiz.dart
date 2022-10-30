import 'package:flutter/material.dart';
import 'package:quiz_app/telas/pontuacao.dart';
import '../controller/questao_controller.dart';
import '../model/questao.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  ValueNotifier<int> _counterAlter = ValueNotifier<int>(0);
  ValueNotifier<int> _counterPage = ValueNotifier<int>(0);
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
      child: ListView(
        children: [buildCardQuestao(), buildBotoesControle()],
      ),
    );
  }

  buildCardQuestao() {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
            child: Container(
          height: 380,
          width: 350,
          decoration: BoxDecoration(
              border: Border.all(
            width: 2,
            color: Colors.black,
          )),
          child: buildQuestaoAlternativas(),
        )));
  }

  buildQuestaoAlternativas() {
    return ValueListenableBuilder<int>(
      builder: (context, value, child) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Text('Questão ${controller.numeroQuestao + 1}',
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Colors.black)),
            const SizedBox(height: 15),
            Text(questoes[controller.numeroQuestao].questao!,
                style: Theme.of(context).textTheme.headline6),
            const SizedBox(height: 15),
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ListView.separated(
                      itemCount: questoes.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 30),
                      itemBuilder: ((context, index) {
                        return buildAlternativa(
                            index,
                            questoes[controller.numeroQuestao].opcoes![index],
                            null);
                      }))),
            )
          ])),
      valueListenable: _counterPage,
    );
  }

  buildAlternativa(int indice, String texto, Icon? icone) {
    var numAlter = indice + 1;
    return GestureDetector(
        onTap: () {
          if (!controller.estaRespondida) {
            var indQuestao = controller.numeroQuestao;
            var acertou = controller.checarResp(questoes[indQuestao], indice);
            if (acertou == true) {
              icone =
                  const Icon(Icons.check_circle_outline, color: Colors.green);
              _counterAlter.value += 1;
            } else {
              icone = const Icon(Icons.close, color: Colors.red);
              _counterAlter.value += 1;
            }
          }
        },
        child: ValueListenableBuilder<int>(
          builder: (context, value, child) => Container(
            height: 35,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2)),
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
          valueListenable: _counterAlter,
        ));
  }

  buildBotoesControle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {
              controller.antQuestao();
              _counterPage.value++;
            },
            icon: const Icon(Icons.arrow_back)),
        IconButton(
            onPressed: () {
              if (controller.numeroQuestao == 3) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Pontuacao(
                        numRespCorretas: controller.numeroRespCorretas),
                  ),
                );
              }
              controller.proxQuestao();
              _counterPage.value++;
            },
            icon: const Icon(Icons.arrow_forward))
      ],
    );
  }
}
