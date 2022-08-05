import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:delivery_app/comHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileInfoPage extends StatefulWidget {
  const ProfileInfoPage({Key? key}) : super(key: key);

  @override
  State<ProfileInfoPage> createState() => _ProfileInfoPageState();
}

class _ProfileInfoPageState extends State<ProfileInfoPage> {

  bool volNotify1 = true;
  bool volNotify2 = false;
  bool volNotify3 = false;

  // controllers
  final userfullName = TextEditingController();
  final userShopName = TextEditingController();
  final userEmail = TextEditingController();
  final userPhoneno = TextEditingController();
  String usercountrycode = "";

  bool _isObscure = true;
  String countrycode = '';


  Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
  }

  Future<void> getUserData() async {
    final SharedPreferences sp = await _pref;

    setState((){
      userShopName.text = sp.getString("driver_shopname")!;
      userfullName.text = sp.getString("driver_name")!;
      userEmail.text = sp.getString("driver_email")!;
      usercountrycode = sp.getString("driver_countrycode")!;
      userPhoneno.text = sp.getString("driver_phoneno")!;
    });
  }


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
                        backgroundColor:  Color.fromRGBO(43, 136, 216, 1),
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
                        controller: userfullName,
                        style: TextStyle(
                            color: Color.fromRGBO(4, 12, 34, 1),
                            fontFamily: 'Inter-Regular',
                            fontSize: 17,
                            letterSpacing: -0.4000000059604645,
                            height: 1.411764705882353
                        ),
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
                          suffixIcon: Icon(Icons.edit),
                          labelText: 'Full name',
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
                        controller: userShopName,
                        style: TextStyle(
                            color: Color.fromRGBO(4, 12, 34, 1),
                            fontFamily: 'Inter-Regular',
                            fontSize: 17,
                            letterSpacing: -0.4000000059604645,
                            height: 1.411764705882353
                        ),
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          suffixIcon: Icon(Icons.edit),
                          labelText: 'Shop name',
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
                              initialSelection: usercountrycode,
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
                                controller: userPhoneno,
                                style: TextStyle(
                                    color: Color.fromRGBO(4, 12, 34, 1),
                                    fontFamily: 'Inter-Regular',
                                    fontSize: 17,
                                    letterSpacing: -0.4000000059604645,
                                    height: 1.411764705882353
                                ),
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
                        controller: userEmail,
                        style: TextStyle(
                            color: Color.fromRGBO(4, 12, 34, 1),
                            fontFamily: 'Inter-Regular',
                            fontSize: 17,
                            letterSpacing: -0.4000000059604645,
                            height: 1.411764705882353
                        ),
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
                          suffixIcon: Icon(Icons.edit),
                          labelText: 'Email',
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5,),
                  Center(
                    child: Container(
                      child: TextButton(
                        child: Text("Change Password"),
                        onPressed: (){},
                      ),
                    ),
                  ),

                  Center(
                    child: Container(
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
                                letterSpacing: -0.4000000059604645,
                              )
                          ),
                          onPressed: (){
                            //checkif_fields_are_empty();
                            //login();
                          },
                          child: const Text('Update Info',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                            ),
                          ),
                        )
                    ),
                  ),
    ],
              ),
            ),
          ),
        )
    );
  }

}
