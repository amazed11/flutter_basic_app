import 'package:flutter/material.dart';

class BestProductDetailsScreen extends StatelessWidget {
  const BestProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Best product details"),
      ),
      body: Container(
        child: const Text("Best Deal"),
      ),
    );
  }
}
