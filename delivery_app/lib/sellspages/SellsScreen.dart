import 'package:flutter/material.dart';

class SellsScreen extends StatefulWidget {
  const SellsScreen({Key? key}) : super(key: key);

  @override
  State<SellsScreen> createState() => _SellsScreenState();
}

class _SellsScreenState extends State<SellsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Text('Shop name'),
          leading: const Icon(Icons.person, size: 40,),
          actions: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.settings),
            ),
          ],
        ),
      ),
    );
  }
}
