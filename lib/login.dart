import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:offersapp/bottom_nav.dart';
import 'package:offersapp/admin.dart';
import 'SharedPref.dart';
import 'authenticationMethods.dart';
import 'home.dart';
import 'main.dart';
import 'register.dart';
import 'utils.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = new TextEditingController();

  TextEditingController password = new TextEditingController();

  AuthenticationMethods authenticationMethods = AuthenticationMethods();

  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    // TODO: implement build
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage("https://wallpapercave.com/wp/wp2385630.jpg"),
        )),
        child: Padding(
          padding: const EdgeInsets.only(right: 25, left: 25, top: 40),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0, left: 115.0),
                child: Text("Sign In",
                    style: TextStyle(
                      color: grey,
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                    )),
              ),
              Image.asset(
                "assets/onboarding2.png",
                width: 150,
                height: 150,
              ),
              TextField(
                controller: email,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: purple,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: purple,
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    labelText: "Email"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: TextField(
                  obscureText: _isObscure,
                  controller: password,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        color: purple,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: purple,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      labelText: "Password",
                      suffixIcon: IconButton(
                          icon: Icon(
                            _isObscure
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: purple,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          })),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60.0, left: 40, right: 40),
                child: Container(
                  height: 50,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0)),
                    color: purple,
                    child: Text(
                      "SIGN IN ",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    onPressed: () async {
                      String output = await authenticationMethods.login(
                          password: password.text, email: email.text);
                      if (output == "success") {
                        await FirebaseFirestore.instance
                            .collection("users")
                            .doc(FirebaseAuth.instance.currentUser!.uid)
                            .snapshots()
                            .forEach((element) {
                          if (element.data()?['Authication'] == "User") {
                            print(element.data()?['Name']);
                            SharedPref.shard.setString('Name',element.data()?['Name'] );
                            SharedPref.shard.setString('Phone',element.data()?['Phone'] );
                            SharedPref. shard.setString('Email',element.data()?['E_mail'] );
                            SharedPref.shard.setString('Authication',element.data()?['Authication'] );
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Bottom_nav()));
                          } else {
                            print(element.data()?['Name']);
                            SharedPref.shard.setString('Name',element.data()?['Name'] );
                            SharedPref.shard.setString('Phone',element.data()?['Phone'] );
                            SharedPref.shard.setString('Email',element.data()?['E_mail'] );
                            SharedPref.shard.setString('Authication',element.data()?['Authication'] );
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Admin("offers")));
                          }
                        });
                      } else {
                        Utils().showSnackBar(  context: context, content: output , );
                      }
                      ;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Register(),
                            ));
                      },
                      child: Text(
                        'CREATE ACCOUNT',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: purple),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
