import 'package:flutter/material.dart';

class TresuryPage extends StatefulWidget {
  const TresuryPage({Key? key}) : super(key: key);

  @override
  State<TresuryPage> createState() => _TresuryPageState();
}

class _TresuryPageState extends State<TresuryPage> {

  final List<Map<String, dynamic>> _allusers = [
    {"id": 1, "name": "Andy", "date": 'Today'},
    {"id": 2, "name": "Aragon", "date": 'Yesterday'},
    {"id": 3, "name": "Bob", "date": 'Yesterday'},
    {"id": 4, "name": "Barbara", "date": 'Today'},
    {"id": 5, "name": "Barbara", "date": 'Today'},
    {"id": 6, "name": "Barbara", "date": 'Today'},
    {"id": 7, "name": "Barbara", "date": 'Today'},
    // {"id": 8, "name": "Barbara", "date": 'Today'},
    // {"id": 9, "name": "Barbara", "date": 'Today'},
    // {"id": 10, "name": "Barbara", "date": 'Today'},

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
          title: const Text('Tresury', style: TextStyle(color: Colors.white, fontFamily: 'Inter-Regular'),),
          centerTitle: true,

          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white,),
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
          actions: <Widget>[

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
                    fontSize: 17,
                    fontFamily: 'Inter-Regular'),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                '395,200.00',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontFamily: 'Inter-Bold'),
              ),
              Expanded(
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
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
                            // 246, 247m 248, 1,
                            //fillColor: Color.fromRGBO(246, 247, 248, 2),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)
                              ),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          ),

                        ),

                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: _foundUsers.isNotEmpty
                                ? ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: _foundUsers.length,
                              itemBuilder: (context, index) => Card(
                                key: ValueKey(_foundUsers[index]["id"]),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                color: Colors.white,
                                //margin:const EdgeInsets.symmetric(vertical: 0.2),
                                margin: EdgeInsets.only(left: 5, top: 0.2, bottom: 0, right: 5),
                                child: ListTile(
                                  tileColor: Colors.white,
                                  leading: Container(
                                    padding: EdgeInsets.all(7),
                                    decoration: BoxDecoration(
                                      color : Color.fromRGBO(246, 247, 248, 1),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Text(
                                      _foundUsers[index]["id"].toString(),
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Inter-Bold',
                                        height: 1.5,
                                        color: Color.fromRGBO(0, 0, 0, 1),
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                    _foundUsers[index]['name'],
                                    style: TextStyle(
                                        color: Color.fromRGBO(4, 12, 34, 1),
                                        fontSize: 16,
                                        letterSpacing: 0.15000000596046448,
                                        height: 1.5,
                                        fontFamily: 'Inter-SemiBold'),
                                  ),
                                  subtitle: Text(
                                      '${_foundUsers[index]["date"].toString()} ',
                                    style: TextStyle(
                                      color: Color.fromRGBO(92, 97, 111, 1),
                                      fontFamily: 'Inter-Regular',
                                      height: 1.4545454545454546,
                                      fontSize: 11,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                  trailing: Text('Money', style: TextStyle(
                                    fontFamily: 'Inter-Regular',
                                    fontSize: 16,
                                    letterSpacing: 0.15000000596046448,
                                    height: 1.5,
                                    color: Color.fromRGBO(0, 177, 103, 1),
                                  ),),
                                  onTap: (){
                                    // Navigator.push(context,
                                    //     MaterialPageRoute(builder: (_)=> ClientDashBoard()));
                                  },
                                ),
                              ),
                            )
                                : const Text(
                              'No result found',
                              style: TextStyle(fontSize: 24, fontFamily: 'Inter-Regular',),
                            ),
                          ),
                        ),
                      ],
                    )
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (_)=> AddClient()));
          },
          backgroundColor: Colors.blue,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
