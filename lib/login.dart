import 'package:ambwproyek/admin/home.dart';
import 'package:ambwproyek/dapur/home.dart';
import 'package:ambwproyek/siginin.dart';
import 'package:ambwproyek/user/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool _isObscure = true;
  final EmailController = TextEditingController();
  final PasswordController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 7), child: Text("Loading...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void _signIn() async {
    try {
      final user = await _auth.signInWithEmailAndPassword(
          email: EmailController.text, password: PasswordController.text);
      final res = _auth.currentUser;
      String? uid = res?.uid;
      final result =
          await FirebaseFirestore.instance.collection('akun').doc(uid).get();

      if (user != null) {
        if (result.data()!['role'] == 'user') {
          String sendUID = result.id.toString();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserHome(passUID: sendUID),
              //resultdata nya di pasing buat catat di transaksi
            ),
          );
        } else if (result.data()!['role'] == 'admin') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Admin(),
            ),
          );
        } else if (result.data()!['role'] == 'dapur') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DapurHome(),
            ),
          );
        }
      } else {
        print("User not Signed in");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFF0BB62),
          title: Text('Masuk',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Image.asset(
                "asset/images/menu.png",
                fit: BoxFit.fitWidth,
                width: 240,
                height: 240,
                color: Colors.black,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Column(children: [
                  TextField(
                    controller: EmailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    obscureText: _isObscure,
                    obscuringCharacter: "*",
                    controller: PasswordController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscure
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(240, 188, 98, 1),
                      fixedSize: const Size(200, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    onPressed: () {
                      showLoaderDialog(context);
                      if (EmailController.text.isEmpty) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Error"),
                              content: Text("Email tidak boleh kosong"),
                              actions: <Widget>[
                                ElevatedButton(
                                  child: Text("OK"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                )
                              ],
                            );
                          },
                        );
                      } else if (EmailValidator.validate(
                              EmailController.text) !=
                          true) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Error"),
                              content: Text("Email tidak valid"),
                              actions: <Widget>[
                                ElevatedButton(
                                  child: Text("OK"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                )
                              ],
                            );
                          },
                        );
                      } else if (PasswordController.text.isEmpty) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Error"),
                              content: Text("Password tidak boleh kosong"),
                              actions: <Widget>[
                                ElevatedButton(
                                  child: Text("OK"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                )
                              ],
                            );
                          },
                        );
                      } else {
                        _signIn();
                      }
                    },
                    child: Text(
                      'Masuk',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  RichText(
                      text: TextSpan(
                    text: 'Tidak Memiliki Akun? ',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: 'Daftar',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignInScreen(),
                              ),
                            );
                          },
                      ),
                    ],
                  )),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
