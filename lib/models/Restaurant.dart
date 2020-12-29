import 'dart:convert';

class Restaurant {
  // Definir propriedades de nossa classe, o que o restaurante vai ter.
  String uuid;
  String name;
  String image;
  String contact;

  /* Criando um construtor par nossa model **
   * Restaurant({});  Não é obrigatório passar todos os parâmetros
   * Restaurant();    Todos os parâmetros são obrigatórios
   */
  Restaurant({this.uuid, this.name, this.image, this.contact});

  // Criar um "metodo factory", para criar um "Objeto" do Restaurante atraves de um "Json"
  factory Restaurant.fromJson(jsonData) {
    return Restaurant(
      uuid: jsonData['uuid'],
      name: jsonData['name'],
      image: jsonData['image'],
      contact: jsonData['contact'],
    );
  }

  // Metodo que devolve o valor convertido para Json
  toJson() {
    return jsonEncode({
      'uuid': uuid,
      'name': name,
      'image': image,
      'contact': contact,
    });
  }
}
