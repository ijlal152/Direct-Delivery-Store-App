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
      await dbHelper.saveData(uModel, uModel.D_Email).then((userData){
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
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [
            Container(
              width: 89,
              height: 25,
              margin: const EdgeInsetsDirectional.only(top: 17, end: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(child: Text('Step 2 of 2',
                style: TextStyle(
                  fontSize: 13,
                  color: Color.fromRGBO(54, 61, 78, 1),
                  fontFamily: 'Inter-SemiBold',
                  letterSpacing: -0.11999999731779099,
                  height: 1.3846153846153846,

                ),
              )),
            ),
          ],
          elevation: 0.0,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
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
            key: formkey,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Center(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 80,),

                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          margin: const EdgeInsetsDirectional.only(start: 25),
                          child: const Text('Sign Up',
                            style: TextStyle(
                              fontFamily: 'Inter-Bold',
                              color: Color.fromRGBO(4, 12, 34, 1),
                              fontSize: 32,
                              height: 1.1875,
                              letterSpacing: -0.23999999463558197,
                            ),
                          ),
                        ),
                      ),

                      Container(
                          margin: const EdgeInsetsDirectional.only(start: 22, end: 22),
                          child: const Text('We ask for your information to keep your data '
                              'safe and secure',
                            style: TextStyle(
                              fontFamily: 'Inter-Regular',
                              fontSize: 15,
                              letterSpacing: -0.20000000298023224,
                              color: Color.fromRGBO(54, 61, 78, 1),
                                height: 1.4666666666666666
                            ),)
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
                          controller: _fullname,
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

                      Container(
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
                          controller: _shopname,
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
                                  controller: _phoneno,
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
                          controller: _address,
                          //maxLines: 3,
                          //expands: true,
                          minLines: 1,
                          maxLines: 5,  // allow user to enter 5 line in textfield
                          keyboardType: TextInputType.multiline,
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            prefixIcon: Icon(Icons.home),
                            hintText: 'Address',
                            fillColor: Colors.white,
                            filled: true,
                          ),
                        ),
                      ),

                      SizedBox(height: 80,),

                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Already have an account ? ',
                              style: TextStyle(
                                fontFamily: 'Inter-SemiBold',
                                fontSize: 15,
                                letterSpacing: -0.20000000298023224,
                                height: 1.4666666666666666,
                                fontWeight: FontWeight.normal,
                                color: Color.fromRGBO(0, 147, 185, 1),
                              ),
                            ),
                            TextButton(
                              onPressed: (){
                                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                const LoginForm()), (Route<dynamic> route) => false);
                              },
                              child: const Text('Sign In here',
                                style: TextStyle(
                                  fontFamily: 'Inter-SemiBold',
                                  fontSize: 15,
                                  letterSpacing: -0.20000000298023224,
                                  height: 1.4666666666666666,
                                  fontWeight: FontWeight.normal,
                                  color: Color.fromRGBO(0, 147, 185, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        margin: const EdgeInsetsDirectional.only(start: 22, end: 22),
                        child:  Text.rich(
                          style: TextStyle(
                            fontSize: 14,
                          ),
                          TextSpan(
                              text: 'By using our mobile app, you agree to our ',
                              style: TextStyle(
                                fontFamily: 'Gilroy-Regular',
                              ),
                              children: [
                                TextSpan(
                                    text: 'Term of Use',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                    )
                                ),
                                TextSpan(text: ' and '),
                                TextSpan(
                                    text: 'Privacy Policy',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                    )
                                ),
                              ]
                          ),
                        ),
                      ),

                      Container(
                        // rgba(43, 136, 216, 1)
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
                              registerAccount();
                            },
                            child: const Text('Continue',
                              style: TextStyle(
                                //fontFamily: 'Gilroy-Regular',
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
        ),
      ),
    );
  }
}
