import 'dart:convert';

import './Food.dart';
import './Evaluation.dart';

class Order {
  // Definir propriedades de nossa classe, o que o Order vai ter.
  String identify;
  String date;
  String status;
  double total;
  String comment;
  List<Food> foods;
  List<Evaluation> evaluations;

  /* Criando um construtor par nossa model **
   * Order({});  Não é obrigatório passar todos os parâmetros
   * Order();    Todos os parâmetros são obrigatórios
   */
  Order(
      {this.identify,
      this.date,
      this.status,
      this.total,
      this.comment,
      this.foods,
      this.evaluations});

  // Criar um "metodo factory", para criar um "Objeto" do Order atraves de um "Json"
  factory Order.fromJson(jsonData) {
    List<Food> _foodsApi = (jsonData['products'] as List)
        .map((food) => Food.fromJson(food))
        .toList();

    List<Evaluation> _evaluationsApi = (jsonData['evaluations'] as List)
        .map((evaluation) => Evaluation.fromJson(evaluation))
        .toList();

    return Order(
      identify: jsonData['identify'],
      date: jsonData['date'],
      status: jsonData['status'],
      total: double.parse(jsonData['total'].toString()),
      comment: jsonData['comment'],
      foods: _foodsApi,
      evaluations: _evaluationsApi,
    );
  }

  // Metodo que devolve o valor convertido para Json
  toJson() {
    return jsonEncode({
      'identify': identify,
      'date': date,
      'status': status,
      'total': total,
      'comment': comment,
      'foods': foods,
      'evaluations': evaluations,
    });
  }
}
