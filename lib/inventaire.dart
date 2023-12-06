import 'package:flutter/material.dart';
import 'recettes.dart';
import 'ressources.dart';

class InventairePage extends StatelessWidget {
  final List<Recipe> recipes; // Liste des recettes
  final ResourcesManager resourcesManager; // Gestionnaire des ressources

  InventairePage({required this.recipes, required this.resourcesManager});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventaire'),
      ),
      body: ListView(
        children: [
          _buildResourceList(), // Afficher les ressources avec leur quantité
          Divider(), // Une séparation entre les ressources et les recettes produites
          _buildProducedItemsList(), // Afficher les recettes produites avec leur quantité
        ],
      ),
    );
  }

  // Widget pour afficher la liste des ressources avec leur quantité
  Widget _buildResourceList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: resourcesManager.resources.map((resource) {
        return ListTile(
          title: Text(resource.name),
          subtitle: Text('Quantité: ${resource.quantity}'),
        );
      }).toList(),
    );
  }

  // Widget pour afficher la liste des recettes produites avec leur quantité
  Widget _buildProducedItemsList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: recipes.map((recipe) {
        return ListTile(
          title: Text(recipe.name),
          subtitle: Text('Quantité: ${recipe.quantity}'),
        );
      }).toList(),
    );
  }
}
