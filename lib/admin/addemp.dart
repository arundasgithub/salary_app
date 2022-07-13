import 'package:flutter/material.dart';

void main() => runApp(AddEmploye());

class AddEmploye extends StatefulWidget {
  @override
  _AddEmployeState createState() => _AddEmployeState();
}

Widget build(BuildContext context) {
  return MaterialApp(
    home: AddEmploye(),
  );
}

class _AddEmployeState extends State<AddEmploye> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 90, 81, 225),
        title: const Text('Employee Registation'),
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
              // Colors.red,
              // Colors.orange,
            ],
          )),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(
                      //top: MediaQuery.of(context).size.height * 0.1,
                      left: 35,
                      right: 35,
                    ),
                    child: Column(
                      children: [
                        TextField(
                          //controller: emailController,
                          decoration: InputDecoration(
                            labelText: 'Employee Name',
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        TextField(
                          //controller: emailController,
                          decoration: InputDecoration(
                            labelText: 'Employee ID',
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        TextField(
                          //controller: emailController,
                          decoration: InputDecoration(
                            labelText: 'Employee DOB',
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        TextField(
                          //controller: emailController,
                          decoration: InputDecoration(
                            labelText: 'Gender',
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        TextField(
                          //controller: emailController,
                          decoration: InputDecoration(
                            labelText: 'Exprience',
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        TextField(
                          //controller: emailController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          //controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Mobile Number',
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            // hintText: 'Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 30.0),
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
                                onPressed: () {
                                  //Loginfunction();
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  //crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Register',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    // Icon(
                                    //   Icons.lock,
                                    //   color: Color.fromARGB(255, 24, 48, 58),
                                    // ),
                                  ],
                                )),
                          ],
                        ),
                        SizedBox(height: 30.0),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
