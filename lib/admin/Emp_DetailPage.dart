import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class EmployeeDetails extends StatefulWidget {
  Map<String, dynamic> empl;

  EmployeeDetails({Key key, this.empl}) : super(key: key);
  @override
  _EmployeeDetailsState createState() => _EmployeeDetailsState();
}

String empDob;

class _EmployeeDetailsState extends State<EmployeeDetails> {
  CollectionReference users =
      FirebaseFirestore.instance.collection('Employee-Details');
  DateTime _dateTime = DateTime.now();

  final idController = TextEditingController();
  final nameController = TextEditingController();
  final qualificationController = TextEditingController();
  final mobilecontroller = TextEditingController();
  final emailController = TextEditingController();
  final datecontroller = TextEditingController();
  final experiencecontroller = TextEditingController();
  final genderController = TextEditingController();
  String gender;
  final empidController = TextEditingController();

  bool _validateDate = false;
  bool _validateName = false;
  bool _validateExperience = false;
  bool _validateQualification = false;
  bool _validateEmail = false;
  bool _validateMobile = false;
  @override
  void initState() {
// TODO: implement initState
    idController.text = widget.empl['EmpID'];
    nameController.text = widget.empl['Emp-Name'];
    emailController.text = widget.empl['email'];
    qualificationController.text = widget.empl['qualification'];
    mobilecontroller.text = widget.empl['PhoneNo'];
    datecontroller.text = widget.empl['DateOfBrith'];
    experiencecontroller.text = widget.empl['Experience'];
    genderController.text = widget.empl['gender'];
    gender = genderController.text;
    super.initState();
  }

  _selectedDOB(BuildContext context) async {
    var _pickedDate = await showDatePicker(
        context: context,
        initialDate: _dateTime,
        firstDate: DateTime(1960),
        lastDate: DateTime(2030));

    if (_pickedDate != null) {
      setState(() {
        _dateTime = _pickedDate;
        datecontroller.text = DateFormat('yyyy-MM-dd').format(_pickedDate);
        //_datetroller.text = DateFormat('yyyy-MM-dd').format(_pickedDate);
      });
    }
  }

  FocusNode myFocusNode = new FocusNode();
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _formKey = GlobalKey();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 90, 81, 225),
          title: const Text("Employee Details"),
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
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: TextField(
                        controller: nameController,
                        maxLength: 20,
                        decoration: InputDecoration(
                          labelText: 'Employee Name',
                          hintText: 'Employee Name',
                          labelStyle: TextStyle(
                              color: myFocusNode.hasFocus
                                  ? Colors.black
                                  : Colors.black),
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          errorText: _validateName ? "*Required" : null,
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
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: TextField(
                          controller: datecontroller,
                          keyboardType: TextInputType.number,
                          maxLength: 10,
                          decoration: InputDecoration(
                            labelText: 'Date',
                            labelStyle: TextStyle(
                                color: myFocusNode.hasFocus
                                    ? Colors.black
                                    : Colors.black),
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            errorText: _validateDate ? "*Required" : null,
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
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Text(
                                "Gender : ",
                                style: TextStyle(fontSize: 18),
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
                              )),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: TextField(
                        controller: experiencecontroller,
                        keyboardType: TextInputType.number,
                        maxLength: 3,
                        decoration: InputDecoration(
                          labelText: 'Experience',
                          hintText: 'Experience Details',
                          labelStyle: TextStyle(
                              color: myFocusNode.hasFocus
                                  ? Colors.black
                                  : Colors.black),
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          errorText: _validateExperience ? "*Required" : null,
                          prefixIcon:
                              const Icon(Icons.person_add, color: Colors.grey),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: TextField(
                        controller: qualificationController,
                        maxLength: 6,
                        decoration: InputDecoration(
                          labelText: 'Qualification',
                          hintText: 'Qualification Details',
                          labelStyle: TextStyle(
                              color: myFocusNode.hasFocus
                                  ? Colors.black
                                  : Colors.black),
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          errorText:
                              _validateQualification ? "*Required" : null,
                          prefixIcon: const Icon(Icons.cast_for_education,
                              color: Colors.grey),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: TextField(
                        controller: emailController,
                        maxLength: 20,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'Employee Email',
                          labelStyle: TextStyle(
                              color: myFocusNode.hasFocus
                                  ? Colors.black
                                  : Colors.black),
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          errorText: _validateEmail ? "*Required" : null,
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
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: TextField(
                        controller: mobilecontroller,
                        keyboardType: TextInputType.number,
                        maxLength: 10,
                        decoration: InputDecoration(
                          labelText: 'Mobile Number',
                          hintText: 'Enter your Mobile Number',
                          labelStyle: TextStyle(
                              color: myFocusNode.hasFocus
                                  ? Colors.black
                                  : Colors.black),
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          errorText: _validateMobile ? "*Required" : null,
                          prefixIcon: const Icon(Icons.phone_android,
                              color: Colors.grey),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    Container(
                        height: 100,
                        alignment: Alignment.center,
                        child: ElevatedButton.icon(
                            onPressed: () async {
                              if (nameController.text.isEmpty) {
                                _validateName = true;
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    backgroundColor: Colors.lightBlue,
                                    content: Text(
                                      "Please Fill All the Field",
                                      style: TextStyle(
                                          fontSize: 18.0, color: Colors.black),
                                    ),
                                  ),
                                );
                              } else if (datecontroller.text.isEmpty) {
                                _validateName = false;
                                _validateDate = true;
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    backgroundColor: Colors.lightBlue,
                                    content: Text(
                                      "Please Fill All the Field",
                                      style: TextStyle(
                                          fontSize: 18.0, color: Colors.black),
                                    ),
                                  ),
                                );
                              } else if (experiencecontroller.text.isEmpty) {
                                _validateName = false;
                                _validateDate = false;
                                _validateExperience = true;
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    backgroundColor: Colors.lightBlue,
                                    content: Text(
                                      "Please Fill All the Field",
                                      style: TextStyle(
                                          fontSize: 18.0, color: Colors.black),
                                    ),
                                  ),
                                );
                              } else if (qualificationController.text.isEmpty) {
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
                                          fontSize: 18.0, color: Colors.black),
                                    ),
                                  ),
                                );
                              } else if (emailController.text.isEmpty) {
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
                                          fontSize: 18.0, color: Colors.black),
                                    ),
                                  ),
                                );
                              } else if (mobilecontroller.text.isEmpty) {
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
                                          fontSize: 18.0, color: Colors.black),
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
                                users
                                    .doc(idController.text)
                                    .update({
                                      'Emp-Name': nameController.text,
                                      'DateOfBrith': datecontroller.text,
                                      'Experience': experiencecontroller.text,
                                      'gender': gender,
                                      'email': emailController.text,
                                      'PhoneNo': mobilecontroller.text,
                                      'qualification':
                                          qualificationController.text
                                    })
                                    .then((value) => print(
                                        "Employee data Updated Successfully"))
                                    .catchError((error) =>
                                        print("Failed to update user: $error"));
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    backgroundColor: Colors.lightBlue,
                                    content: Text(
                                      "Employee Data Updated successfully",
                                      style: TextStyle(
                                          fontSize: 18.0, color: Colors.black),
                                    ),
                                  ),
                                );
                                Navigator.of(context).pop();
                              }
                            },
                            icon: const Icon(Icons.edit),
                            label: const Text("Update"), //label text
                            style: ElevatedButton.styleFrom(
                                primary: Colors.deepPurple))),
                  ],
                )),
          ),
        ));
  }
}
