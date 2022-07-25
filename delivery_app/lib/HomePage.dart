import 'package:delivery_app/SettingsScreen.dart';
import 'package:delivery_app/TreasuryPages/TresuryPage.dart';
import 'package:delivery_app/clientpages/clientpages.dart';
import 'package:delivery_app/productPages/allProducts.dart';
import 'package:delivery_app/purchasePages/purchasePage.dart';
import 'package:delivery_app/sellspages/SellsScreen.dart';
import 'package:delivery_app/suplierPages/suplierPage.dart';
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
    return SafeArea(
      child: Scaffold(
        body: Container(
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
                          title: Text('$userShopName',
                              style: TextStyle(
                              fontSize: 22,
                              letterSpacing: 0,
                              color: Colors.white,
                              fontFamily: 'Inter-Regular',
                              height: 1.2727272727272727
                          )
                          ),
                          subtitle: Text('Version',
                              style: TextStyle(
                                  fontSize: 16,
                                  letterSpacing: 0,
                                  color: Colors.white,
                                  fontFamily: 'Inter-Regular'
                              )
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_)=>const SettingsScreen()));
                        },
                          child: Icon(Icons.settings_outlined, color: Colors.white)
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
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
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Center(
                                  child: Text('Client',
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Inter-Regular',
                                        height: 1.75,
                                        letterSpacing: 0
                                    ),),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (_)=>const SellsScreen()));
                              },
                              child: Container(
                                width: 160,
                                height: 130,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Center(
                                  child: Text('Sells',
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Inter-Regular',
                                        height: 1.75,
                                        letterSpacing: 0
                                    ),
                                  ),
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
                              onTap: (){
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (_)=>const PurchasePage()));
                              },
                              child: Container(
                                width: 160,
                                height: 130,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text('Purchase', style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Inter-Regular',
                                      height: 1.75,
                                      letterSpacing: 0
                                  ),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (_)=>const SuplierPage()));
                              },
                              child: Container(
                                width: 160,
                                height: 130,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text('Supplier', style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Inter-Regular',
                                      height: 1.75,
                                      letterSpacing: 0
                                  ),),
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
                              onTap: (){
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (_)=>const AllProducts()));
                              },
                              child: Container(
                                width: 160,
                                height: 130,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text('Products', style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Inter-Regular',
                                      height: 1.75,
                                      letterSpacing: 0
                                  ),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (_)=>const TresuryPage()));
                              },
                              child: Container(
                                width: 160,
                                height: 130,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text('Tresury', style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Inter-Regular',
                                      height: 1.75,
                                      letterSpacing: 0
                                  ),
                                  ),
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
                            child: Text('Analysis', style: TextStyle(
                                fontSize: 22,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Inter-Regular',
                                height: 1.75,
                                letterSpacing: 0
                            ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,)

                      ],
                    ),
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
