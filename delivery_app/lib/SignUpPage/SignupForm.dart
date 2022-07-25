import 'package:delivery_app/LoginPage/LoginForm.dart';
import 'package:delivery_app/SignUpPage/SignupFormTwo.dart';
import 'package:delivery_app/comHelper.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {

  bool _isObscure = true;

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  checkif_fields_are_empty(){
    if(_email.text.isEmpty){
      alertDialog(context, "Please enter email");
    }else if(_password.text.isEmpty){
      alertDialog(context, "Please enter password");
    }else{
      Navigator.push(context,
          MaterialPageRoute(builder: (context)=>SignupFormTwo(email: _email.text, password: _password.text)));
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
              height: 28,
              margin: const EdgeInsetsDirectional.only(start: 12 ,top: 25, end: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(child: Text('Step 1 of 2',
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
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Center(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 80,),
                        Image.asset('assets/images/driver.png', height: 110,),
                        const SizedBox(height: 25,),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            margin: const EdgeInsetsDirectional.only(start: 25),
                            child: const Text('Sign Up',
                              style: TextStyle(
                                fontFamily: 'Inter-Bold',
                                color: Color.fromRGBO(4, 12, 34, 1),
                                letterSpacing: -0.23999999463558197,
                                fontSize: 32,
                                  height: 1.1875
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5,),

                        Container(
                            margin: const EdgeInsetsDirectional.only(start: 22, end: 22),
                            child: const Text('We ask for your information to keep your data '
                                'safe and secure',
                            style: TextStyle(
                              fontFamily: 'Inter-Regular',
                              color: Color.fromRGBO(54, 61, 78, 1),
                              letterSpacing: -0.20000000298023224,
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
                            controller: _email,
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
                            onSaved: (val) => _email.text = val!,
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
                            controller: _password,
                            obscureText: _isObscure,
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
                        SizedBox(height: 10,),

                        Container(
                          margin: EdgeInsets.only(top: 7 ,left: 26),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Icon(Icons.check, color: Colors.green,),
                                  SizedBox(width: 7,),
                                  Text('Has at least 8 characters',
                                  style: TextStyle(
                                    color: Color.fromRGBO(92, 97, 111, 1),
                                    fontFamily: 'Inter-Regular',
                                    fontSize: 13,
                                    letterSpacing: -0.11999999731779099,
                                      height: 1.3846153846153846
                                  ),),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(Icons.check, color: Colors.green,),
                                  SizedBox(width: 7,),
                                  Text('Has an uppercase letter or symbol',
                                    style: TextStyle(
                                        color: Color.fromRGBO(92, 97, 111, 1),
                                        fontFamily: 'Inter-Regular',
                                        fontSize: 13,
                                        letterSpacing: -0.11999999731779099,
                                        height: 1.3846153846153846
                                    ),),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(Icons.check, color: Colors.green,),
                                  SizedBox(width: 7,),
                                  Text('Has a number',
                                    style: TextStyle(
                                        color: Color.fromRGBO(92, 97, 111, 1),
                                        fontFamily: 'Inter-Regular',
                                        fontSize: 13,
                                        letterSpacing: -0.11999999731779099,
                                        height: 1.3846153846153846
                                    ),),
                                ],
                              ),
                            ],
                          ),
                        ),


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
                                  fontSize: 13,
                                  fontFamily: 'Inter-Regular',
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
                            width: 359.2640075683594,
                          height: 56,
                            margin: EdgeInsets.all(30.0),
                            //width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              //color: Color.fromRGBO(43, 136, 216, 1),
                              //color: Color.fromRGBO(232, 235, 238, 1),
                              //color: Color.fromRGBO(43, 136, 216, 1),


                            ),
                            child: ElevatedButton(
                              style:  ElevatedButton.styleFrom(
                                primary: Color.fromRGBO(43, 136, 216, 1),
                                textStyle: TextStyle(
                                  fontFamily: 'Inter-Regular',
                                  letterSpacing: -0.4000000059604645,
                                  //fontSize: 17,
                                )
                              ),
                              onPressed: (){
                                checkif_fields_are_empty();
                              },
                              child: const Text('Continue',
                                style: TextStyle(
                                  //fontFamily: 'Gilroy-Regular',
                                  color: Colors.white,
                                  fontSize: 17,
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
