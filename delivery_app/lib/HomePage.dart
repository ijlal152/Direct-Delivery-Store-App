import 'package:delivery_app/clientpages/clientpages.dart';
import 'package:delivery_app/sellspages/SellsScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {

  Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  String userShopName = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
  }

  Future<void> getUserData() async {
    final SharedPreferences sp = await _pref;

    setState((){
      userShopName = sp.getString("driver_shopname")!;
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 120,
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: 20,),
                    Container(
                      child: Icon(Icons.person, size: 40, color: Colors.white),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: Card(
                        color:  Color.fromRGBO(43, 136, 216, 1),
                        elevation: 0,
                        child: ListTile(
                          title: Text('$userShopName', style: TextStyle(fontSize: 21, color: Colors.white, fontFamily: 'Gilroy-Regular')),
                          subtitle: Text('Version', style: TextStyle(fontSize: 18, color: Colors.white, fontFamily: 'Gilroy-Regular')),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Icon(Icons.settings, color: Colors.white),
                    )
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                  color: Color.fromRGBO(246, 247, 248, 1),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          InkWell(
                            onTap: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_)=>const ClientScreen()));
                            },
                            child: Container(
                              width: 160,
                              height: 130,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text('Client', style: TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold, fontFamily: 'Gilroy-Regular'),),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){},
                            child: Container(
                              width: 160,
                              height: 130,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text('Sells', style: TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold, fontFamily: 'Gilroy-Regular'),),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          InkWell(
                            onTap: (){},
                            child: Container(
                              width: 160,
                              height: 130,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text('Purchase', style: TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold, fontFamily: 'Gilroy-Regular'),),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){},
                            child: Container(
                              width: 160,
                              height: 130,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text('Suplier', style: TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold, fontFamily: 'Gilroy-Regular'),),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          InkWell(
                            onTap: (){},
                            child: Container(
                              width: 160,
                              height: 130,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text('Products', style: TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold, fontFamily: 'Gilroy-Regular'),),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){},
                            child: Container(
                              width: 160,
                              height: 130,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text('Cash register', style: TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold, fontFamily: 'Gilroy-Regular'),),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Container(
                        width: 325,
                        height: 130,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text('Analysis', style: TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold, fontFamily: 'Gilroy-Regular'),),
                        ),
                      ),
                      SizedBox(height: 10,)

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
