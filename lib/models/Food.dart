import 'dart:convert';

class Food {
  // Definir propriedades de nossa classe, o que o Food vai ter.
  String identify;
  String title;
  String description;
  String price;
  String image;

  /* Criando um construtor par nossa model **
   * Food({});  Não é obrigatório passar todos os parâmetros
   * Food();    Todos os parâmetros são obrigatórios
   */
  Food({this.identify, this.title, this.description, this.price, this.image});

  // Criar um "metodo factory", para criar um "Objeto" do Food atraves de um "Json"
  factory Food.fromJson(jsonData) {
    return Food(
      identify: jsonData['identify'],
      title: jsonData['title'],
      description: jsonData['description'],
      price: jsonData['price'],
      image: jsonData['image'],
    );
  }

  // Metodo que devolve o valor convertido para Json
  toJson() {
    return jsonEncode({
      'identify': identify,
      'title': title,
      'description': description,
      'price': price,
      'image': image,
    });
  }
}
