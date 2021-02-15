// import 'dart:ffi';

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

  /**
   * Cart itens do carrinho
   */
  @observable
  ObservableList<Food> cartItens = ObservableList<Food>();

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
    cartItens.add(food);
  }

  @action
  void removeFoodCart(Food food) {
    cartItens.remove(food);
  }

  @action
  void clearCart() {
    cartItens.clear();
  }

  // Existe produtos no carrinho? Retorna (true or false)
  @action
  bool inFoodCart(Food food) => cartItens.contains(food);
}
