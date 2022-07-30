import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class ClientDashBoard extends StatefulWidget {
  const ClientDashBoard({Key? key}) : super(key: key);

  @override
  State<ClientDashBoard> createState() => _ClientDashBoardState();
}

class _ClientDashBoardState extends State<ClientDashBoard> {

  final List<Map<String, dynamic>> _allusers = [
    {"id": 1, "date": "10/07/2022", "balance": 'Balance: 44,700,00'},
    {"id": 2, "date": "5/03/2022", "balance": 'Balance: 100,700,00'},
    {"id": 3, "date": "5/08/2022", "balance": 'Balance: 20,700,00'},
    {"id": 4, "date": "10/07/2022", "balance": 'Balance: 11,700,00'},
    {"id": 5, "date": "11/08/2022", "balance": 'Balance: 23,700,00'},
    {"id": 6, "date": "12/04/2022", "balance": 'Balance: 32,700,00'},
    {"id": 7, "date": "13/03/2022", "balance": 'Balance: 65,700,00'},
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
          user["date"].toLowerCase().contains(enteredKeyword.toLowerCase()))
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
          title: const Text('Client',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Inter-Regular'
            ),
          ),
          centerTitle: true,

          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white,),
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
          actions: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 10),
              child: Icon(Icons.more_vert, color: Colors.white),
            ),

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
          child: Stack(
            children: <Widget>[
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * .29,
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 60,
                        ),
                        const Text(
                          'Clients Name',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'Inter-Regular'),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Balance',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontFamily: 'Inter-Regular'),
                        ),
                        const Text(
                          '44,700.00',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 29,
                              fontFamily: 'Inter-Bold'),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                            child: SizedBox(height: 30,)
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                        height: MediaQuery.of(context).size.height * .35,
                        color: Colors.white,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 70,
                            ),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  margin:
                                  const EdgeInsetsDirectional.only(start: 13),
                                  child: Text(
                                    'Transactions',
                                    style: TextStyle(
                                        fontFamily: 'Inter-Bold', fontSize: 23),
                                  ),
                                )),
                            Container(
                              margin: EdgeInsets.only(left: 10, right: 10),
                              padding: EdgeInsets.all(8),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    GFButton(
                                      onPressed: () {},
                                      text: 'All',
                                      textStyle: TextStyle(
                                        fontFamily: 'Inter-Regular',
                                        color: Colors.black,
                                      ),
                                      icon: Icon(Icons.check),
                                      shape: GFButtonShape.pills,
                                      color: Colors.black,
                                      type: GFButtonType.outline,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    GFButton(
                                        onPressed: () {},
                                        text: 'Sells',
                                        textStyle: TextStyle(
                                          fontFamily: 'Inter-Regular',
                                          color: Colors.black,
                                        ),
                                        //icon: Icon(Icons.sell, color: Colors.orange),
                                        icon: Image.asset(
                                          'assets/images/sells.png',
                                          height: 20,
                                        ),
                                        shape: GFButtonShape.pills,
                                        color: Colors.black,
                                        type: GFButtonType.outline),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    GFButton(
                                        onPressed: () {},
                                        text: 'Return',
                                        textStyle: TextStyle(
                                          fontFamily: 'Inter-Regular',
                                          color: Colors.black,
                                        ),
                                        //icon: Icon(Icons.assignment_return, color: Colors.cyan,),
                                        icon: Image.asset(
                                          'assets/images/return.png',
                                          height: 20,
                                        ),
                                        shape: GFButtonShape.pills,
                                        color: Colors.black,
                                        type: GFButtonType.outline),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    GFButton(
                                        onPressed: () {},
                                        text: 'Payments',
                                        textStyle: TextStyle(
                                          fontFamily: 'Inter-Regular',
                                          color: Colors.black,
                                        ),
                                        //icon: Icon(Icons.assignment_return, color: Colors.cyan,),
                                        icon: Image.asset(
                                          'assets/images/payments.png',
                                          height: 20,
                                        ),
                                        shape: GFButtonShape.pills,
                                        color: Colors.black,
                                        type: GFButtonType.outline),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    GFButton(
                                        onPressed: () {},
                                        text: 'Refund',
                                        textStyle: TextStyle(
                                          fontFamily: 'Inter-Regular',
                                          color: Colors.black,
                                        ),
                                        //icon: Icon(Icons.assignment_return, color: Colors.cyan,),
                                        icon: Image.asset(
                                          'assets/images/refund.png',
                                          height: 20,
                                        ),
                                        shape: GFButtonShape.pills,
                                        color: Colors.black,
                                        type: GFButtonType.outline),
                                  ],
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
                                      borderRadius:
                                      BorderRadius.circular(0),
                                    ),
                                    color: Colors.white,
                                    //margin:const EdgeInsets.symmetric(vertical: 0.2),
                                    margin: EdgeInsets.only(
                                        left: 5,
                                        top: 0.2,
                                        bottom: 0,
                                        right: 5),
                                    child: ListTile(
                                      tileColor: Colors.white,
                                      leading: Image.asset('assets/images/pay.png', height: 48),
                                      title: Text(
                                        _foundUsers[index]['date'],
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontFamily: 'Inter-SemiBold'
                                        ),
                                      ),
                                      subtitle: Text(
                                          '${_foundUsers[index]["balance"].toString()} ',
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontFamily: 'Inter-Regular',
                                          color: Color.fromRGBO(92, 97, 111, 1),
                                            letterSpacing: 0.5,
                                            fontWeight: FontWeight.normal,
                                            height: 1.4545454545454546
                                        ),
                                      ),
                                      trailing: Text(
                                        'Money',
                                        style: TextStyle(
                                            color: Color.fromRGBO(0, 177, 103, 1),
                                            fontFamily: 'Inter-Regular',
                                            fontSize: 14,
                                            letterSpacing: 0.15000000596046448,
                                            fontWeight: FontWeight.normal,
                                            height: 1.5
                                        ),
                                      ),
                                      onTap: () {
                                        // Navigator.push(context,
                                        //     MaterialPageRoute(builder: (_)=> ClientDashBoard()));
                                      },
                                    ),
                                  ),
                                )
                                    : const Text(
                                  'No result found',
                                  style: TextStyle(
                                      fontSize: 24,
                                    fontFamily: 'Inter-Regular',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(
                    top:165,
                    right: 55.0,
                    left: 55.0
                ),
                padding: EdgeInsets.all(8),
                child: Container(
                    height: 110.0,
                    padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25),
                      )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        children: [
                          Image.asset('assets/images/calls.png', height: 55,),
                          SizedBox(height: 5,),
                          Text('Call', style: TextStyle(fontFamily: 'Inter-Bold', fontSize: 20),),
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset('assets/images/sms.png', height: 55,),
                          SizedBox(height: 5,),
                          Text('SMS', style: TextStyle(fontFamily: 'Inter-Bold', fontSize: 20),),
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset('assets/images/gps.png', height: 55,),
                          SizedBox(height: 5,),
                          Text('GPS', style: TextStyle(fontFamily: 'Inter-Bold', fontSize: 20),),
                        ],
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
