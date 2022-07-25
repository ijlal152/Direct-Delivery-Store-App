import 'package:country_code_picker/country_code_picker.dart';
import 'package:delivery_app/comHelper.dart';
import 'package:flutter/material.dart';

class AddProducts extends StatefulWidget {
  const AddProducts({Key? key}) : super(key: key);

  @override
  State<AddProducts> createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: const Text('Add Product', style: TextStyle(color: Colors.black, fontFamily: 'Inter-Regular'),),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black,),
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(232, 235, 245, 1),
                  Color.fromRGBO(251, 252, 255, 1),
                ]
            ),
          ),
          child: Form(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 70,),
                  Container(
                    child: Image.asset('assets/images/products-icon2.png', height: 100,),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    margin: const EdgeInsets.only(top: 10.0),
                    child: TextFormField(
                      style: TextStyle(
                          color: Color.fromRGBO(4, 12, 34, 1),
                          fontFamily: 'Inter-Regular',
                          fontSize: 17,
                          letterSpacing: -0.4000000059604645,
                          height: 1.411764705882353
                      ),
                      //controller: _email,
                      keyboardType: TextInputType.text,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return alertDialog(context, 'Please enter name of product');
                        }
                        return null;
                      },
                      //onSaved: (val) => _email.text = val!,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'Product name'
                      ),
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    margin: const EdgeInsets.only(top: 10.0),
                    child: TextFormField(
                      style: TextStyle(
                          color: Color.fromRGBO(4, 12, 34, 1),
                          fontFamily: 'Inter-Regular',
                          fontSize: 17,
                          letterSpacing: -0.4000000059604645,
                          height: 1.411764705882353
                      ),
                      //controller: _email,
                      keyboardType: TextInputType.text,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return alertDialog(context, 'Please enter product SKU');
                        }
                        return null;
                      },
                      //onSaved: (val) => _email.text = val!,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        labelText: 'Product SKU',
                        fillColor: Colors.white,
                        filled: true,
                        suffixIcon: Icon(Icons.qr_code),
                      ),
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    margin: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          //padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          //margin: const EdgeInsets.only(top: 10.0),
                          width: 150,
                          child: TextFormField(
                            style: TextStyle(
                                color: Color.fromRGBO(4, 12, 34, 1),
                                fontFamily: 'Inter-Regular',
                                fontSize: 17,
                                letterSpacing: -0.4000000059604645,
                                height: 1.411764705882353
                            ),
                            //controller: _email,
                            keyboardType: TextInputType.number,
                            validator: (value){
                              if(value == null || value.isEmpty){
                                return alertDialog(context, 'Please enter purchase price');
                              }
                              return null;
                            },
                            //onSaved: (val) => _email.text = val!,
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Colors.transparent),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                              labelText: 'Product Price',
                              fillColor: Colors.white,
                              filled: true,
                            ),
                          ),
                        ),

                        Container(
                          //padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          //margin: const EdgeInsets.only(top: 10.0),
                          width: 150,
                          child: TextFormField(
                            style: TextStyle(
                                color: Color.fromRGBO(4, 12, 34, 1),
                                fontFamily: 'Inter-Regular',
                                fontSize: 17,
                                letterSpacing: -0.4000000059604645,
                                height: 1.411764705882353
                            ),
                            //controller: _email,
                            keyboardType: TextInputType.number,
                            validator: (value){
                              if(value == null || value.isEmpty){
                                return alertDialog(context, 'Please enter selling price');
                              }
                              return null;
                            },
                            //onSaved: (val) => _email.text = val!,
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Colors.transparent),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                              labelText: 'Selling Price',
                              fillColor: Colors.white,
                              filled: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    margin: const EdgeInsets.only(top: 10.0),
                    child: TextFormField(
                      style: TextStyle(
                          color: Color.fromRGBO(4, 12, 34, 1),
                          fontFamily: 'Inter-Regular',
                          fontSize: 17,
                          letterSpacing: -0.4000000059604645,
                          height: 1.411764705882353
                      ),
                      //controller: _email,
                      keyboardType: TextInputType.number,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return alertDialog(context, 'Please enter initial quantity of units');
                        }
                        return null;
                      },
                      //onSaved: (val) => _email.text = val!,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        //suffixIcon: Icon(Icons.my_location),
                        labelText: 'Initial Quantity of units',
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    margin: const EdgeInsets.only(top: 10.0),
                    child: TextFormField(
                      style: TextStyle(
                          color: Color.fromRGBO(4, 12, 34, 1),
                          fontFamily: 'Inter-Regular',
                          fontSize: 17,
                          letterSpacing: -0.4000000059604645,
                          height: 1.411764705882353
                      ),
                      //controller: _email,
                      keyboardType: TextInputType.number,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return alertDialog(context, 'Please enter initial quantity of units');
                        }
                        return null;
                      },
                      //onSaved: (val) => _email.text = val!,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        //suffixIcon: Icon(Icons.my_location),
                        labelText: 'Quantity per Package',
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    margin: const EdgeInsets.only(top: 10.0),
                    child: TextFormField(
                      style: TextStyle(
                          color: Color.fromRGBO(4, 12, 34, 1),
                          fontFamily: 'Inter-Regular',
                          fontSize: 17,
                          letterSpacing: -0.4000000059604645,
                          height: 1.411764705882353
                      ),
                      //controller: _email,
                      keyboardType: TextInputType.number,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return alertDialog(context, 'Please enter initial quantity of packages');
                        }
                        return null;
                      },
                      //onSaved: (val) => _email.text = val!,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        //suffixIcon: Icon(Icons.my_location),
                        labelText: 'Initial Quantity of Packages',
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),
                  //SizedBox(height: 130,),

                  Container(
                      height: 56,
                      margin: EdgeInsets.all(30.0),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: ElevatedButton(
                        style:  ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(43, 136, 216, 1),
                            textStyle: TextStyle(
                              fontFamily: 'Gilroy-Regular',
                            )
                        ),
                        onPressed: (){
                          //checkif_fields_are_empty();
                          //login();
                        },
                        child: const Text('Add Product',
                          style: TextStyle(
                            fontSize: 21,
                            color: Colors.white,
                            //fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
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
