// import 'package:flutter/material.dart';

// import 'package:flutter/cupertino.dart';
// import 'package:pagaar/employee/emp_sidemenu.dart';

// void main() => runApp(EmpHome());

// class EmpHome extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Home',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: EmpHomePage(),
//     );
//   }
// }

// class EmpHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: NavDrawer(),
//       appBar: AppBar(
//         title: const Text('Home'),
//       ),
//       body: const Center(
//         child: Text('Your Employee Dashbord is Here'),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

void main() {
  runApp(EmpHome());
}

class EmpHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: EmpHomePage(),
    );
  }
}

class EmpHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //title: Text('Employee Registation'),
          ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.blue,
              Colors.red,
            ],
          )),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  color: Color.fromARGB(255, 12, 167, 229),
                  textColor: Colors.white,
                  child: Text("Profile Page"),
                  onPressed: () {
                    // Navigator.of(context)
                    //     .push(MaterialPageRoute(builder: (context) => Mobile()));
                    print("BY");
                  },
                ),
                SizedBox(width: 5),
                FlatButton(
                  color: Color.fromARGB(255, 12, 167, 229),
                  textColor: Colors.white,
                  child: Text("Attandance Page"),
                  onPressed: () {
                    // Navigator.of(context).push(
                    //     MaterialPageRoute(builder: (context) => FruitListScreen()));
                    print("Hello");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
