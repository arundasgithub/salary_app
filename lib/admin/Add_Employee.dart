import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:intl/intl.dart';
import 'package:pagaar/admin/home.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({Key key}) : super(key: key);

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  String name = "";
  String dob = "";
  String experience = "";
  String email = "";
  String phone = "";
  String qualification = "";
  String gender;
  DateTime _dateTime = DateTime.now();

  bool _validateDate = false;
  bool _validateName = false;
  bool _validateExperience = false;
  bool _validateQualification = false;
  bool _validateEmail = false;
  bool _validateMobile = false;

  var _DOBController = TextEditingController();
  TextEditingController _datetroller = new TextEditingController();

  _selectedDOB(BuildContext context) async {
    var _pickedDate = await showDatePicker(
        context: context,
        initialDate: _dateTime,
        firstDate: DateTime(1960),
        lastDate: DateTime(2030));

    if (_pickedDate != null) {
      setState(() {
        _dateTime = _pickedDate;
        _DOBController.text = DateFormat('yyyy-MM-dd').format(_pickedDate);
        _datetroller.text = DateFormat('yyyy-MM-dd').format(_pickedDate);
      });
    }
  }

  AddEmployee() {
    DateTime now = DateTime.now();

    var HardId = (now.year.toString() +
        now.hour.toString() +
        now.minute.toString() +
        now.second.toString());
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("Employee-Details").doc(HardId);
    var EmployeeList = {
      "EmpID": HardId,
      "Emp-Name": name,
      "DateOfBrith": _DOBController.text,
      "Experience": experience,
      "email": email,
      "PhoneNo": phone,
      "gender": gender,
      "qualification": qualification,
      "attandance": "Absent",
    };

    documentReference
        .set(EmployeeList)
        .whenComplete(() => print("Employee Data stored successfully"));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.lightBlue,
        content: Text(
          "Employee Data saved successfully",
          style: TextStyle(fontSize: 18.0, color: Colors.black),
        ),
      ),
    );
    Navigator.of(context).pop();
  }

  FocusNode myFocusNode = new FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 90, 81, 225),
        title: const Text('Employee Registation'),
      ),
      body: SingleChildScrollView(
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          child: Container(
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
                SingleChildScrollView(
                  child: Container(
                    height: 750,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: TextFormField(
                            focusNode: myFocusNode,
                            decoration: InputDecoration(
                              labelText: 'Employee Name',
                              labelStyle: TextStyle(
                                  color: myFocusNode.hasFocus
                                      ? Colors.black
                                      : Colors.black),
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              errorText: _validateName
                                  ? "Value Can\'t Be Empty"
                                  : null,
                              prefixIcon:
                                  const Icon(Icons.person, color: Colors.grey),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            validator: MultiValidator([
                              RequiredValidator(errorText: "*Required"),
                            ]),
                            onChanged: (String value) {
                              name = value;
                            },
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: TextField(
                              keyboardType: TextInputType.number,
                              controller: _DOBController,
                              decoration: InputDecoration(
                                labelText: 'Date',
                                labelStyle: TextStyle(
                                    color: myFocusNode.hasFocus
                                        ? Colors.black
                                        : Colors.black),
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                errorText: _validateDate
                                    ? "Value Can\'t Be Empty"
                                    : null,
                                prefixIcon: InkWell(
                                  onTap: () {
                                    _selectedDOB(context);
                                  },
                                  child: const Icon(Icons.calendar_today,
                                      color: Colors.grey),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              )),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Gender : ",
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                  Expanded(
                                      child: ListTile(
                                    title: const Text("M",
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.black)),
                                    leading: Radio(
                                        value: "male",
                                        groupValue: gender,
                                        activeColor: Colors.white,
                                        onChanged: (value) {
                                          setState(() {
                                            gender = value.toString();
                                          });
                                        }),
                                    iconColor: Colors.black,
                                  )),
                                  Expanded(
                                      child: ListTile(
                                    title: const Text("F",
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.black)),
                                    leading: Radio(
                                        value: "female",
                                        groupValue: gender,
                                        activeColor: Colors.white,
                                        onChanged: (value) {
                                          setState(() {
                                            gender = value.toString();
                                          });
                                        }),
                                    iconColor: Colors.black,
                                  )),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Exprience',
                              labelStyle: TextStyle(
                                  color: myFocusNode.hasFocus
                                      ? Colors.black
                                      : Colors.black),
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              errorText: _validateExperience
                                  ? "Value Can\'t Be Empty"
                                  : null,
                              prefixIcon: const Icon(Icons.person_add,
                                  color: Colors.grey),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            onChanged: (String value) {
                              experience = value;
                            },
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Qualification',
                              labelStyle: TextStyle(
                                  color: myFocusNode.hasFocus
                                      ? Colors.black
                                      : Colors.black),
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              errorText: _validateQualification
                                  ? "Value Can\'t Be Empty"
                                  : null,
                              prefixIcon: const Icon(Icons.cast_for_education,
                                  color: Colors.grey),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            onChanged: (String value) {
                              qualification = value;
                            },
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Email',
                              labelStyle: TextStyle(
                                  color: myFocusNode.hasFocus
                                      ? Colors.black
                                      : Colors.black),
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              errorText: _validateEmail
                                  ? "Value Can\'t Be Empty"
                                  : null,
                              prefixIcon:
                                  const Icon(Icons.email, color: Colors.grey),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            validator: MultiValidator([
                              RequiredValidator(errorText: "*Required"),
                              EmailValidator(errorText: "*Enter Valid Email")
                            ]),
                            onChanged: (String value) {
                              email = value;
                            },
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Mobile Number',
                              labelStyle: TextStyle(
                                  color: myFocusNode.hasFocus
                                      ? Colors.black
                                      : Colors.black),
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              errorText: _validateMobile
                                  ? "Value Can\'t Be Empty"
                                  : null,
                              prefixIcon: const Icon(Icons.phone_android,
                                  color: Colors.grey),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            validator: MultiValidator([
                              RequiredValidator(errorText: "*Required"),
                            ]),
                            onChanged: (String value) {
                              phone = value;
                            },
                          ),
                        ),
                        Container(
                          height: 100,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(30),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (name.isEmpty) {
                                  _validateName = true;
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      backgroundColor: Colors.lightBlue,
                                      content: Text(
                                        "Please Fill All the Field",
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.black),
                                      ),
                                    ),
                                  );
                                } else if (_DOBController.text.isEmpty) {
                                  _validateName = false;
                                  _validateDate = true;
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      backgroundColor: Colors.lightBlue,
                                      content: Text(
                                        "Please Fill All the Field",
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.black),
                                      ),
                                    ),
                                  );
                                } else if (experience.isEmpty) {
                                  _validateName = false;
                                  _validateDate = false;
                                  _validateExperience = true;
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      backgroundColor: Colors.lightBlue,
                                      content: Text(
                                        "Please Fill All the Field",
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.black),
                                      ),
                                    ),
                                  );
                                } else if (qualification.isEmpty) {
                                  _validateName = false;
                                  _validateDate = false;
                                  _validateExperience = false;
                                  _validateQualification = true;
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      backgroundColor: Colors.lightBlue,
                                      content: Text(
                                        "Please Fill All the Field",
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.black),
                                      ),
                                    ),
                                  );
                                } else if (email.isEmpty) {
                                  _validateName = false;
                                  _validateDate = false;
                                  _validateExperience = false;
                                  _validateQualification = false;
                                  _validateEmail = true;
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      backgroundColor: Colors.lightBlue,
                                      content: Text(
                                        "Please Fill All the Field",
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.black),
                                      ),
                                    ),
                                  );
                                } else if (phone.isEmpty) {
                                  _validateName = false;
                                  _validateDate = false;
                                  _validateExperience = false;
                                  _validateMobile = false;
                                  _validateQualification = false;
                                  _validateEmail = false;
                                  _validateMobile = true;
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      backgroundColor: Colors.lightBlue,
                                      content: Text(
                                        "Please Fill All the Field",
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.black),
                                      ),
                                    ),
                                  );
                                } else {
                                  _validateName = false;
                                  _validateDate = false;
                                  _validateExperience = false;
                                  _validateMobile = false;
                                  _validateQualification = false;
                                  _validateEmail = false;
                                  _validateMobile = false;
                                  AddEmployee();
                                }
                              });
                              // Navigator.of(context).pop();
                            },
                            //child: const Text("Register"),
                            child: Container(
                                height: 30,
                                width: 100,
                                alignment: Alignment.center,
                                child: Row(
                                  children: [
                                    Text(
                                      'Register',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Icon(
                                      Icons.check_box,
                                      color: Color.fromARGB(255, 24, 48, 58),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            //  ),
          ),
        ),
      ),
    );
  }
}
