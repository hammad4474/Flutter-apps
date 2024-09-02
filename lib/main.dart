import 'package:flutter/material.dart';
import 'package:reorderable_grid/reorderable_grid.dart';

void main() {
  runApp(const MyApp());
}

List<String> images = [
  'assets/images/endgame.jpg',
  'assets/images/galaxy.jpg',
  'assets/images/moonKnight.jpg',
  'assets/images/strange.jpg',
  'assets/images/thor.jpg',
  'assets/images/widow.jpg'
];

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
          child: Scaffold(
              backgroundColor: Colors.amber,
              body: ReorderableGridView.count(
                  children: images
                      .map((String path) => Card(
                            key: ValueKey(path),
                            child: Image.asset(
                              path,
                              fit: BoxFit.cover,
                            ),
                          ))
                      .toList(),
                  childAspectRatio: 0.7,
                  crossAxisCount: 2,
                  onReorder: (oldIndex, newIndex) {
                    String path = images.removeAt(oldIndex);
                    images.insert(newIndex, path);
                    setState(() {});
                  }))),
    );
  }
}
