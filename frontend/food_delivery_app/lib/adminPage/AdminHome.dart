import 'package:flutter/material.dart';

import 'AdminAppProducts.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Home'),

      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () =>
            Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => AdminAddProduct())),
      ),

      body: const Text("No products yet..."),
    );
  }
}