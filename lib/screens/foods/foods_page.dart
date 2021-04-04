import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../models/Food.dart';
import '../../models/Restaurant.dart';
import '../foods/widgets/Categories.dart';
import '../../widgets/food_card.dart';
import '../../widgets/flutter_bottom_navigator.dart';
import '../../stores/foods.store.dart';
import '../../stores/categories.store.dart';
import '../../stores/restaurant.store.dart';
import '../../widgets/custom_circular_progress_indicator.dart';

class FoodsScreen extends StatefulWidget {
  FoodsScreen({Key key}) : super(key: key);

  @override
  _FoodsScreenState createState() => _FoodsScreenState();
}

class _FoodsScreenState extends State<FoodsScreen> {
  Restaurant _restaurant;

  //FoodsStore storeFoods = new FoodsStore();
  FoodsStore storeFoods;
  CategoriesStore storeCategories;
  RestaurantsStore storeRestaurants;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    storeFoods = Provider.of<FoodsStore>(context);
    storeCategories = Provider.of<CategoriesStore>(context);
    storeRestaurants = Provider.of<RestaurantsStore>(context);

    RouteSettings settings =
        ModalRoute.of(context).settings; // Pegar as configurações de rota
    _restaurant = settings.arguments; // agora pego o valor do arguments

    storeRestaurants.setRestaurant(_restaurant);
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
      height: (MediaQuery.of(context).size.height - 226),
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
