import 'package:flutter/material.dart';
import 'map_screen.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const MapPage()));
          },
          child: const Icon(Icons.map),
        ),
      ),
    );
  }
}
