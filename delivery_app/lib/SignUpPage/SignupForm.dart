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

  final _formKey = GlobalKey<FormState>();

  bool _isObscure = true;
  bool _isPasswordEightCharacters = false;
  bool _hasPasswordOneNumber = false;
  bool _hasPasswordCapital = false;
  bool _hasspecialLetter = false;

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
  double password_strength = 0;

  bool validatePassword(String pass){
    String _password = pass.trim();

    if(_password.isEmpty){
      setState(() {
        password_strength = 0;
      });
    }else if(_password.length < 6 ){
      setState(() {
        password_strength = 1 / 4;
      });
    }else if(_password.length < 8){
      setState(() {
        password_strength = 2 / 4;
      });
    }else{
      if(pass_valid.hasMatch(_password)){
        setState(() {
          password_strength = 4 / 4;
        });
        return true;
      }else{
        setState(() {
          password_strength = 3 / 4;
        });
        return false;
      }
    }
    return false;
  }

  onPasswordChanged(String password) {
    final numericRegex = RegExp(r'[0-9]');
    RegExp letterReg = RegExp("^(?=.*[A-Z])");
    RegExp regex=RegExp(r'^(?=.*?[A-Z])(?=.*?[!@#\$&*~]).{8,}$');
    RegExp specialCharacters = RegExp(r'(?=.*?[#?!@$%^&*-])$');
    

    setState(() {
      _isPasswordEightCharacters = false;
      if(password.length >= 8) {
        _isPasswordEightCharacters = true;
      }

      _hasPasswordOneNumber = false;
      if(numericRegex.hasMatch(password)) {
        _hasPasswordOneNumber = true;
      }
      //(?=.*[@#$%^&+=])
      // (?=.*?[#?!@$%^&*-])
      _hasPasswordCapital = false;
      _hasspecialLetter = false;
      if(letterReg.hasMatch(password) || (specialCharacters.hasMatch(password))) {
        _hasPasswordCapital = true;
        _hasspecialLetter = true;
      }

    });
  }

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
            key: _formKey,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Center(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 80,),
                        Image.asset('assets/images/driver.png', height: 100,),
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
                            onChanged: (value){
                              _formKey.currentState!.validate();
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
                            //onChanged: (_password) => onPasswordChanged(_password),
                            onChanged: (_password){
                              _formKey.currentState!.validate();
                              onPasswordChanged(_password);
                            },
                            controller: _password,
                            obscureText: _isObscure,
                            validator: (_password){
                              if(_password!.isEmpty){
                                return "Please enter password";
                              }else{
                                //call function to check password
                                bool result = validatePassword(_password);
                                if(result){
                                  // create account event
                                  return null;
                                }else{
                                  //return " Password should contain Capital, small letter & Number & Special";
                                }
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
                        SizedBox(height: 10,),

                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: LinearProgressIndicator(
                            value: password_strength,
                            backgroundColor: Colors.grey[300],
                            minHeight: 5,
                            color: password_strength <= 1 / 4
                                ? Colors.red
                                : password_strength == 2 / 4
                                ? Colors.yellow
                                : password_strength == 3 / 4
                                ? Colors.blue
                                : Colors.green,
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.only(top: 7 ,left: 26),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  AnimatedContainer(
                                    duration: Duration(milliseconds: 500),
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        color: _isPasswordEightCharacters ?  Colors.green : Colors.transparent,
                                        border: _isPasswordEightCharacters ? Border.all(color: Colors.transparent) :
                                        Border.all(color: Colors.grey.shade400),
                                        borderRadius: BorderRadius.circular(50)
                                    ),
                                    child: Center(child: Icon(Icons.check, color: Colors.white, size: 15,),),
                                  ),
                                  SizedBox(width: 10,),
                                  Text("Has at least 8 characters",
                                    style: TextStyle(
                                        color: Color.fromRGBO(92, 97, 111, 1),
                                        fontFamily: 'Inter-Regular',
                                        fontSize: 13,
                                        letterSpacing: -0.11999999731779099,
                                        height: 1.3846153846153846
                                    ),)
                                ],
                              ),
                              SizedBox(height: 5,),
                              Row(
                                children: <Widget>[
                                  AnimatedContainer(
                                    duration: Duration(milliseconds: 500),
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        color: _hasPasswordCapital || _hasspecialLetter ?  Colors.green : Colors.transparent,
                                        border: _hasPasswordCapital || _hasspecialLetter ? Border.all(color: Colors.transparent) :
                                        Border.all(color: Colors.grey.shade400),
                                        borderRadius: BorderRadius.circular(50)
                                    ),
                                    child: Center(child: Icon(Icons.check, color: Colors.white, size: 15,),),
                                  ),
                                  SizedBox(width: 10,),
                                  Text("Has an upper case letter or symbol",
                                    style: TextStyle(
                                        color: Color.fromRGBO(92, 97, 111, 1),
                                        fontFamily: 'Inter-Regular',
                                        fontSize: 13,
                                        letterSpacing: -0.11999999731779099,
                                        height: 1.3846153846153846
                                    ),)
                                ],
                              ),
                              SizedBox(height: 5,),
                              Row(
                                children: <Widget>[
                                  AnimatedContainer(
                                    duration: Duration(milliseconds: 500),
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        color: _hasPasswordOneNumber ?  Colors.green : Colors.transparent,
                                        border: _hasPasswordOneNumber ? Border.all(color: Colors.transparent) :
                                        Border.all(color: Colors.grey.shade400),
                                        borderRadius: BorderRadius.circular(50)
                                    ),
                                    child: Center(child: Icon(Icons.check, color: Colors.white, size: 15,),),
                                  ),
                                  SizedBox(width: 10,),
                                  Text("Has a number",
                                    style: TextStyle(
                                        color: Color.fromRGBO(92, 97, 111, 1),
                                        fontFamily: 'Inter-Regular',
                                        fontSize: 13,
                                        letterSpacing: -0.11999999731779099,
                                        height: 1.3846153846153846
                                    ),)
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
                              onPressed: password_strength != 1 ? null : (){
                                checkif_fields_are_empty();
                              },
                              child: const Text('Continue',
                                style: TextStyle(
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
