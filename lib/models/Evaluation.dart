import 'dart:convert';

class Evaluation {
  // Definir propriedades de nossa classe, o que o Evaluation vai ter.
  String nameUser;
  String comment;
  double stars;

  /* Criando um construtor par nossa model **
   * Evaluation({});  Não é obrigatório passar todos os parâmetros
   * Evaluation();    Todos os parâmetros são obrigatórios
   */
  Evaluation({this.nameUser, this.comment, this.stars});

  // Criar um "metodo factory", para criar um "Objeto" do Evaluation atraves de um "Json"
  factory Evaluation.fromJson(jsonData) {
    return Evaluation(
      nameUser: jsonData['nameUser'],
      comment: jsonData['comment'],
      stars: jsonData['stars'],
    );
  }

  // Metodo que devolve o valor convertido para Json
  toJson() {
    return jsonEncode({
      'nameUser': nameUser,
      'comment': comment,
      'stars': stars,
    });
  }
}
