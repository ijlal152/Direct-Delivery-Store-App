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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text('$userShopName'),
          leading: const Icon(Icons.person, size: 40,),
          actions: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.settings),
            ),
          ],
        ),
        body: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 15,),
                Container(
                  width: 325,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.green,
                      borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Center(
                    child: Text('Dashboard', style: TextStyle(fontSize: 26, color: Colors.white, fontWeight: FontWeight.bold),),
                  ),
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    InkWell(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_)=>const ClientScreen()));
                      },
                      child: Container(
                        width: 150,
                        height: 130,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Center(
                          child: Text('Client', style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_)=>const SellsScreen()));
                      },
                      child: Container(
                        width: 150,
                        height: 130,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Center(
                          child: Text('Sells', style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      width: 150,
                      height: 130,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Center(
                        child: Text('Purchase', style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),),
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 130,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Center(
                        child: Text('Supliers', style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      width: 150,
                      height: 130,
                      child: Center(
                        child: Text('Products', style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 130,
                      child: Center(
                        child: Text('Cash register', style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
