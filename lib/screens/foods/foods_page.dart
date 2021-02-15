import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../models/Category.dart';
import '../../models/Food.dart';
import '../../models/Restaurant.dart';
import '../foods/widgets/Categories.dart';
import '../../widgets/food_card.dart';
import '../../widgets/flutter_bottom_navigator.dart';
import '../../stores/foods.store.dart';
import '../../widgets/custom_circular_progress_indicator.dart';

class FoodsScreen extends StatefulWidget {
  FoodsScreen({Key key}) : super(key: key);

  @override
  _FoodsScreenState createState() => _FoodsScreenState();
}

class _FoodsScreenState extends State<FoodsScreen> {
  // Recuperar os restaurantes
  Restaurant _restaurant;
  // Recuper Foods
  FoodsStare storeFoods = new FoodsStare();

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

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Pegar as configurações de rota
    RouteSettings settings = ModalRoute.of(context).settings;
    // agora pego o valor do arguments
    _restaurant = settings.arguments;
    // Pega todas as comidas desse restaurante
    storeFoods.getFoods(_restaurant.uuid);
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
      children: <Widget>[
        Categories(_categories),
        Observer(
          builder: (context) {
            return storeFoods.isLoading
                ? CustomCircularProgressIndicator(
                    textLabel: 'Carregando os produtos',
                  )
                : storeFoods.foods.length == 0
                    ? Center(
                        child: Text(
                          'Nenhum produto encontrado!',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 18),
                        ),
                      )
                    : _buildfood();
          },
        ),
      ],
    );
  }

  Widget _buildfood() {
    return Container(
      // Pegar a altura total
      height: (MediaQuery.of(context).size.height - 196),
      width: MediaQuery.of(context).size.width,
      //color: Colors.black,

      ///Construir a lista
      child: ListView.builder(
        itemCount: storeFoods.foods.length,
        itemBuilder: (context, index) {
          final Food food = storeFoods.foods[index];

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
