import 'package:flutter/material.dart';

import '../../../models/Category.dart';

class Categories extends StatelessWidget {
  // Declarar a lista sem inicialização
  List<Category> _categories;
  // Receber atraves desse construtor de categories
  Categories(this._categories);

  @override
  Widget build(BuildContext context) {
    return _buildCategories();
  }

  Widget _buildCategories() {
    return Container(
      padding: EdgeInsets.only(top: 10),
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          /* Pegar o tipo exato da tategoria que estou listando
        *  Variavel "Category", do tipo "category"
        *  Vai recebe "_categories" na posição "[index]"
        ***  final Category category = _categories[index]; ***/
          final Category category = _categories[index];

          return _buildCategory(category, context);
        },
      ),
    );
  }

  // Construir item por item
  Widget _buildCategory(Category category, context) {
    return Container(
      // Espaçamentos
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.only(
        top: 2,
        bottom: 2,
        left: 15,
        right: 15,
      ),
      // Decoração do conteúdo
      decoration: BoxDecoration(
          border: Border.all(
              color: category.name == 'Bolo Gelado'
                  ? Theme.of(context).primaryColor
                  : Colors.green[900]),
          borderRadius: BorderRadius.circular(6)),
      child: Center(
        child: Text(
          category.name,
          style: TextStyle(
            color: category.name == 'Bolo Gelado'
                ? Theme.of(context).primaryColor
                : Colors.green[900],
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
