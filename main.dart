import 'package:bmi_calculator/cgpa.dart';
import 'package:bmi_calculator/gpa_menu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "CGPA Calculator",
    home: homePage(),
  ));
}

class homePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Select what you want"),
        backgroundColor: Colors.deepPurple,
      ),

      drawer: Drawer(



        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              padding: EdgeInsets.only(top: 60, left: 20),
              child: Text('AH CGPA App ' ,  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25 , color: Colors.white),),
            ),
            ListTile(
              title: const Text('GPA' ,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GpaMenu()));
              },
            ),
            ListTile(
              title: const Text('SGPA',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SGPA()));
              },
            ),
            ListTile(
              title: const Text('CGPA',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SGPA()));
              },
            ),
          ],
        ),

      ),




    );
  }
}
