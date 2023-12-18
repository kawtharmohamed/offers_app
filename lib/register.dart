
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:offersapp/bottom_nav.dart';
import 'package:offersapp/admin.dart';
import 'SharedPref.dart';
import 'authenticationMethods.dart';
import 'home.dart';
import 'login.dart';
import 'main.dart';
import 'utils.dart';
class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController email = new TextEditingController();

  TextEditingController password = new TextEditingController();

  TextEditingController name = new TextEditingController();

  TextEditingController phone = new TextEditingController();

  AuthenticationMethods authenticationMethods = AuthenticationMethods();

  bool _isObscure = true;

  final List<String> adminItems = [
    'Admin',
    'User',
  ];

  String selectedValueauthnication = "";

  final _formKey = GlobalKey<FormState>();

  final _adminformKey = GlobalKey<FormState>();

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.only(top: 30.0, right: 25, left: 25),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0, left: 70.0),
              child: Text("Create Account",
                  style: TextStyle(
                    color: grey,
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  )),
            ),
            Image.asset("assets/onboarding2.png" ,
              width: 150 , height: 150,),
            TextField(
              controller: name,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.account_circle , color: purple),
                  border: OutlineInputBorder( borderRadius: BorderRadius.circular(30)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: purple,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  labelText: "Name"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child:     TextField(
                controller: email,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined , color: purple,),
                    border: OutlineInputBorder( borderRadius: BorderRadius.circular(30)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: purple,
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),

                    labelText: "Email"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: TextField(
                controller: phone,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone_android , color: purple,),
                  border: OutlineInputBorder( borderRadius: BorderRadius.circular(30)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: purple,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  labelText: "Phone",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: TextField(
                obscureText: _isObscure,
                controller: password,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock , color: purple),
                    border: OutlineInputBorder( borderRadius: BorderRadius.circular(30)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: purple,
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    labelText: "Password",
                    suffixIcon: IconButton( color: purple,
                        icon: Icon(_isObscure
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        })),
              ),
            ),
            Form(
              key: _adminformKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 25),
                    DropdownButtonFormField2(
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      isExpanded: true,
                      hint: const Text(
                        ' Please select Authication',
                        style: TextStyle(fontSize: 14),
                      ),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black45,
                      ),
                      iconSize: 30,
                      buttonHeight: 60,
                      buttonPadding:
                      const EdgeInsets.only(left: 20, right: 10),
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      items: adminItems
                          .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ))
                          .toList(),
                      onChanged: (value) {
                        selectedValueauthnication = value.toString();
                      },
                      onSaved: (value) {
                        selectedValueauthnication = value.toString();
                      },
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 40, right: 40),
              child: Container(height: 50,
                child: MaterialButton( shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular
                  (25.0)),
                    color: purple,
                    child: Text(
                      "Create Account ",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    onPressed: () async {
                      String output = await authenticationMethods.register(
                        name: name.text,
                        email: email.text,
                        phone: phone.text,
                        password: password.text,
                        Authication: selectedValueauthnication,
                      );
                      if (output == "success")  {
                        await FirebaseFirestore.instance
                            .collection("users")
                            .doc(FirebaseAuth.instance.currentUser!.uid)
                            .snapshots()
                            .forEach((element) {
                          if (element.data()?['Authication'] == "User") {
                            print(element.data()?['Name']);
                            SharedPref.shard.setString('Name',element.data()?['Name'] );
                            SharedPref.shard.setString('Phone',element.data()?['Phone'] );
                            SharedPref.shard.setString('Email',element.data()?['E_mail'] );
                            SharedPref.shard.setString('Authication',element.data()?['Authication'] );
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Bottom_nav()));
                          } else {
                            print(element.data()?['Name']);
                            SharedPref.shard.setString('Name',element.data()?['Name'] );
                            SharedPref.shard.setString('Name',element.data()?['Name'] );
                            SharedPref.shard.setString('Phone',element.data()?['Phone'] );
                            SharedPref.shard.setString('Email',element.data()?['E_mail'] );
                            SharedPref.shard.setString('Authication',element.data()?['Authication'] );
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Admin("add offer")));
                          }
                        });
                      }else {
                        Utils().showSnackBar(context: context, content: output);
                      }
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Login(),
                          ));
                    },
                    child: Text(
                      'SIGN IN',
                      style: TextStyle( color: purple,
                          fontSize: 20.0, fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),),
    );
  }
}
