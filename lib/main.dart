import 'package:flutter/material.dart';
import 'ressources.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Resource> resources = getResources();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clicker Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ressources'),
        ),
        body: ResourceGrid(resources: resources),
      ),
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
        return ResourceWidget(resources: resources[index]);
      },
    );
  }
}

class ResourceWidget extends StatelessWidget {
  final Resource resources;

  ResourceWidget({required this.resources});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: resources.color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              resources.name,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              'Quantité: ${resources.quantity}',
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 5.0),
            ElevatedButton(
              onPressed: () {
                resources.quantity++; // Increment resource quantity
              },
              child: Text('Miner'),
            ),
          ],
        ),
      ),
    );
  }
}
