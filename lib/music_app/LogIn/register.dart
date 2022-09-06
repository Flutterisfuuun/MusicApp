import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_app/music_app/LogIn/log.dart';
import 'package:my_app/music_app/LogIn/socialSignWidget.dart';
import 'package:my_app/music_app/bottom_nav_bar.dart';

import '../homepage.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _Log_iState createState() => _Log_iState();
}

class _Log_iState extends State<Register> {
  List a = [
    ["", "Gmail"],
    ["", "Password"],
    ["", "FirstName"],
    ["", "LastName"],
  ];

  @override
  final _loginKey = GlobalKey<FormState>();
  bool isChecked = false;
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  String text = "";
  late Box box2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createOpenBox();
  }

  void createOpenBox() async {
    box2 = await Hive.openBox('registerData');
    getdata();
  }

  void getdata() async {
    if (box2.get('First name') != null) {
      firstname.text = box2.get('First name');
      isChecked = true;
      setState(() {});
    }
    if (box2.get('pass') != null) {
      lastname.text = box2.get('Last Name');
      isChecked = true;
      setState(() {});
    }

    if (box2.get('pass') != null) {
      email.text = box2.get('email');
      isChecked = true;
      setState(() {});
    }
    if (box2.get('pass') != null) {
      pass.text = box2.get('pass');
      isChecked = true;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
          child: IconButton(
            icon: Icon(
              Icons.home_filled,
            ),
            onPressed: () {
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Bottom_Nav_Bar(),
                  ),
                );
              });
            },
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  CachedNetworkImage(
                    alignment: Alignment.center,
                    width: 200,
                    height: 200,
                    imageUrl:
                        "https://media.istockphoto.com/videos/beautiful-black-background-of-neon-musical-note-icon-video-id1211986724?s=640x640",
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: TextField(
                      controller: firstname,
                      decoration: InputDecoration(
                        hintText: 'First Name',
                        hintStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.blue.shade400,
                            )),
                        isDense: true, // Added this
                        contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                      ),
                      cursorColor: Colors.white,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: TextField(
                      controller: lastname,
                      decoration: InputDecoration(
                        hintText: 'Last Name',
                        hintStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.blue.shade400,
                            )),
                        isDense: true, // Added this
                        contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                      ),
                      cursorColor: Colors.white,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: TextField(
                      controller: email,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.blue.shade400,
                            )),
                        isDense: true, // Added this
                        contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                      ),
                      cursorColor: Colors.white,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: TextField(
                      controller: pass,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.blue.shade400,
                            )),
                        isDense: true, // Added this
                        contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                      ),
                      cursorColor: Colors.white,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),

                  ///can't make to work
                  // Form(
                  //     key: _loginKey,
                  //     child: Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         for (int i = 0; i < a.length; i++)
                  //           InputUsers(i, a[i][1]),
                  //       ],
                  //     )),
                  GestureDetector(
                    onTap: () {
                      print("Login Clicked Event");
                      print(pass.text);
                      print(email.text);
                      Register();
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Container(
                        width: 150,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.red[900],
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: Text(
                            "Login",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SocialSignWidgetRow(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Log_i()));
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(color: Colors.black),
            child: RichText(
              text: const TextSpan(
                  text: 'Already Logged in! ',
                  style: TextStyle(fontSize: 15.0, color: Colors.white),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Log In',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Color(0XFF4321F5)),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
/////DukanInfo()
  ///
  // void logInOpen(BuildContext context) async {
  //   if (_loginKey.currentState!.validate()) {
  //     _loginKey.currentState!.save();
  //     AydymInfo()
  //   }
  // }

  void Register() {
    if (isChecked) {
      box2.put('firstname', firstname.value.text);
      box2.put('lastname', lastname.value.text);
      box2.put('email', email.value.text);
      box2.put('pass', pass.value.text);
    }
  }

  AydymInfo() {}
}
