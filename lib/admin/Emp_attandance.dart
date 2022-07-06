import 'package:flutter/material.dart';

void main() => runApp(EmpAttendence());

class EmpAttendence extends StatefulWidget {
  @override
  _EmpAttendenceState createState() => _EmpAttendenceState();
}

Widget build(BuildContext context) {
  return MaterialApp(
    home: EmpAttendence(),
  );
}

class _EmpAttendenceState extends State<EmpAttendence> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 194, 163, 247),
        title: const Text('Employee Attendence'),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.deepPurple,
              Colors.white,
            ],
          )),
          child: Center(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.people),
                  title: Text('Mr SubarnaKumar Das'),
                ),
                ListTile(
                  leading: Icon(Icons.people),
                  title: Text('Mr Visal bastab'),
                ),
                ListTile(
                  leading: Icon(Icons.people),
                  title: Text('Mr Devayu Sunk'),
                ),
                ListTile(
                  leading: Icon(Icons.people),
                  title: Text('Mr Devkanak Murmu'),
                ),
                ListTile(
                  leading: Icon(Icons.people),
                  title: Text('Mr Narasingha Das'),
                ),
                ListTile(
                  leading: Icon(Icons.people),
                  title: Text('Mr Shyamsankar pal'),
                ),
                ListTile(
                  leading: Icon(Icons.people),
                  title: Text('Mr Harisankar Ratha'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
