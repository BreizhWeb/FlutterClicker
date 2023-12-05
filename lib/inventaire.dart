import 'package:flutter/material.dart';
import 'recettes.dart';
import 'ressources.dart';

class ProducedItem {
  final String name;
  int quantity;

  ProducedItem({required this.name, this.quantity = 0});
}

class InventairePage extends StatelessWidget {
  final List<Recipe> recipes;
  final List<Resource> resources;
  final List<ProducedItem> producedItems = []; 

  InventairePage({required this.recipes, required this.resources});

  @override
  Widget build(BuildContext context) {
    _updateProducedItems(); 

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

  Widget _buildResourceList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: resources.map((resource) {
        return ListTile(
          title: Text(resource.name),
          subtitle: Text('Quantité: ${resource.quantity}'),
        );
      }).toList(),
    );
  }

  Widget _buildProducedItemsList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: producedItems.map((item) {
        return ListTile(
          title: Text(item.name),
          subtitle: Text('Quantité: ${item.quantity}'),
        );
      }).toList(),
    );
  }

  void _updateProducedItems() {
    producedItems.clear();

    for (var recipe in recipes) {
      final producedItem = producedItems.firstWhere(
        (item) => item.name == recipe.name,
        orElse: () => ProducedItem(name: recipe.name),
      );
      producedItems.add(producedItem);
    }
  }
}


