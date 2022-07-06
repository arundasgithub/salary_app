import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void Logout() async {
      print("Test Arun");

      // await FirebaseAuth.instance.signOut();
      // Navigator.popUntil(context, (route) => route.isFirst);
      // Navigator.pushReplacement(
      //     context, CupertinoPageRoute(builder: ((context) => myLogin())));
    }

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          // DrawerHeader(
          //   child: Text(
          //     'Welcome',
          //     style: TextStyle(color: Colors.white, fontSize: 25),
          //   ),
          //   decoration: BoxDecoration(
          //     color: Colors.orange,
          //     //image:DecorationImage(fit: BoxFit.fill, image: NetworkImage(''))
          //   ),
          // ),
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundColor: Color.fromARGB(225, 208, 220, 39),
              // backgroundImage: AssetImage(
              //   'assets/profile.jpg',
              // ),
            ),
            accountName: Text("Text"),
            accountEmail: Text("Text"),
            decoration: BoxDecoration(color: Colors.orange),
          ),
          // ListTile(
          //   leading: Icon(Icons.input),
          //   //title: Text('Welcome'),
          //   title: Text(user),
          //   onTap: () => {},
          // ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Profile'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Feedback'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {Logout()},
          ),
        ],
      ),
    );
  }
}
