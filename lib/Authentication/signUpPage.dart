import 'package:doctorconsultationproject/contants/Loading.dart';
import 'package:doctorconsultationproject/contants/textInputDecoration.dart';
import 'package:doctorconsultationproject/helper/helper_function.dart';
import 'SignInPage.dart';
import 'package:doctorconsultationproject/services/auth_services.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


class RegisterPage extends StatefulWidget {
  final Function toggleView;
  RegisterPage({this.toggleView});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  // text field state
  String fullName = '';
  String email = '';
  String password = '';
  String error = '';

  _onRegister() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });

      await _auth.registerWithEmailAndPassword(fullName, email, password).then((result) async {
        if (result != null) {
          await HelperFunctions.saveUserLoggedInSharedPreference(true);
          await HelperFunctions.saveUserEmailSharedPreference(email);
          await HelperFunctions.saveUserNameSharedPreference(fullName);

          print("Registered");
          await HelperFunctions.getUserLoggedInSharedPreference().then((value) {
            print("Logged in: $value");
          });
          await HelperFunctions.getUserEmailSharedPreference().then((value) {
            print("Email: $value");
          });
          await HelperFunctions.getUserNameSharedPreference().then((value) {
            print("Full Name: $value");
          });

          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SignInPage()));
        }
        else {
          setState(() {
            error = 'Error while Signing Up the user.';
            _isLoading = false;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading ? Loading() : Scaffold(
      body: Form(
          key: _formKey,
          child: Container(
            color: Colors.white,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 80.0),
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("ConsultDoctor", style: TextStyle(color: Colors.black, fontSize: 40.0, fontWeight: FontWeight.bold)),

                    SizedBox(height: 30.0),

                    Text("Sign Up", style: TextStyle(color: Colors.black, fontSize: 25.0)),

                    SizedBox(height: 20.0),

                    TextFormField(
                      style: TextStyle(color: Colors.black),
                      decoration: textInputDecoration.copyWith(labelText: 'Full Name'),
                      validator: (val){
                        if (val.length == 0)
                          return "Please enter valid name";
                        else
                          return null;
                      },
                      onChanged: (val) {
                        setState(() {
                          fullName = val;
                        });
                      },
                    ),

                    SizedBox(height: 15.0),

                    TextFormField(
                      style: TextStyle(color: Colors.black),
                      decoration: textInputDecoration.copyWith(labelText: 'Email'),
                      validator: (val) {
                        return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val) ? null : "Please enter a valid email";
                      },
                      onChanged: (val) {
                        setState(() {
                          email = val;
                        });
                      },
                    ),

                    SizedBox(height: 15.0),

                    TextFormField(
                      style: TextStyle(color: Colors.black),
                      decoration: textInputDecoration.copyWith(labelText: 'Password'),
                      validator: (val) => val.length < 6 ? 'Please enter a valid password' : null,
                      obscureText: true,
                      onChanged: (val) {
                        setState(() {
                          password = val;
                        });
                      },
                    ),

                    SizedBox(height: 20.0),

                    SizedBox(
                      width: double.infinity,
                      height: 50.0,
                      child: RaisedButton(
                          elevation: 0.0,
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                          child: Text('Register', style: TextStyle(color: Colors.black, fontSize: 16.0)),
                          onPressed: () {
                            _onRegister();
                          }
                      ),
                    ),

                    SizedBox(height: 10.0),

                    Text.rich(
                      TextSpan(
                        text: "Already have an account? ",
                        style: TextStyle(color: Colors.black, fontSize: 14.0),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Sign In',
                            style: TextStyle(color: Colors.black, decoration: TextDecoration.underline),
                            recognizer: TapGestureRecognizer()..onTap = () {
                              widget.toggleView();
                            },
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 10.0),

                    Text(error, style: TextStyle(color: Colors.red, fontSize: 14.0)),
                  ],
                ),
              ],
            ),
          )
      ),
    );
  }
}
