import 'package:mobx/mobx.dart';

import '../models/Food.dart';
import '../data/network/repositories/food_repository.dart';

part 'foods.store.g.dart';

class FoodsStore = _FoodsStoreBase with _$FoodsStore;

abstract class _FoodsStoreBase with Store {
  // Instanciar o Repository
  FoodRepository _repository;
  // Construtor
  _FoodsStoreBase() {
    _repository = new FoodRepository();
  }

  // Essa propriedade é um observer "@observable"
  @observable
  ObservableList<Food> foods = ObservableList<Food>();

  /**
   * Cart itens do carrinho
   */
  @observable
  //ObservableList<Food> cartItems = ObservableList<Food>();
  List<Map<String, dynamic>> cartItems = [];

  @observable
  double totalCart = 0;

  // Preload
  @observable
  bool isLoading = false;

  //Altera o valor da isLoading
  @action
  void setLoading(bool value) => isLoading = value;

  // Incrementa um item no (@observable"Cart")
  @action
  void addFood(Food food) {
    foods.add(food);
  }

  // Incrementa vários item no (@observable"Cart")
  @action
  void addAll(List<Food> foods) {
    foods.addAll(foods);
  }

  // Remove um item do Cart
  @action
  void removeFood(Food food) {
    foods.remove(food);
  }

  // Linpa todos os itens do Cart
  @action
  void clearFood() {
    foods.clear();
  }

  @action
  Future getFoods(String tokenCompany) async {
    clearFood();
    clearCart();
    setLoading(true); //Inicia o Loading

    final response = await _repository.getFoods(tokenCompany);

    setLoading(false); //Finaliza o Loading

    response.map((food) => addFood(Food.fromJson(food))).toList();
  }

  /**
   * Cart control
   */
  @action
  void addFoodCart(Food food) {
    print('addFoodCart');

    if (inFoodCart(food)) {
      return incrementFoodCart(food);
    }

    cartItems.add({
      'identify': food.identify,
      'qty': 1,
      'product': food,
    });

    calcTotalCart();
  }

  @action
  void removeFoodCart(Food food) {
    print('removeFoodCart');

    cartItems.removeWhere((element) => element['identify'] == food.identify);

    calcTotalCart();
  }

  @action
  void clearCart() {
    print('clearCart');
    cartItems.clear();

    calcTotalCart();
  }

  /**
   * Incrementa produtos no carrinho
   */
  @action
  void incrementFoodCart(Food food) {
    final int index =
        cartItems.indexWhere((element) => element['identify'] == food.identify);

    cartItems[index]['qty'] = cartItems[index]['qty'] + 1;

    calcTotalCart();
  }

  /**
   * decrementa produtos no carrinho
   */
  @action
  void decrementFoodCart(Food food) {
    final int index =
        cartItems.indexWhere((element) => element['identify'] == food.identify);

    cartItems[index]['qty'] = cartItems[index]['qty'] - 1;

    if (cartItems[index]['qty'] == 0) {
      return removeFoodCart(food);
    }

    calcTotalCart();
  }

  // Existe produtos no carrinho? Retorna (true or false)
  @action
  bool inFoodCart(Food food) {
    final int index =
        cartItems.indexWhere((element) => element['identify'] == food.identify);

    return index != -1; // se diferente de menos 1 está no carrinho
  }

  @action
  double calcTotalCart() {
    double total = 0;

    //map() percorre todos os itens
    cartItems
        .map((element) =>
            total += element['qty'] * double.parse(element['product'].price))
        .toList();
    totalCart = total;

    foods = foods;

    // Forçar atualização
    cartItems = cartItems;

    return total;
  }
}
