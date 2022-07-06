import 'package:flutter/material.dart';

class Designs extends StatefulWidget {
  @override
  _DesignsState createState() => _DesignsState();
}

class _DesignsState extends State<Designs> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.black54,
      onTap: () {
        print("Arun Test");
      },
      child: Card(
        margin: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image(
              color: Colors.black54,
              height: 60,
              width: 60,
              fit: BoxFit.fill,
              alignment: Alignment.center,
              image: AssetImage('assets/images/add_emp.jpg'),
            ),
            Text(
              "Testing",
              style: const TextStyle(fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
