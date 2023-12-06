import 'package:flutter/material.dart';
import 'ressources.dart';

class Recipe {
  final String name;
  final String description;
  final String type;
  final String gameplay;
  final List<RecipeCost> cost;
  int quantity; // Ajout du champ quantity

  Recipe({
    required this.name,
    required this.description,
    required this.type,
    required this.gameplay,
    required this.cost,
    this.quantity = 0, // Initialisation de la quantité à zéro par défaut
  });
}

class RecipeCost {
  final int quantity;
  final Resource resource;

  RecipeCost({required this.quantity, required this.resource});
}

List<Recipe> getRecipes() {
  return [
    Recipe(
      name: 'Hache',
      description: 'Récolter le bois 3 par 3',
      type: 'Outil',
      gameplay: 'clicker 3 par 3',
      cost: [
        RecipeCost(
          quantity: 2,
          resource: Resource(name: 'Bois', color: const Color(0xFF967969), description: "Du bois brut"),
        ),
        RecipeCost(
          quantity: 2,
          resource: Resource(name: 'Minerai de fer', color: const Color(0xFFced4da), description: "Du minerai de fer brut"),
        ),
      ],
      quantity: 0,
    ),
    Recipe(
      name: 'Pioche',
      description: 'Récolter les minerais 5 par 5',
      type: 'Outil',
      gameplay: 'clicker 5 par 5',
      cost: [
        RecipeCost(
          quantity: 2,
          resource: Resource(name: 'Bois', color: const Color(0xFF967969), description: "Du bois brut"),
        ),
        RecipeCost(
          quantity: 3,
          resource: Resource(name: 'Minerai de fer', color: const Color(0xFFced4da), description: "Du minerai de fer brut"),
        ),
      ],
      quantity: 0,
    ),
    Recipe(
      name: 'Lingot de fer',
      description: 'Débloque d’autres recettes - Matériau Un lingot de fer pur',
      type: 'Matériau',
      gameplay: '',
      cost: [
        RecipeCost(
          quantity: 1,
          resource: Resource(name: 'Minerai de fer', color: const Color(0xFFced4da), description: "Du minerai de fer brut"),
        ),
      ],
      quantity: 0,  
    ),
    Recipe(
      name: 'Plaque de fer',
      description: 'Débloque d’autres recettes - Matériau Une plaque de fer pour la construction',
      type: 'Matériau',
      gameplay: '',
      cost: [
        RecipeCost(
          quantity: 3,
          resource: Resource(name: 'Minerai de fer', color: const Color(0xFFced4da), description: "Du minerai de fer brut"),
        ),
      ],
      quantity: 0,
    ),
    Recipe(
      name: 'Lingot de cuivre',
      description: 'Débloque d’autres recettes - Matériau Un lingot de cuivre pur',
      type: 'Matériau',
      gameplay: '',
      cost: [
        RecipeCost(
          quantity: 1,
          resource: Resource(name: 'Minerai de cuivre', color: const Color(0xFFd9480f), description: "Du minerai de cuivre brut"),
        ),
      ],
      quantity: 0,
    ),
    Recipe(
      name: 'Tige en métal',
      description: 'Débloque d’autres recettes - Matériau Une tige de métal',
      type: 'Matériau',
      gameplay: '',
      cost: [
        RecipeCost(
          quantity: 1,
          resource: Resource(name: 'Lingot de fer', color: const Color(0xFFced4da), description: "Du lingot de fer pur"),
        ),
      ],
      quantity: 0,
    ),
    Recipe(
      name: 'Fil électrique',
      description: 'Débloque d’autres recettes - Composant Un fil électrique pour fabriquer des composants électroniques',
      type: 'Composant',
      gameplay: '',
      cost: [
        RecipeCost(
          quantity: 1,
          resource: Resource(name: 'Lingot de cuivre', color: const Color(0xFFd9480f), description: "Du lingot de cuivre pur"),
        ),
      ],
      quantity: 0,
    ),
    Recipe(
      name: 'Mineur',
      description: 'Permet de transformer automatiquement d’extraire du minerai de fer ou cuivre - Un bâtiment qui permet d’automatiser le minage',
      type: 'Bâtiment',
      gameplay: '',
      cost: [
        RecipeCost(
          quantity: 10,
          resource: Resource(name: 'Plaque de fer', color: const Color(0xFFced4da), description: "Du minerai de fer brut"),
        ),
        RecipeCost(
          quantity: 5,
          resource: Resource(name: 'Fil électrique', color: const Color(0xFFd9480f), description: "Du fil électrique"),
        ),
      ],
      quantity: 0,
    ),
    Recipe(
      name: 'Fonderie',
      description: 'Permet de transformer automatiquement du minerai de fer ou cuivre en lingot de fer ou cuivre - Un bâtiment qui permet d’automatiser la production.',
      type: 'Bâtiment',
      gameplay: '',
      cost: [
        RecipeCost(
          quantity: 5,
          resource: Resource(name: 'Fil électrique', color: const Color(0xFFd9480f), description: "Du fil électrique"),
        ),
        RecipeCost(
          quantity: 8,
          resource: Resource(name: 'Tige en métal', color: const Color(0xFFced4da), description: "Du tige en métal"),
        ),
      ],
      quantity: 0,
    )
  ];
}