import 'package:flutter/material.dart';

class Resource {
  final String name;
  final Color color;
  final String description;
  int quantity;

  Resource({required this.name, required this.color, required this.description, this.quantity = 0});
}

class ResourcesManager {
  static final ResourcesManager _instance = ResourcesManager._internal();
  factory ResourcesManager() => _instance;
  ResourcesManager._internal();

  List<Resource> resources = getResources();

  void produceResource(String resourceName, int quantity) {
    final resourceIndex = resources.indexWhere((res) => res.name == resourceName);
    if (resourceIndex != -1) {
      resources[resourceIndex].quantity += quantity;
    }
  }

   bool consumeResources(List<Resource> recipeCost) {
    for (var cost in recipeCost) {
      final resourceIndex =
          resources.indexWhere((res) => res.name == cost.name);
      if (resourceIndex != -1) {
        if (resources[resourceIndex].quantity < cost.quantity) {
          return false; // Insufficient resources
        }
      } else {
        return false; // Resource not found
      }
    }

    for (var cost in recipeCost) {
      final resourceIndex =
          resources.indexWhere((res) => res.name == cost.name);
      resources[resourceIndex].quantity -= cost.quantity;
    }

    return true; // Successfully consumed resources
  }
}

final resourcesManager = ResourcesManager();

List<Resource> getResources() {
  return [
    Resource(name: 'Bois', color: const Color(0xFF967969), description: "Du bois brut"),
    Resource(name: 'Minerai de fer', color: const Color(0xFFced4da), description: "Du minerai de fer brut"),
    Resource(name: 'Minerai de cuivre', color: const Color(0xFFd9480f), description: "Du minerai de cuivre brut"),
    Resource(name: 'Charbon', color: const Color(0xFF000000), description: "Du minerai de charbon"),
  ];
}