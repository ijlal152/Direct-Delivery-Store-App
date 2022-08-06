import 'package:delivery_app/DbHelper.dart';
import 'package:delivery_app/Model/clientModel.dart';
import 'package:delivery_app/clientpages/addClient.dart';
import 'package:delivery_app/clientpages/clientDashboard.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClientScreen extends StatefulWidget {
  const ClientScreen({Key? key}) : super(key: key);

  @override
  State<ClientScreen> createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> {

  Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  // Future setSP(clientModel client) async{
  //   final SharedPreferences sp = await _pref;
  //
  //   sp.setString("client_name", client.c_name!);
  //   sp.setString("client_initialbalance", client.c_initialBalance!);
  // }

  String clientName = "";
  String clientBalance = "";
  String clientID = "";

  Future<void> getUserData() async {
    final SharedPreferences sp = await _pref;

    setState((){
      //clientID = sp.getString("ID")!;
      //clientName = sp.getString("client_name")!;
      //clientBalance = sp.getString("client_initialbalance")!;
    });
  }

  final List<Map<String, dynamic>> _allusers = [
    //{"id": clientID, "name" : clientName, "date" : 'Today', "clientBalance" : clientBalance},
     {"id": 1, "name": "Andy", "date": 'Today'},
     {"id": 2, "name": "Aragon", "date": 'Yesterday'},
    // {"id": 3, "name": "Bob", "date": 'Yesterday'},
    // {"id": 4, "name": "Barbara", "date": 'Today'},
    // {"id": 5, "name": "Barbara", "date": 'Today'},
    // {"id": 8, "name": "Barbara", "date": 'Today'},
    // {"id": 9, "name": "Barbara", "date": 'Today'},
    // {"id": 10, "name": "Barbara", "date": 'Today'},

  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundUsers = [];

  var dbHelper;
  @override
  initState() {
    dbHelper = DbHelper();
    // at the beginning, all users are shown
    _foundUsers = _allusers;
    super.initState();
    getUserData();
    print("client ID: $clientID");
    print("client name: $clientName");
    print("client balance: $clientBalance");
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

  Widget userWidget() {
    return FutureBuilder(
      future: this.dbHelper.retrieveUsers(),
      builder: (BuildContext context, AsyncSnapshot<List<clientModel>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, position) {
                return Dismissible(
                    direction: DismissDirection.endToStart,
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Icon(Icons.delete_forever),
                    ),
                    key: UniqueKey(),
                    child: new GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => populateFields(snapshot.data![position]),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        12.0, 12.0, 12.0, 6.0),
                                    child: Text(
                                      snapshot.data![position].c_name.toString(),
                                      style: TextStyle(
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        12.0, 6.0, 12.0, 12.0),
                                    child: Text(
                                      snapshot.data![position].c_name.toString(),
                                      style: TextStyle(fontSize: 18.0),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.black26,
                                          borderRadius:
                                          BorderRadius.circular(100)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          snapshot.data![position].c_initialBalance
                                              .toString(),
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            height: 2.0,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    ));
              });
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  late clientModel _clientmodel;

  void populateFields(clientModel client) {
    _clientmodel = client;
    // nameController.text = _user.name;
    // ageController.text = _user.age.toString();
    // emailController.text = _user.email;
    // isEditing = true;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text('Clients', style: TextStyle(color: Colors.white, fontFamily: 'Inter-Regular'),),
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
                icon: Icon(Icons.visibility_off_outlined, color: Colors.white,),
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
                    fontSize: 17,
                    fontFamily: 'Inter-SemiBold'),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                '395,200.00',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 29,
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
                          style: TextStyle(
                            color : Color.fromRGBO(246, 247, 248, 1),
                          ),
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

                            // enabledBorder: OutlineInputBorder(
                            //     borderRadius: BorderRadius.only(
                            //       topLeft: Radius.circular(20),
                            //       topRight: Radius.circular(20),
                            //     ),
                            //     borderSide: BorderSide(color: Colors.transparent),
                            // ),
                          ),

                        ),

                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color : Color.fromRGBO(255, 255, 255, 1),
                            ),
                            child: FutureBuilder<List>(
                              future: dbHelper.retrieveClientData(),
                              builder: (context, snapshot){
                                print(snapshot.data);
                                if(snapshot.hasData){
                                  return ListView.builder(
                                      itemCount: snapshot.data?.length,
                                      itemBuilder: (context, i){
                                        return Card(
                                            child: ListTile(
                                                title: Text(snapshot.data![i]['client_name'], style: TextStyle(fontSize: 30,)
                                                ),
                                                subtitle: Text(snapshot.data![i]['client_initialbalance'], style: TextStyle(fontSize: 30,)
                                                )
                                            )
                                        );
                                      }
                                  );
                                }else{
                                  return Center(
                                    child: Text('No Data found'),
                                  );
                                }
                              },
                            ),
                          ),
                          // child: Container(
                          //   decoration: BoxDecoration(
                          //     color : Color.fromRGBO(255, 255, 255, 1),
                          //   ),
                          //   child: _foundUsers.isNotEmpty
                          //       ? ListView.builder(
                          //     padding: EdgeInsets.zero,
                          //     itemCount: _foundUsers.length,
                          //     itemBuilder: (context, index) => Card(
                          //       key: ValueKey(_foundUsers[index]["id"]),
                          //       shape: RoundedRectangleBorder(
                          //         borderRadius: BorderRadius.circular(0),
                          //       ),
                          //       //color: Colors.white,
                          //       //margin:const EdgeInsets.symmetric(vertical: 0.2),
                          //       margin: EdgeInsets.only(left: 5, top: 0.2, bottom: 0, right: 5),
                          //       child: ListTile(
                          //         tileColor: Colors.white,
                          //         leading: Container(
                          //           padding: EdgeInsets.all(7),
                          //           decoration: BoxDecoration(
                          //             color : Color.fromRGBO(246, 247, 248, 1),
                          //             shape: BoxShape.circle,
                          //           ),
                          //           child: Text(
                          //             _foundUsers[index]["id"].toString(),
                          //             style: const TextStyle(
                          //                 fontSize: 16,
                          //                 fontFamily: 'Inter-Bold',
                          //                 height: 1.5,
                          //               color: Color.fromRGBO(0, 0, 0, 1),
                          //             ),
                          //           ),
                          //         ),
                          //         title: Text(
                          //           _foundUsers[index]['name'],
                          //           style: TextStyle(
                          //               color: Color.fromRGBO(4, 12, 34, 1),
                          //               fontSize: 16,
                          //               letterSpacing: 0.15000000596046448,
                          //               height: 1.5,
                          //               fontFamily: 'Inter-SemiBold'),
                          //         ),
                          //         subtitle: Text(
                          //             '${_foundUsers[index]["date"].toString()} ',
                          //           style: TextStyle(
                          //             color: Color.fromRGBO(92, 97, 111, 1),
                          //             fontFamily: 'Inter-Regular',
                          //             height: 1.4545454545454546,
                          //             fontSize: 11,
                          //             letterSpacing: 0.5,
                          //           ),
                          //         ),
                          //         trailing: Text('Money',
                          //           style: TextStyle(
                          //               fontFamily: 'Inter-Regular',
                          //             fontSize: 16,
                          //             letterSpacing: 0.15000000596046448,
                          //               height: 1.5,
                          //             color: Color.fromRGBO(0, 177, 103, 1),
                          //           ),
                          //         ),
                          //         onTap: (){
                          //           Navigator.push(context,
                          //               MaterialPageRoute(builder: (_)=> ClientDashBoard()));
                          //         },
                          //       ),
                          //     ),
                          //   )
                          //       : const Text(
                          //     'No result found',
                          //     style: TextStyle(fontSize: 24,fontFamily: 'Inter-Regular',),
                          //   ),
                          // ),
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
            Navigator.push(context,
                MaterialPageRoute(builder: (_)=> AddClient()));
          },
          backgroundColor: Colors.blue,
          child: Icon(Icons.add),
        ),
      ),

    );
  }

}
