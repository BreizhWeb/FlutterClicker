import 'package:flutter/material.dart';
import 'package:flutterclicker/ressources.dart';
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
        return GestureDetector(
          onTap: () {
            // Logic to handle resource click
            // Increment resource quantity
          },
          child: Container(
            color: resources[index].color,
            child: Center(
              child: Text(
                resources[index].name,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
