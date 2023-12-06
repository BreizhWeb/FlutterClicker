import 'package:flutter/material.dart';

// Classe représentant une ressource
class Resource {
  final String name; // Nom de la ressource
  final Color color; // Couleur associée à la ressource
  final String description; // Description de la ressource
  int quantity; // Quantité actuelle de la ressource

  // Constructeur de la classe Resource
  Resource({required this.name, required this.color, required this.description, this.quantity = 0});
}

// Classe pour gérer les ressources de l'application
class ResourcesManager {
  // Instance unique de ResourcesManager (singleton)
  static final ResourcesManager _instance = ResourcesManager._internal();
  factory ResourcesManager() => _instance;
  ResourcesManager._internal();

  // Liste des ressources disponibles
  List<Resource> resources = getResources();

  // Méthode pour produire une ressource donnée en mettant à jour sa quantité
  void produceResource(String resourceName, int quantity) {
    final resourceIndex = resources.indexWhere((res) => res.name == resourceName);
    if (resourceIndex != -1) {
      resources[resourceIndex].quantity += quantity;
    }
  }

  // Méthode pour consommer des ressources pour une recette donnée
  bool consumeResources(List<Resource> recipeCost) {
    for (var cost in recipeCost) {
      final resourceIndex = resources.indexWhere((res) => res.name == cost.name);
      if (resourceIndex != -1) {
        if (resources[resourceIndex].quantity < cost.quantity) {
          return false; // Ressources insuffisantes
        }
      } else {
        return false; // Ressource non trouvée
      }
    }

    for (var cost in recipeCost) {
      final resourceIndex = resources.indexWhere((res) => res.name == cost.name);
      resources[resourceIndex].quantity -= cost.quantity;
    }

    return true; // Ressources consommées avec succès
  }
}

// Instance unique de ResourcesManager pour gérer les ressources de l'application
final resourcesManager = ResourcesManager();

// Fonction pour initialiser la liste de ressources disponibles avec des valeurs par défaut
List<Resource> getResources() {
  return [
    Resource(name: 'Bois', color: const Color(0xFF967969), description: "Du bois brut"),
    Resource(name: 'Minerai de fer', color: const Color(0xFFced4da), description: "Du minerai de fer brut"),
    Resource(name: 'Minerai de cuivre', color: const Color(0xFFd9480f), description: "Du minerai de cuivre brut"),
    Resource(name: 'Charbon', color: const Color(0xFF000000), description: "Du minerai de charbon"),
  ];
}