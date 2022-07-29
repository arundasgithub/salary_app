//import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pagaar/admin/Add_Employee.dart';
import 'package:pagaar/admin/Emp_Profile.dart';
import 'package:pagaar/admin/Emp_attandance.dart';
import 'package:pagaar/login/login.dart';
//import 'package:pagaar/admin/addemp.dart';

void main() {
  runApp(AdminHome());
}

class AdminHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AdminHomePage(),
    );
  }
}

class AdminHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void Logout() async {
      User user = FirebaseAuth.instance.currentUser;

      await FirebaseAuth.instance.signOut();
      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacement(
          context, CupertinoPageRoute(builder: ((context) => HomePage())));
    }

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 90, 81, 225),
          title: Text('Admin Home'),
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.logout),
                color: Colors.black,
                onPressed: () => {Logout()}),
          ]),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 90, 81, 225),
              Colors.white,
            ],
          )),
          child: Center(
              child: GridView.extent(
            primary: false,
            padding: const EdgeInsets.all(16),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            maxCrossAxisExtent: 200.0,
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddEmployee()));
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Color.fromARGB(255, 12, 167, 229),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.app_registration,
                        size: 50,
                        color: Colors.white,
                      ),
                      Text(
                        "Employee Register",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EmpProfile()));
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Color.fromARGB(255, 12, 167, 229),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.account_circle_rounded,
                        size: 50,
                        color: Colors.white,
                      ),
                      Text(
                        "Employee Profile",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EmpAttendence()));
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Color.fromARGB(255, 12, 167, 229),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.check,
                        size: 50,
                        color: Colors.white,
                      ),
                      Text(
                        "Attendence",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
