import 'package:mobx/mobx.dart';

import '../data/network/repositories/category_repository.dart';
import '../../models/Category.dart';

part 'categories.store.g.dart';

class CategoriesStore = _CategoriesStoreBase with _$CategoriesStore;

abstract class _CategoriesStoreBase with Store {
  CategoryRepository _repository;

  _CategoriesStoreBase() {
    _repository = new CategoryRepository();
  }

  // Observa as Categorias
  @observable
  ObservableList<Category> categories = ObservableList<Category>();

  @observable
  List<String> filtersCategory = [];

  @observable
  bool filterChanged = false;

  // Obseva do pre loading
  @observable
  bool isLoading = false;

  @action
  void setLoading(bool value) => isLoading = value;

  @action
  void addCategory(Category category) {
    categories.add(category);
  }

  @action
  void removeCategory(Category category) {
    categories.remove(category);
  }

  @action
  void clearCategories() {
    categories.clear();
  }

  /**
   * Add Filters
   * */
  @action
  void addFilter(String identify) {
    if (identify == 'all') {
      return clearFilter();
    } else {
      filtersCategory.add(identify);
    }

    //Sempre que adicionar dar um touch na list
    categories = categories;

    // mudo o valor para falso
    filterChanged = !filterChanged;
  }

  /**
   * Remover FiltersCategory
   */
  @action
  void removeFilter(String identify) {
    if (identify != 'all') {
      filtersCategory.remove(identify);
    }

    //Sempre que remover dar um touch na list
    categories = categories;
    filterChanged = !filterChanged;
  }

  //Verifica se existe o FiltersCategory
  @action
  bool inFilter(String identify) {
    //print(identify);
    return (identify == 'all' && filtersCategory.length == 0) ||
        filtersCategory.contains(identify);
  }

  //Limpar todos os FiltersCategory
  @action
  void clearFilter() {
    filtersCategory.clear();
    //Sempre que limpar todos dar um touch na list
    categories = categories;
    filterChanged = !filterChanged;
  }

  @action
  Future getCategories(String tokenCompany) async {
    setLoading(true);
    clearCategories(); // Limpar as categorias carregadas anteriormente
    clearFilter();
    final response = await _repository.getCategories(tokenCompany);

    response
        .map((categoryJson) => addCategory(Category.fromJson(categoryJson)))
        .toList();

    setLoading(false);
  }
}
