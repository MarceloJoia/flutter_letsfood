import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

import '../models/Food.dart';

part 'foods.store.g.dart';

class FoodsStare = _FoodsStareBase with _$FoodsStare;

abstract class _FoodsStareBase with Store {
  // Essa propriedade é um observer "@observable"
  @observable
  List<Food> foods = [];

  // Incrementa um item no Cart
  @action
  void add(Food food) {
    foods.add(food);
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
}
