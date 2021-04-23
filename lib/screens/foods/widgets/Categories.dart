import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../stores/categories.store.dart';
import '../../../models/Category.dart';

class Categories extends StatelessWidget {
  // Declarar a lista sem inicialização
  List<Category> _categories;
  CategoriesStore categoriesStore;

  // Receber atraves desse construtor de categories
  Categories(this._categories);

  @override
  Widget build(BuildContext context) {
    categoriesStore = Provider.of<CategoriesStore>(context);
    return _buildCategories();
  }

  Widget _buildCategories() {
    return Container(
      padding: EdgeInsets.only(top: 10),
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            final Category category =
                Category.fromJson({'identify': 'all', 'name': 'Todas'});
            return _buildCategory(category, context);
          }

          final Category category = _categories[index - 1];
          return _buildCategory(category, context);
        },
      ),
    );
  }

  // Construir item por item
  Widget _buildCategory(Category category, context) {
    final String identifyCategory = category.identify;
    final bool inFilter = categoriesStore.inFilter(identifyCategory);
    return GestureDetector(
      onTap: () => inFilter
          ? categoriesStore.removeFilter(category.identify)
          : categoriesStore.addFilter(category.identify),
      child: Container(
        // Espaçamentos
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.only(top: 2, bottom: 2, left: 15, right: 15),
        // Decoração do conteúdo
        decoration: BoxDecoration(
            border: Border.all(
                color: inFilter ? Theme.of(context).primaryColor : Colors.grey),
            borderRadius: BorderRadius.circular(6)),
        child: Center(
          child: Text(
            category.name,
            style: TextStyle(
              color: inFilter ? Theme.of(context).primaryColor : Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
