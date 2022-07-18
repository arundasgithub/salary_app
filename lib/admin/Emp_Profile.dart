import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pagaar/admin/Emp_DetailPage.dart';

class EmpProfile extends StatefulWidget {
  const EmpProfile({Key key}) : super(key: key);

  @override
  State<EmpProfile> createState() => _EmpProfileState();
}

class _EmpProfileState extends State<EmpProfile> {
  final Stream<QuerySnapshot> _EmployeeStream =
      FirebaseFirestore.instance.collection('Employee-Details').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 194, 163, 247),
        title: const Text('Employee Profile'),
      ),
      body: Container(
        height: 750,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.deepPurple,
            Colors.white,
          ],
        )),
        child: StreamBuilder(
            stream: _EmployeeStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.red,
                    ),
                  ),
                );
              }
              return ListView(
                  children: snapshot.data.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                return Card(
                  child: ListTile(
                    title: Text(data['Emp-Name']),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return EmployeeDetails(empl: data);
                          },
                        ),
                      );
                    },
                  ),
                );
              }).toList());
            }),
      ),
    );
  }
}











// import 'package:flutter/material.dart';

// void main() => runApp(EmpProfile());

// class EmpProfile extends StatefulWidget {
//   @override
//   _EmpProfileState createState() => _EmpProfileState();
// }

// Widget build(BuildContext context) {
//   return MaterialApp(
//     home: EmpProfile(),
//   );
// }

// class _EmpProfileState extends State<EmpProfile> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 90, 81, 225),
//         title: const Text('Employee Profile'),
//       ),
//       body: Center(
//         child: Container(
//           decoration: BoxDecoration(
//               gradient: LinearGradient(
//             begin: Alignment.topRight,
//             end: Alignment.bottomLeft,
//             colors: [
//               Color.fromARGB(255, 90, 81, 225),
//               Colors.white,
//             ],
//           )),
//           child: Center(
//             child: Column(
//               //mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 ListTile(
//                   leading: Icon(Icons.people),
//                   title: Text('Mr SubarnaKumar Das'),
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.people),
//                   title: Text('Mr Visal bastab'),
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.people),
//                   title: Text('Mr Devayu Sunk'),
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.people),
//                   title: Text('Mr Devkanak Murmu'),
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.people),
//                   title: Text('Mr Narasingha Das'),
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.people),
//                   title: Text('Mr Shyamsankar pal'),
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.people),
//                   title: Text('Mr Harisankar Ratha'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
