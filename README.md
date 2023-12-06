# Flutter

## Installation

Pour installer l'application, suivez ces étapes :

1. Clonez ce dépôt sur votre machine locale.
```bash
git clone https://github.com/BreizhWeb/FlutterClicker
cd FlutterClicker
```
2. Assurez-vous d'avoir Flutter et Dart installés.
3. Exécutez `flutter pub get` pour installer les dépendances.

## Lancement

Pour lancer l'application, exécutez la commande suivante :

```bash
flutter run
```

## Références/Ressources
Stack Overflow - Plateforme de questions-réponses où des développeurs partagent des problèmes et des solutions.
https://stackoverflow.com/questions/tagged/flutter

Documentation Flutter - La documentation officielle de Flutter pour les guides, les widgets, et les bonnes pratiques.
https://docs.flutter.dev/

Dart Language Documentation - La documentation officielle du langage Dart utilisé pour le développement avec Flutter.
https://dart.dev/guides

Medium - Flutter Community - Articles, tutoriels et bonnes pratiques de la communauté Flutter.
https://medium.com/flutter-community

Official Flutter YouTube Channel - Vidéos officielles sur Flutter, incluant des tutoriels, des conférences et des présentations.
https://www.youtube.com/flutterdev

## Difficultés
Récupération de Données entre les Pages : La gestion de la communication et du partage de données entre les différentes pages peut être complexe.

Dissociation des Ressources et des Recettes : La séparation des ressources et des recettes peut entraîner des défis pour maintenir leur synchronisation.

Synchronisation des Quantités : Assurer la synchronisation correcte et en temps réel des quantités entre les ressources et les recettes peut être un défi, notamment lors des mises à jour.

Gestion des États Entre les Pages : Maintenir la cohérence des états entre les différentes pages de l'application peut poser des difficultés de gestion et de synchronisation.


## Choix de design/Implémentation
### Gestion de l'état
J'ai utilisé StatefulWidgets pour gérer l'état des ressources et des recettes. Ce choix permet de modifier dynamiquement l'état des éléments de l'interface utilisateur en réponse à des actions faites.

Gestionnaire d'état global: En utilisant une classe ResourcesManager comme gestionnaire d'état global, je centralise la gestion des ressources à travers toute l'application. J'ai accès aux données sur toutes les pages.

### Architecture
Widgets Composés: Je suis une approche de widgets composés, où chaque widget a une responsabilité spécifique. Cela favorise la modularité, la réutilisabilité et la facilité de maintenance.

Modélisation des recettes et des ressources: La modélisation des recettes et des ressources sous forme de classes distinctes facilite la manipulation et l'utilisation de ces entités à différents endroits de l'application.

### Interaction Utilisateur
Utilisation de ListTiles: J'ai utilisé des ListTiles pour afficher les ressources et les recettes.

Boutons pour l'interaction: Les boutons 'Produire' ou 'Miner' permettent à l'utilisateur de déclencher des actions clés, ce qui rend l'expérience utilisateur plus interactive et engageante.

### Gestion des Recettes
Validation des ressources pour la production: La méthode _canProduceRecipe vérifie si les ressources nécessaires pour produire une recette sont disponibles avant de permettre à l'utilisateur de la produire. Cela garantit une utilisation appropriée des ressources.
Code de Données
Utilisation des listes pour représenter les ressources et les recettes: L'utilisation de listes pour stocker les ressources et les recettes permet une manipulation facile et un accès efficace à ces données.
