import 'package:quiz_app/model/questao.dart';

class QuestaoController {
  static final QuestaoController _questaoController =
      QuestaoController._internal();

  factory QuestaoController() {
    return _questaoController;
  }
  QuestaoController._internal();
  final List<Questao> questoes = Questao()
      .dadosTeste
      .map(
        (questao) => Questao(
            id: questao['id'],
            questao: questao['questao'],
            opcoes: questao['opcoes'],
            resposta: questao['resposta_index']),
      )
      .toList();

  bool _estaRespondida = false;
  bool get estaRespondida => _estaRespondida;

  int _respostaCorreta = -1;
  int get respostaCorreta => _respostaCorreta;

  int _respostaSelecionada = -1;
  int get respostaSelecionada => _respostaSelecionada;

  int _numeroQuestao = 0;
  int get numeroQuestao => _numeroQuestao;

  int _numeroRespCorretas = 0;
  int get numeroRespCorretas => _numeroRespCorretas;

  bool checarResp(Questao questao, int indSelecionado) {
    _estaRespondida = true;
    _respostaCorreta = questao.resposta!;
    _respostaSelecionada = indSelecionado;
    if (_respostaCorreta == _respostaSelecionada) {
      _numeroRespCorretas++;
      return true;
    }
    return false;
  }

  void proxQuestao() {
    if (_numeroQuestao < 3) {
      _numeroQuestao++;
      _estaRespondida = false;
    }
  }

  void antQuestao() {
    if (numeroQuestao != 0) {
      _numeroQuestao--;
      _estaRespondida = false;
      if (_numeroRespCorretas == 0) {
      } else {
        _numeroRespCorretas--;
      }
    }
  }
}
