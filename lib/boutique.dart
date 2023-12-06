 import 'package:flutter/material.dart';
import 'ressources.dart';
import 'recettes.dart';

class BoutiquePage extends StatefulWidget {
  final List<Recipe> recipes;
  final ResourcesManager resourcesManager;

  BoutiquePage({required this.recipes, required this.resourcesManager});

  @override
  _BoutiquePageState createState() => _BoutiquePageState();
}

class _BoutiquePageState extends State<BoutiquePage> {
  late List<bool> canProduceList;

  @override
  void initState() {
    super.initState();
    // Initialise la liste de booléens pour suivre l'état de chaque recette
    canProduceList = List.generate(widget.recipes.length, (index) => _canProduceRecipe(widget.recipes[index]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Boutique'),
      ),
      body: ListView.builder(
        itemCount: widget.recipes.length,
        itemBuilder: (BuildContext context, int index) {
          final recipe = widget.recipes[index];

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
              onPressed: canProduceList[index] ? () => _produceItem(recipe, index) : null,
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
      var resource = widget.resourcesManager.resources.firstWhere(
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

    void _produceItem(Recipe recipe, int index) {
    for (var cost in recipe.cost) {
      var resource = widget.resourcesManager.resources.firstWhere(
        (res) => res.name == cost.resource.name,
        orElse: () => Resource(
          name: cost.resource.name,
          color: cost.resource.color,
          description: cost.resource.description,
          quantity: 0,
        ),
      );
      resource.quantity -= cost.quantity;

      // Mettre à jour les ressources dans resourcesManager
      widget.resourcesManager.consumeResources([resource]);
    }

    // Actualiser l'état de la liste entière après la production
    setState(() {
      for (var i = 0; i < widget.recipes.length; i++) {
        canProduceList[i] = _canProduceRecipe(widget.recipes[i]);
      }
    });
  }
}