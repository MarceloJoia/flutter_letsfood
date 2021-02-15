import 'package:flutter/material.dart';

import '../../models/Category.dart';
import '../../models/Food.dart';
import '../../models/Restaurant.dart';
import '../foods/widgets/Categories.dart';
import '../../widgets/food_card.dart';
import '../../widgets/flutter_bottom_navigator.dart';

class FoodsScreen extends StatefulWidget {
  FoodsScreen({Key key}) : super(key: key);

  @override
  _FoodsScreenState createState() => _FoodsScreenState();
}

class _FoodsScreenState extends State<FoodsScreen> {
  // Recuperar os restaurantes
  Restaurant _restaurant;

  // Declarar propriedades das listas
  List<Category> _categories = [
    // construir a lista de categorias
    Category(
      name: 'Salgadinho',
      description: 'Descrição do Salgadinho',
      identify: '908ghg35cgasvcs',
    ),
    Category(
      name: 'Bolo Gelado',
      description: 'Descrição do Bolo gelado',
      identify: '24342hg35cgasvcs',
    ),
    Category(
      name: 'Suco de Uva',
      description: 'Descrição do Suco de Uva',
      identify: 'ghfgwewewewrgasvcs',
    ),
    Category(
      name: 'Farofa de Açaí',
      description: 'Descrição do Farofa de Açaí',
      identify: 'ghfgsdfsdf35cgasvcs',
    ),
  ];

  List<Food> _foods = [
    Food(
      identify: '658gvd889sdf',
      title: 'Bolo de Cereja',
      image:
          'https://casadocaminhosc.com.br/wp-content/uploads/2020/12/imagem-Talharim.jpg',
      description: 'Descrição do Bolo de Cereja',
      price: '12.89',
    ),
    Food(
      identify: 'g9474gvd889sdf',
      title: 'Torta de Maracuja',
      image:
          'https://casadocaminhosc.com.br/wp-content/uploads/2020/12/imagem-Talharim.jpg',
      description: 'Descrição do Torta de Maracuja',
      price: '52.51',
    ),
    Food(
      identify: '394gvd889sdf',
      title: 'Sanduiche Natural',
      image:
          'https://casadocaminhosc.com.br/wp-content/uploads/2020/12/imagem-Talharim.jpg',
      description: 'Descrição do Sanduiche Natural',
      price: '18.90',
    ),
    Food(
      identify: '394gvd889sdf',
      title: 'Sanduiche Natural',
      image:
          'https://casadocaminhosc.com.br/wp-content/uploads/2020/12/imagem-Talharim.jpg',
      description: 'Descrição do Sanduiche Natural',
      price: '18.90',
    ),
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Pegar as configurações de rota
    RouteSettings settings = ModalRoute.of(context).settings;
    // agora pego o valor do arguments
    _restaurant = settings.arguments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${_restaurant.name}'),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: _buildScreeen(),
      bottomNavigationBar: FlutterFoodBottomNavigator(0),
    );
  }

  Widget _buildScreeen() {
    return Column(
      children: <Widget>[Categories(_categories), _buildfood()],
    );
  }

  Widget _buildfood() {
    return Container(
      // Pegar a altura total
      height: MediaQuery.of(context).size.height - 196,
      width: MediaQuery.of(context).size.width,
      //color: Colors.black,

      ///Construir a lista
      child: ListView.builder(
        itemCount: _foods.length,
        itemBuilder: (context, index) {
          // Armazenar em um Objeto
          final Food food = _foods[index];
          return FoodCard(
            identify: food.identify,
            description: food.description,
            image: food.image,
            price: food.price,
            title: food.title,
            notShowIconCart: false,
          );
        },
      ),
    );
  }
}
