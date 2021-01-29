import 'dart:convert';

import './Food.dart';
import './Evaluation.dart';

class Order {
  // Definir propriedades de nossa classe, o que o Order vai ter.
  String identify;
  String date;
  String status;
  String table;
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
      this.table,
      this.total,
      this.comment,
      this.foods,
      this.evaluations});

  // Criar um "metodo factory", para criar um "Objeto" do Order atraves de um "Json"
  factory Order.fromJson(jsonData) {
    return Order(
      identify: jsonData['identify'],
      date: jsonData['date'],
      status: jsonData['status'],
      table: jsonData['table'],
      total: double.parse(jsonData['total']),
      comment: jsonData['comment'],
      foods: jsonData['foods'],
      evaluations: jsonData['evaluations'],
    );
  }

  // Metodo que devolve o valor convertido para Json
  toJson() {
    return jsonEncode({
      'identify': identify,
      'date': date,
      'status': status,
      'table': table,
      'total': total,
      'comment': comment,
      'foods': foods,
      'evaluations': evaluations,
    });
  }
}
