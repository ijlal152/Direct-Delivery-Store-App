import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:delivery_app/comHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ProfileInfoPage extends StatefulWidget {
  const ProfileInfoPage({Key? key}) : super(key: key);

  @override
  State<ProfileInfoPage> createState() => _ProfileInfoPageState();
}

class _ProfileInfoPageState extends State<ProfileInfoPage> {

  bool volNotify1 = true;
  bool volNotify2 = false;
  bool volNotify3 = false;

  bool _isObscure = true;
  String countrycode = '';

  void _onCountryChange(CountryCode countryCode) {
    countrycode = countryCode.toString();
    print("New Country selected: $countrycode");
  }

  //late String finalnumber = countrycode + _phoneno.text;

  File? _image;

  Future _imgFromCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if(image == null) return;
      final imageTemp = File(image.path);
      setState(() => this._image = imageTemp);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }

  Future _imgFromGallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image == null) return;
      final imageTemp = File(image.path);
      setState(() => this._image = imageTemp);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }


  onChangeFunction1(bool newValue1){
    setState((){
      volNotify1 = newValue1;
    });
  }
  onChangeFunction2(bool newValue2){
    setState((){
      volNotify2 = newValue2;
    });
  }
  onChangeFunction3(bool newValue3){
    setState((){
      volNotify3 = newValue3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text('Profile Info', style: TextStyle(fontFamily: 'Inter-Regular'),),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            
             actions: [
               Container(
                 margin: EdgeInsets.only(right: 10),
                   child: Icon(Icons.logout_outlined, color: Colors.black, size: 30,)
               ),
             ],
            
          ),
          body: Container(
            padding: EdgeInsets.all(10),
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
              child: ListView(
                children: [
                  Center(
                    child: GestureDetector(
                      onTap: (){
                        _showPicker(context);
                      },

                      child: CircleAvatar(
                        radius: 55,
                        backgroundColor:  Color(0xffFDCF09),
                        child: _image != null ? ClipOval(
                          child: Image.file(_image!, width: 100, height: 100,fit: BoxFit.cover),
                        )
                            : Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(50)),
                          width: 100,
                          height: 100,
                          child: Icon(Icons.camera_alt, color: Colors.grey[800],),
                          ),
                        ),
                      ),
                    ),
                  Divider(height: 15,),
                  Center(
                    child: Container(
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
                        //controller: _fullname,
                        keyboardType: TextInputType.text,
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
                          hintText: 'Full name',
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      margin: EdgeInsets.only(top: 10.0),
                      child: TextFormField(
                        style: TextStyle(
                            color: Color.fromRGBO(4, 12, 34, 1),
                            fontFamily: 'Inter-Regular',
                            fontSize: 17,
                            letterSpacing: -0.4000000059604645,
                            height: 1.411764705882353
                        ),
                        //controller: _shopname,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          prefixIcon: Icon(Icons.shop),
                          hintText: 'Shop name',
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
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
                              //initialSelection: 'PK',
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
                              width: 215,
                              //margin: EdgeInsets.only(top: 10.0),
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
                  ),
                  Center(
                    child: Container(
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
                            return alertDialog(context, 'Please enter email');
                          }
                          if(!validateEmail(value)){
                            return alertDialog(context, 'Please enter a valid email');
                          }
                          return null;
                        },
                        onChanged: (value){
                          //_formKey.currentState!.validate();
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
                          prefixIcon: Icon(Icons.email),
                          hintText: 'Email',
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
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
                        //onChanged: (_password) => onPasswordChanged(_password),
                        onChanged: (_password){
                          //_formKey.currentState!.validate();
                          //onPasswordChanged(_password);
                        },
                        //controller: _password,
                        obscureText: _isObscure,
                        validator: (_password){
                          if(_password!.isEmpty){
                            return "Please enter password";
                          }else{
                            //call function to check password
                            //bool result = validatePassword(_password);
                            // if(result){
                            //   // create account event
                            //   return null;
                            // }else{
                            //   //return " Password should contain Capital, small letter & Number & Special";
                            // }
                          }
                        },
                        decoration:  InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(
                                _isObscure ? Icons.visibility : Icons.visibility_off
                            ),
                            onPressed: (){
                              setState((){
                                _isObscure =! _isObscure;
                              });
                            },

                          ),
                          hintText: 'Password',
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                    ),
                  ),
    ],
              ),
            ),
          ),
        )
    );
  }
  
  Padding buildNotificationsOption(String title, bool value, Function onChangeMethod){
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.grey[600]
          ),),
          Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
                activeColor: Colors.blue,
              trackColor: Colors.grey,
              value: value,
              onChanged: (bool newValue){
                onChangeMethod(newValue);
              },
            ),
          )
        ],
      ),
    );
  }
  
  
  GestureDetector builAccountOption(BuildContext context, String title){
    return GestureDetector(
      onTap: (){
        showDialog(context: context, builder: (BuildContext context){
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Option 1'),
                Text('Option 2'),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: (){},
                  child: Text('Close')
              ),
            ],
          );
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600]
            ),),
            Icon(Icons.arrow_forward, color: Colors.grey,)
          ],
        ),
      ),
    );
  }
}
