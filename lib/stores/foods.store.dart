import 'package:mobx/mobx.dart';

import '../models/Food.dart';
import '../data/network/repositories/food_repository.dart';

part 'foods.store.g.dart';

class FoodsStare = _FoodsStareBase with _$FoodsStare;

abstract class _FoodsStareBase with Store {
  // Instanciar o Repository
  FoodRepository _repository;
  // Construtor
  _FoodsStareBase() {
    _repository = new FoodRepository();
  }

  // Essa propriedade é um observer "@observable"
  @observable
  ObservableList<Food> foods = ObservableList<Food>();

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
    final response = await _repository.getFoods(tokenCompany);

    response.map((food) => addFood(Food.fromJson(food))).toList();
  }
}
