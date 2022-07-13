import 'package:flutter/material.dart';
import 'package:pagaar/admin/Emp_Profile.dart';
import 'package:pagaar/admin/Emp_attandance.dart';
import 'package:pagaar/admin/addemp.dart';

void main() {
  runApp(AdminHome());
}

class AdminHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 90, 81, 225),
        title: Text('Admin Home'),
      ),
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
              // child: Column(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: <Widget>[
              //     FlatButton(
              //       color: Color.fromARGB(255, 12, 167, 229),
              //       textColor: Colors.white,
              //       child: Text("Employee Registation"),
              //       onPressed: () {
              //         Navigator.of(context).push(
              //             MaterialPageRoute(builder: (context) => AddEmploye()));
              //         print("BY");
              //       },
              //     ),
              //     SizedBox(width: 5),
              //     FlatButton(
              //       color: Color.fromARGB(255, 12, 167, 229),
              //       textColor: Colors.white,
              //       child: Text("Employee Profile"),
              //       onPressed: () {
              //         Navigator.of(context).push(
              //             MaterialPageRoute(builder: (context) => EmpProfile()));
              //         print("Hello");
              //       },
              //     ),
              //     SizedBox(width: 5),
              //     FlatButton(
              //       color: Color.fromARGB(255, 12, 167, 229),
              //       textColor: Colors.white,
              //       child: Text("Employee Attendence"),
              //       onPressed: () {
              //         Navigator.of(context).push(MaterialPageRoute(
              //             builder: (context) => EmpAttendence()));
              //         //print("BY");
              //       },
              //     ),
              //     SizedBox(width: 5),
              //   ],
              // ),
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
                      MaterialPageRoute(builder: (context) => AddEmploye()));
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
                        "Employee Registation",
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
                        "Employee Attendence",
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
