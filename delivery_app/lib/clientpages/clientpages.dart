import 'package:delivery_app/clientpages/addClient.dart';
import 'package:flutter/material.dart';

class ClientScreen extends StatefulWidget {
  const ClientScreen({Key? key}) : super(key: key);

  @override
  State<ClientScreen> createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> {
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
          body: Center(
            child: Text('All Clients here'),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_)=>const AddClient()));
            },
            backgroundColor: Colors.green,
            child: const Icon(Icons.add),

          ),
        ),
    );
  }
}
