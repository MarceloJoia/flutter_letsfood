import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../models/Category.dart';
import '../../models/Food.dart';
import '../../models/Restaurant.dart';
import '../foods/widgets/Categories.dart';
import '../../widgets/food_card.dart';
import '../../widgets/flutter_bottom_navigator.dart';
import '../../stores/foods.store.dart';
import '../../stores/categories.store.dart';
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
  //Recupera as categorias
  CategoriesStore storeCategories = new CategoriesStore();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    RouteSettings settings =
        ModalRoute.of(context).settings; // Pegar as configurações de rota
    _restaurant = settings.arguments; // agora pego o valor do arguments

    storeCategories.getCategories(_restaurant.uuid); //Carregar Categories
    storeFoods.getFoods(_restaurant.uuid); // Pega todas as comidas
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
        Observer(builder: (context) {
          return storeCategories.isLoading
              ? CustomCircularProgressIndicator(
                  textLabel: 'Carregando as categorias...')
              : storeCategories.categories.length == 0
                  ? Center(
                      child: Text(
                        'Nenhuma categoria encontrada!',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 18),
                      ),
                    )
                  : Categories(storeCategories.categories);
        }),
        Observer(
          builder: (context) {
            return storeFoods.isLoading
                ? CustomCircularProgressIndicator(
                    textLabel: 'Carregando os produtos...',
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
            food: food,
          );
        },
      ),
    );
  }
}
