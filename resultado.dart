
import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final List<String> respostasSelecionadas;

  Resultado(this.respostasSelecionadas);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Respostas selecionadas:",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: respostasSelecionadas.map((resposta) {
              return Text(
                resposta,
                style: TextStyle(fontSize: 16),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
