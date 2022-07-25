import 'package:country_code_picker/country_code_picker.dart';
import 'package:delivery_app/comHelper.dart';
import 'package:flutter/material.dart';

class AddSuplier extends StatefulWidget {
  const AddSuplier({Key? key}) : super(key: key);

  @override
  State<AddSuplier> createState() => _AddSuplierState();
}

class _AddSuplierState extends State<AddSuplier> {

  bool _isObscure = true;
  String countrycode = '';

  void _onCountryChange(CountryCode countryCode) {
    countrycode = countryCode.toString();
    print("New Country selected: $countrycode");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: const Text('Add Supplier', style: TextStyle(color: Colors.black, fontFamily: 'Inter-Regular'),),
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
                        return alertDialog(context, 'Please enter name');
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
                      prefixIcon: Icon(Icons.person),
                      hintText: 'Name',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  margin: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: CountryCodePicker(
                          initialSelection: 'PK',
                          onChanged: _onCountryChange,
                          textStyle: TextStyle(
                              color: Color.fromRGBO(4, 12, 34, 1),
                              fontFamily: 'Inter-Regular',
                              fontSize: 14,
                              letterSpacing: -0.4000000059604645,
                              height: 1.411764705882353
                          ),
                        ),
                      ),

                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          width: 217,
                          child: TextFormField(
                            style: TextStyle(
                                color: Color.fromRGBO(4, 12, 34, 1),
                                fontFamily: 'Inter-Regular',
                                fontSize: 17,
                                letterSpacing: -0.4000000059604645,
                                height: 1.411764705882353
                            ),
                            //controller: _phoneno,
                            keyboardType: const TextInputType.numberWithOptions(signed: true, decimal: true),
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.phone_android),
                              hintText: 'Phone no',
                            ),
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
                    keyboardType: TextInputType.emailAddress,
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return alertDialog(context, 'Please enter name');
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
                      suffixIcon: Icon(Icons.my_location),
                      hintText: 'GPS Locaion (Ex: 36.710343, 3.198756)',
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
                        return alertDialog(context, 'Please enter initial balance');
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
                      hintText: 'Initial Balance',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(height: 240,),

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
                            fontFamily: 'Inter-Regular',
                          )
                      ),
                      onPressed: (){
                        //checkif_fields_are_empty();
                        //login();
                      },
                      child: const Text('Add Client',
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
    ));
  }
}
