import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';
import './resultado.dart';

void main() {
  runApp(AulaComponentes());
}

class AulaComponentes extends StatefulWidget {
  @override
  _AulaComponentesState createState() => _AulaComponentesState();
}

class _AulaComponentesState extends State<AulaComponentes> {
  var perguntaAtual = 0;
  var cor = Colors.white;

  final List<Map<String, Object>> questionario = [
    {
      "pergunta": "Qual a sua cor favorita?",
      "respostas": ["Amarelo", "Preto", "Branco", "Azul", "Vermelho"]
    },
    {
      "pergunta": "Qual é seu animal favorito?",
      "respostas": ["Cachorro", "Gato", "Tartaruga", "Periquito"]
    },
    {
      "pergunta": "Qual sua linguagem favorita?",
      "respostas": ["Python", "Java", "JavaScript"]
    },
  ];

  List<String> respostasSelecionadas = [];

  bool get temPergunta {
    return perguntaAtual < questionario.length;
  }

  void acao(String resposta) {
    setState(() {
      respostasSelecionadas.add(resposta);
      perguntaAtual++;
    });
    print(perguntaAtual);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> respostas = [];

    if (temPergunta) {
      if (questionario[perguntaAtual]["respostas"] is List<String>) {
        for (var resposta
            in questionario[perguntaAtual]["respostas"] as List<String>) {
          respostas.add(
            Resposta(resposta, () => acao(resposta)),
          );
        }
      }
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: temPergunta
              ? Questao(questionario[perguntaAtual]["pergunta"].toString())
              : Questao("Terminou"),
        ),
        body: temPergunta
            ? Column(
                children: [
                  ...respostas,
                ],
              )
            : Resultado(respostasSelecionadas),
      ),
    );
  }
}
