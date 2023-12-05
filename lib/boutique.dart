import 'package:flutter/material.dart';
import 'ressources.dart';
import 'recettes.dart';

class BoutiquePage extends StatelessWidget {
  final List<Recipe> recipes;
  final List<Resource> resources;

  BoutiquePage({required this.recipes, required this.resources});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Boutique'),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (BuildContext context, int index) {
          final recipe = recipes[index];
          final canProduce = _canProduceRecipe(recipe);

          return ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recipe.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(recipe.description),
                _buildRecipeCosts(recipe),
              ],
            ),
            trailing: ElevatedButton(
              onPressed: canProduce ? () => _produceItem(recipe) : null,
              child: Text('Produire'),
            ),
          );
        },
      ),
    );
  }

  Widget _buildRecipeCosts(Recipe recipe) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: recipe.cost.map<Widget>((cost) {
        return Text('${cost.quantity} ${cost.resource.name}');
      }).toList(),
    );
  }

  bool _canProduceRecipe(Recipe recipe) {
    // Vérifie si les ressources nécessaires pour fabriquer la recette sont disponibles
    for (var cost in recipe.cost) {
      var resource = resources.firstWhere(
        (res) => res.name == cost.resource.name,
        orElse: () => Resource(
          name: cost.resource.name,
          color: cost.resource.color,
          description: cost.resource.description,
          quantity: 0,
        ),
      );
      if (resource.quantity < cost.quantity) {
        return false;
      }
    }
    return true;
  }

  void _produceItem(Recipe recipe) {
    for (var cost in recipe.cost) {
      var resource = resourcesManager.resources.firstWhere(
        (res) => res.name == cost.resource.name,
        orElse: () => Resource(
          name: cost.resource.name,
          color: cost.resource.color,
          description: cost.resource.description,
          quantity: 0,
        ),
      );
      resource.quantity -= cost.quantity;

      resourcesManager.resources.removeWhere((res) => res.name == resource.name);
      resourcesManager.resources.add(resource);
    }
  }
}
