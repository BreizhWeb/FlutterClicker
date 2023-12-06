import 'package:flutter/material.dart';
import 'boutique.dart';
import 'inventaire.dart';
import 'ressources.dart';
import 'recettes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ResourcesManager resourcesManager = ResourcesManager(); // Instanciation du ResourcesManager

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clicker Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MainPage(resourcesManager: resourcesManager), // Passer resourcesManager à MainPage
        '/boutique': (context) => BoutiquePage(recipes: getRecipes(), resourcesManager: resourcesManager), // Passer resourcesManager à BoutiquePage
        '/inventaire': (context) => InventairePage(recipes: getRecipes(), resourcesManager: resourcesManager), // Passer resourcesManager à InventairePage
      },
    );
  }
}

class MainPage extends StatelessWidget {
  final ResourcesManager resourcesManager;

  MainPage({required this.resourcesManager});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ressources'),
        actions: [
          IconButton(
            icon: Icon(Icons.inventory),
            onPressed: () {
              Navigator.pushNamed(context, '/inventaire');
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () async {
              var refreshed = await Navigator.pushNamed(context, '/boutique');
              if (refreshed == true) {
                Navigator.pushNamed(context, '/main'); // Rafraîchir la page actuelle
              }
            },
          ),
        ],
      ),
      body: ResourceGrid(resources: resourcesManager.resources),
    );
  }
}

class ResourceGrid extends StatelessWidget {
  final List<Resource> resources;

  ResourceGrid({required this.resources});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
      ),
      itemCount: resources.length,
      itemBuilder: (BuildContext context, int index) {
        return ResourceWidget(resource: resources[index]);
      },
    );
  }
}

class ResourceWidget extends StatefulWidget {
  final Resource resource;

  ResourceWidget({required this.resource});

  @override
  _ResourceWidgetState createState() => _ResourceWidgetState();
}

class _ResourceWidgetState extends State<ResourceWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: widget.resource.color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.resource.name,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              'Quantité: ${widget.resource.quantity}',
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 5.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  widget.resource.quantity++;
                });
              },
              child: Text('Miner'),
            ),
          ],
        ),
      ),
    );
  }
}