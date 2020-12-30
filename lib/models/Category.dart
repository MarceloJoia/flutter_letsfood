import 'dart:convert';

class Category {
  // Definir propriedades de nossa classe, o que o Category vai ter.
  String identify;
  String name;
  String description;

  /* Criando um construtor par nossa model **
   * Category({});  Não é obrigatório passar todos os parâmetros
   * Category();    Todos os parâmetros são obrigatórios
   */
  Category({this.identify, this.name, this.description});

  // Criar um "metodo factory", para criar um "Objeto" do Category atraves de um "Json"
  factory Category.fromJson(jsonData) {
    return Category(
      identify: jsonData['identify'],
      name: jsonData['name'],
      description: jsonData['description'],
    );
  }

  // Metodo que devolve o valor convertido para Json
  toJson() {
    return jsonEncode({
      'identify': identify,
      'name': name,
      'description': description,
    });
  }
}
