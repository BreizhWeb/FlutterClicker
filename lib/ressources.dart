import 'package:flutter/material.dart';

class Resource {
  final String name;
  final Color color;
  final String description;
  int quantity;

  Resource({required this.name, required this.color, required this.description ,this.quantity = 0});
}

List<Resource> getResources() {
  return [
    Resource(name: 'Bois', color: const Color(0xFF967969), description: "Du bois brut"),
    Resource(name: 'Minerai de fer', color: const Color(0xFFced4da), description: "Du minerai de fer brut"),
    Resource(name: 'Minerai de cuivre', color: const Color(0xFFd9480f), description: "Du minerai de cuivre bru"),
    Resource(name: 'Charbon', color: const Color(0xFF000000), description: "Du minerai de charbon"),
  ];
}
