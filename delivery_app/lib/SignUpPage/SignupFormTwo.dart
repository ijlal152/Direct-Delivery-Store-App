import 'package:country_code_picker/country_code_picker.dart';
import 'package:delivery_app/DbHelper.dart';
import 'package:delivery_app/LoginPage/LoginForm.dart';
import 'package:delivery_app/Model/UserModel.dart';
import 'package:delivery_app/comHelper.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class SignupFormTwo extends StatefulWidget {
  const SignupFormTwo({Key? key, required this.email, required this.password}) : super(key: key);

  final String email, password;

  @override
  State<SignupFormTwo> createState() => _SignupFormTwoState();
}

class _SignupFormTwoState extends State<SignupFormTwo> {

  final formkey = GlobalKey<FormState>();

  final TextEditingController _fullname = TextEditingController();
  final TextEditingController _shopname = TextEditingController();
  final TextEditingController _phoneno = TextEditingController();
  final TextEditingController _address = TextEditingController();

  var dbHelper;

  @override
  void initState(){
    super.initState();
    dbHelper = DbHelper();
  }

  bool _isObscure = true;
  String countrycode = '';

  void _onCountryChange(CountryCode countryCode) {
    countrycode = countryCode.toString();
    print("New Country selected: $countrycode");
  }

  late String finalnumber = countrycode + _phoneno.text;


  registerAccount() async{

    //final form = formkey.currentState;

    if(_fullname.text.isEmpty){
      alertDialog(context, "Please enter full name");
    }else if(_shopname.text.isEmpty){
      alertDialog(context, "Please enter shop name");
    }else if(_phoneno.text.isEmpty){
      alertDialog(context, "Please enter phone no");
    }else if(_address.text.isEmpty){
      alertDialog(context, "Please enter address");
    }

    if(formkey.currentState!.validate()){
      formkey.currentState!.save();
      UserModel uModel = UserModel(widget.email.toString(), widget.password.toString(), _fullname.text, _shopname.text, finalnumber.toString(), _address.text);
      await dbHelper.saveData(uModel).then((userData){
        alertDialog(context, "Account Registered");
      }).catchError((error){
        print(error);
        alertDialog(context, "Account registered");
      });

    }

  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50,),
                  Image.asset('assets/images/driver.png', height: 110,),
                  const SizedBox(height: 15,),

                  const Text('Register here',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    margin: const EdgeInsets.only(top: 10.0),
                    child: TextFormField(
                      controller: _fullname,
                      keyboardType: TextInputType.text,
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
                        hintText: 'Full name',
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    margin: EdgeInsets.only(top: 10.0),
                    child: TextFormField(
                      controller: _shopname,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        prefixIcon: Icon(Icons.shop),
                        hintText: 'Shop name',
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
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: CountryCodePicker(
                            initialSelection: 'PK',
                            onChanged: _onCountryChange,
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          width: 217,
                          //margin: EdgeInsets.only(top: 10.0),
                          child: TextFormField(
                            controller: _phoneno,
                            keyboardType: const TextInputType.numberWithOptions(signed: true, decimal: true),
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.phone_android),
                              hintText: 'Phone no',
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
                      controller: _address,
                      //maxLines: 3,
                      //expands: true,
                      minLines: 1,
                      maxLines: 5,  // allow user to enter 5 line in textfield
                      keyboardType: TextInputType.multiline,
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

                  Container(
                    margin: EdgeInsets.all(30.0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: ElevatedButton(
                      onPressed: (){
                        //showData();
                        registerAccount();
                      },
                      child: const Text('Register Account'),
                    ),
                  ),

                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have an account ? ',
                        ),
                        TextButton(
                            onPressed: (){
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (_)=>LoginForm()));
                            },
                            child: const Text('Login here')
                        ),
                      ],
                    ),
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
