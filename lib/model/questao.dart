class Questao {
  final int? id, resposta;
  final String? questao;
  final List<String>? opcoes;
  final List dadosTeste = [
    {
      "id": 1,
      "questao":
          "Flutter is an open-source UI software development kit created by ______",
      "opcoes": ['Apple', 'Google', 'Facebook', 'Microsoft'],
      "resposta_index": 1,
    },
    {
      "id": 2,
      "questao": "When google release Flutter.",
      "opcoes": ['Jun 2017', 'Jun 2017', 'May 2017', 'May 2018'],
      "resposta_index": 2,
    },
    {
      "id": 3,
      "questao": "A memory location that holds a single letter or number.",
      "opcoes": ['Double', 'Int', 'Char', 'Word'],
      "resposta_index": 2,
    },
    {
      "id": 4,
      "questao": "What command do you use to output data to the screen?",
      "opcoes": ['Cin', 'Count>>', 'Cout', 'Output>>'],
      "resposta_index": 2,
    },
  ];
  Questao({this.id, this.questao, this.resposta, this.opcoes});
}
