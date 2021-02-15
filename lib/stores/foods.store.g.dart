// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'foods.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FoodsStare on _FoodsStareBase, Store {
  final _$foodsAtom = Atom(name: '_FoodsStareBase.foods');

  @override
  ObservableList<Food> get foods {
    _$foodsAtom.reportRead();
    return super.foods;
  }

  @override
  set foods(ObservableList<Food> value) {
    _$foodsAtom.reportWrite(value, super.foods, () {
      super.foods = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_FoodsStareBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$getFoodsAsyncAction = AsyncAction('_FoodsStareBase.getFoods');

  @override
  Future<dynamic> getFoods(String tokenCompany) {
    return _$getFoodsAsyncAction.run(() => super.getFoods(tokenCompany));
  }

  final _$_FoodsStareBaseActionController =
      ActionController(name: '_FoodsStareBase');

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_FoodsStareBaseActionController.startAction(
        name: '_FoodsStareBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_FoodsStareBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addFood(Food food) {
    final _$actionInfo = _$_FoodsStareBaseActionController.startAction(
        name: '_FoodsStareBase.addFood');
    try {
      return super.addFood(food);
    } finally {
      _$_FoodsStareBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addAll(List<Food> foods) {
    final _$actionInfo = _$_FoodsStareBaseActionController.startAction(
        name: '_FoodsStareBase.addAll');
    try {
      return super.addAll(foods);
    } finally {
      _$_FoodsStareBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeFood(Food food) {
    final _$actionInfo = _$_FoodsStareBaseActionController.startAction(
        name: '_FoodsStareBase.removeFood');
    try {
      return super.removeFood(food);
    } finally {
      _$_FoodsStareBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearFood() {
    final _$actionInfo = _$_FoodsStareBaseActionController.startAction(
        name: '_FoodsStareBase.clearFood');
    try {
      return super.clearFood();
    } finally {
      _$_FoodsStareBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
foods: ${foods},
isLoading: ${isLoading}
    ''';
  }
}
