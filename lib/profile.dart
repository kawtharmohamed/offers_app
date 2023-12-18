import 'package:flutter/material.dart';
import 'package:offersapp/bottom_nav.dart';
import 'SharedPref.dart';
import 'home.dart';
import 'main.dart';

class Profile extends StatefulWidget {
  static const String routeName = 'Profile';
  static Route route() {
    return MaterialPageRoute(
        builder: (_) => Profile(), settings: RouteSettings(name: routeName));
  }

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  dynamic nameProfile;
  dynamic passwordProfile;
  dynamic phoneProfile;
  dynamic emailProfile;
  dynamic AuthicationProfile;

  void initState() {
    super.initState();
    _loadCounter();
  }

  _loadCounter() async {
    nameProfile = SharedPref.shard.getString("Name");
    passwordProfile = SharedPref.shard.getString('Password');
    phoneProfile = SharedPref.shard.getString("Phone");
    emailProfile = SharedPref.shard.getString("Email");
    AuthicationProfile = SharedPref.shard.getString("Authication");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 250),
              child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Bottom_nav()));
                  },
                  child: Text(
                    "Back",
                    style: TextStyle(
                        fontWeight: FontWeight.w700, color: grey, fontSize: 22),
                  )),
            ),
            Icon(
              Icons.account_circle,
              size: 140,
              color: purple,
            ),
            Padding(
              padding: const EdgeInsets.only(top:10.0 , right: 20 , left: 20, bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15)),
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name :",
                        style: TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          nameProfile,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:10.0 , right: 20 , left: 20, bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15)),
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Phone :",
                        style: TextStyle(color: Colors.grey, fontSize: 15 , fontWeight: FontWeight.w600),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          phoneProfile,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:10.0 , right: 20 , left: 20, bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15)),
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email :",
                        style: TextStyle(color: Colors.grey, fontSize: 15 , fontWeight: FontWeight.w600),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          emailProfile,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:10.0 , right: 20 , left: 20, bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15)),
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Authentication :",
                        style: TextStyle(color: Colors.grey, fontSize: 15 , fontWeight: FontWeight.w600),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          AuthicationProfile,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only( right: 60 , left: 60, top: 50.0),
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      SharedPref.shard.remove('name');
                      SharedPref.shard.remove('Password');
                      SharedPref.shard.remove('Phone');
                      SharedPref.shard.remove('E_mail');
                      SharedPref.shard.remove('Gender');
                      SharedPref.shard.remove('Authication');
                    },
                    child: Text(
                      "Delete My Account",
                      style: TextStyle(color: Colors.white , fontWeight: FontWeight.w600, fontSize: 18),
                    )),
              ),
            )
          ],
        ));
  }
}
