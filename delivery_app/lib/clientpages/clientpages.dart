import 'package:delivery_app/clientpages/addClient.dart';
import 'package:flutter/material.dart';

class ClientScreen extends StatefulWidget {
  const ClientScreen({Key? key}) : super(key: key);

  @override
  State<ClientScreen> createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> {

  final List<Map<String, dynamic>> _allusers = [
    {"id": 1, "name": "Andy", "date": 'Today'},
    {"id": 2, "name": "Aragon", "date": 'Yesterday'},
    {"id": 3, "name": "Bob", "date": 'Yesterday'},
    {"id": 4, "name": "Barbara", "date": 'Today'},
    {"id": 5, "name": "Barbara", "date": 'Today'},
    {"id": 6, "name": "Barbara", "date": 'Today'},
    {"id": 7, "name": "Barbara", "date": 'Today'},
    {"id": 8, "name": "Barbara", "date": 'Today'},
    {"id": 9, "name": "Barbara", "date": 'Today'},
    {"id": 10, "name": "Barbara", "date": 'Today'},

  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundUsers = [];

  @override
  initState() {
    // at the beginning, all users are shown
    _foundUsers = _allusers;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allusers;
    } else {
      results = _allusers
          .where((user) =>
          user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text('Clients', style: TextStyle(color: Colors.white, fontFamily: 'Gilroy-Regular'),),
          centerTitle: true,

          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white,),
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
          actions: <Widget>[
            IconButton(
                onPressed: (){},
                icon: Icon(Icons.visibility_off, color: Colors.white,),
            )
          ],

        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(43, 136, 216, 1),
                Color.fromRGBO(43, 136, 216, 1)
              ],
            ),
          ),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 60,
              ),
              const Text(
                'Total balance',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Gilroy-Regular'),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                '395,200.00',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 29,
                    fontFamily: 'Gilroy-Bold'),
              ),
              Expanded(
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          onChanged: (value) => _runFilter(value),
                          decoration: const InputDecoration(
                            suffixIcon: Icon(Icons.search),
                          ),
                        ),
                        Expanded(
                          child: _foundUsers.isNotEmpty
                              ? ListView.builder(
                            itemCount: _foundUsers.length,
                            itemBuilder: (context, index) => Card(
                              key: ValueKey(_foundUsers[index]["id"]),
                              color: Colors.white,
                              margin:const EdgeInsets.symmetric(vertical: 0.2),
                              child: ListTile(
                                leading: Text(
                                  _foundUsers[index]["id"].toString(),
                                  style: const TextStyle(
                                      fontSize: 24,
                                      fontFamily: 'Gilroy-Bold'),
                                ),
                                title: Text(
                                  _foundUsers[index]['name'],
                                  style: TextStyle(
                                      fontFamily: 'Gilroy-Regular'),
                                ),
                                subtitle: Text(
                                    '${_foundUsers[index]["date"].toString()} Day'),
                              ),
                            ),
                          )
                              : const Text(
                            'No result found',
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      ],
                    )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
