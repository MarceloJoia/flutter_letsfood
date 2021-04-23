import 'dart:convert';

import '../models/User.dart';

class Evaluation {
  // Definir propriedades de nossa classe, o que o Evaluation vai ter.
  User user;
  String comment;
  double stars;

  /* Criando um construtor par nossa model **
   * Evaluation({});  Não é obrigatório passar todos os parâmetros
   * Evaluation();    Todos os parâmetros são obrigatórios
   */
  Evaluation({this.user, this.comment, this.stars});

  // Criar um "metodo factory", para criar um "Objeto" do Evaluation atraves de um "Json"
  factory Evaluation.fromJson(jsonData) {
    return Evaluation(
      user: User.fromJson(jsonData['client']),
      comment: jsonData['comment'],
      stars: double.parse(jsonData['stars'].toString()),
    );
  }

  // Metodo que devolve o valor convertido para Json
  toJson() {
    return jsonEncode({
      'user': user,
      'comment': comment,
      'stars': stars,
    });
  }
}
