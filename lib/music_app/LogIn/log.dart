import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_app/music_app/LogIn/register.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_app/music_app/bottom_nav_bar.dart';

import '../homepage.dart';

class Log_i extends StatefulWidget {
  const Log_i({Key? key}) : super(key: key);

  @override
  _Log_iState createState() => _Log_iState();
}

class _Log_iState extends State<Log_i> {
  bool a = true;
  bool isChecked = false;
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  late Box box1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createOpenBox();
  }

  void createOpenBox() async {
    box1 = await Hive.openBox('logindata');
    getdata();
  }

  void getdata() async {
    if (box1.get('email') != null) {
      email.text = box1.get('email');
      isChecked = true;
      setState(() {});
    }
    if (box1.get('pass') != null) {
      pass.text = box1.get('pass');
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
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                    child: TextFormField(
                      controller: email,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email_outlined,
                        ),
                        prefixIconColor: Colors.white,

                        labelText: "Email",
                        hintText: "merjen.soyunowaa@gmail.com",
                        hintStyle: TextStyle(
                            color: Color.fromARGB(201, 255, 255, 255),
                            fontSize: 10),
                        labelStyle: const TextStyle(color: Colors.blue),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.blue)),
                        isDense: true,
                        // Added this
                        contentPadding:
                            const EdgeInsets.fromLTRB(10, 20, 10, 10),
                      ),
                      cursorColor: Colors.white,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 20),
                    child: TextFormField(
                      controller: pass,
                      obscureText: a,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              a = !a;
                            });
                          },
                          child: Icon(
                            a
                                ? Icons.remove_red_eye_outlined
                                : Icons.remove_red_eye_rounded,
                          ),
                        ),
                        suffixIconColor: Colors.white,
                        prefixIcon: Icon(
                          Icons.key_rounded,
                        ),
                        prefixIconColor: Colors.white,
                        hintText: 'Password',
                        labelText: "Password",
                        labelStyle: const TextStyle(color: Colors.blue),
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(201, 255, 255, 255),
                            fontSize: 10),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.blue)),
                        isDense: true,
                        // Added this
                        contentPadding:
                            const EdgeInsets.fromLTRB(10, 20, 10, 10),
                      ),
                      cursorColor: Colors.white,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Remember Me",
                        style: TextStyle(color: Colors.white),
                      ),
                      Checkbox(
                        // activeColor: Colors.white,
                        side: BorderSide(
                            color: Colors.white,
                            width: 1.0,
                            style: BorderStyle.solid),
                        value: isChecked,
                        onChanged: (value) {
                          isChecked = !isChecked;
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Forgot Password ? Reset Now",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  // HeightBox(10),
                  GestureDetector(
                    onTap: () {
                      print("Login Clicked Event");
                      print(pass.text);
                      print(email.text);
                      login();
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
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Register()));
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(color: Colors.black),
            child: RichText(
              text: const TextSpan(
                  text: 'New User?',
                  style: TextStyle(fontSize: 15.0, color: Colors.white),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' Register Now',
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

  void login() {
    if (isChecked) {
      box1.put('email', email.value.text);
      box1.put('pass', pass.value.text);
    }
  }
}
