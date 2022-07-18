import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class markAtta_Employe extends StatefulWidget {
  Map<String, dynamic> empl;

  markAtta_Employe({Key key, this.empl}) : super(key: key);
  @override
  _markAtta_EmployeState createState() => _markAtta_EmployeState();
}

String empDob;

class _markAtta_EmployeState extends State<markAtta_Employe> {
  CollectionReference users =
      FirebaseFirestore.instance.collection('Employee-Details');
  DateTime _dateTime = DateTime.now();

  final idController = TextEditingController();
  final nameController = TextEditingController();
  final attandanceController = TextEditingController();
  String Attan_dance;
  final emailController = TextEditingController();
  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('dd-mm-yyyy');
  final String formatted = formatter.format(now);
  var day = DateFormat('EEEE').format(now);
  @override
  void initState() {
    attandanceController.text = widget.empl['attandance'];
    idController.text = widget.empl['EmpID'];
    nameController.text = widget.empl['Emp-Name'];
    emailController.text = widget.empl['email'];
    Attan_dance = attandanceController.text;
    super.initState();
  }

  FocusNode myFocusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _formKey = GlobalKey();

    // bool _value = false;
    //int attandance = 0;

    //String attandance;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 90, 81, 225),
          title: const Text("Employee Mark Attandance"),
        ),
        body: SingleChildScrollView(
          child: Form(
            child: Container(
                height: 750,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color.fromARGB(255, 90, 81, 225),
                    Colors.white,
                  ],
                )),
                child: Column(
                  children: [
                    SizedBox(height: 40.0),
                    Text(
                      "${day} ${formatted}",
                      //"Today Is Sunday",
                      style: TextStyle(
                        color: Color.fromARGB(255, 234, 235, 244),
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        fontStyle: FontStyle.normal,
                        //backgroundColor:
                        // Color.fromARGB(217, 159, 203, 250)
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      //padding: const EdgeInsets.all(10),
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.001,
                        left: 35,
                        right: 35,
                      ),
                      child: TextField(
                        readOnly: true,
                        controller: nameController,
                        decoration: InputDecoration(
                          labelText: 'Employee Name',
                          //hintText: 'Employee Name',
                          labelStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              fontStyle: FontStyle.normal,
                              color: myFocusNode.hasFocus
                                  ? Colors.black54
                                  : Colors.black54),
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          prefixIcon:
                              const Icon(Icons.person, color: Colors.grey),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      //padding: const EdgeInsets.all(10),
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.001,
                        left: 35,
                        right: 35,
                      ),
                      child: TextField(
                        readOnly: true,
                        controller: idController,
                        decoration: InputDecoration(
                          labelText: 'Employee ID',
                          //hintText: 'Employee Name',
                          labelStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              fontStyle: FontStyle.normal,
                              color: myFocusNode.hasFocus
                                  ? Colors.black54
                                  : Colors.black54),
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          prefixIcon:
                              const Icon(Icons.person, color: Colors.grey),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      //padding: const EdgeInsets.all(10),
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.001,
                        left: 35,
                        right: 35,
                      ),
                      child: TextField(
                        readOnly: true,
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          //hintText: 'Employee Email',
                          labelStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              fontStyle: FontStyle.normal,
                              color: myFocusNode.hasFocus
                                  ? Colors.black54
                                  : Colors.black54),
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          prefixIcon:
                              const Icon(Icons.email, color: Colors.grey),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Present",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                              )),
                          Radio(
                            value: "Present",
                            groupValue: Attan_dance,
                            onChanged: (value) {
                              setState(() {
                                Attan_dance = value.toString();
                                print("Arun......${Attan_dance}");
                              });
                            },
                            activeColor: Colors.green,
                          ),
                          Text("Absent",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                              )),
                          Radio(
                            value: "Absent",
                            groupValue: Attan_dance,
                            onChanged: (value) {
                              setState(() {
                                Attan_dance = value.toString();
                                print("Arun......${Attan_dance}");
                              });
                            },
                            activeColor: Colors.red,
                          ),
                          Text("HalfDay",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                              )),
                          Radio(
                            value: "HalfDay",
                            groupValue: Attan_dance,
                            onChanged: (value) {
                              setState(() {
                                Attan_dance = value.toString();
                                print("Arun......${Attan_dance}");
                              });
                            },
                            activeColor: Colors.yellow,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              //maximumSize: Size(10.0, 90.0),
                              //minimumSize: Size(170.0, 60.0),
                              primary: Color.fromARGB(245, 65, 198, 235),
                              //shape: StadiumBorder(),
                            ),
                            onPressed: () async {
                              users
                                  .doc(idController.text)
                                  .update({
                                    'attandance': Attan_dance,
                                  })
                                  .then((value) => print(
                                      "Employee Attandance Mark Successfully"))
                                  .catchError((error) =>
                                      print("Failed to update user: $error"));

                              Navigator.of(context).pop();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Make Attandance',
                                  style: TextStyle(fontSize: 18),
                                ),
                                Icon(
                                  Icons.check_box,
                                  color: Color.fromARGB(255, 24, 48, 58),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ],
                )),
          ),
        ));
  }
}
