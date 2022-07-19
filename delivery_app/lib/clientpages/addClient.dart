import 'package:delivery_app/comHelper.dart';
import 'package:flutter/material.dart';

class AddClient extends StatefulWidget {
  const AddClient({Key? key}) : super(key: key);

  @override
  State<AddClient> createState() => _AddClientState();
}

class _AddClientState extends State<AddClient> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Container(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 30,),
                  const Text('Add Client',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    margin: EdgeInsets.only(top: 10.0),
                    child: TextFormField(
                      //controller: _uemail,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return alertDialog(context, 'Please enter name');
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        prefixIcon: Icon(Icons.person),
                        hintText: 'Client name',
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    margin: EdgeInsets.only(top: 10.0),
                    child: TextFormField(
                      //controller: _uemail,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return alertDialog(context, 'Please enter phone no');
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        prefixIcon: Icon(Icons.phone_android),
                        hintText: 'Phone no',
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    margin: EdgeInsets.only(top: 10.0),
                    child: TextFormField(
                      //controller: _uemail,
                      keyboardType: TextInputType.number,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return alertDialog(context, 'Please enter initial balance');
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        prefixIcon: Icon(Icons.money),
                        hintText: 'Initial balance ammount',
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    margin: EdgeInsets.only(top: 10.0),
                    child: TextFormField(
                      //controller: _uemail,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return alertDialog(context, 'Please enter address');
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        prefixIcon: Icon(Icons.home),
                        hintText: 'Address',
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),

                  ElevatedButton(
                      onPressed: (){},
                      child: const Text('GPS Position'),
                  ),
                  const SizedBox(height: 40,),

                  ElevatedButton(
                    onPressed: (){},
                    child: const Text('Add Client'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
