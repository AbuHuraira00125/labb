import 'package:flutter/material.dart';

class GpaResult extends StatefulWidget {
   double gpa;
  GpaResult(this.gpa);
  // const GpaResult({Key? key}) : super(key: key);

  @override
  _GpaResultState createState() => _GpaResultState(this.gpa);
}

class _GpaResultState extends State<GpaResult> {
   double gpa;
   double fgpa;
  _GpaResultState(this.gpa);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (gpa >= 90) {
      fgpa = 4.0;
    } else if (gpa >= 85 && gpa < 90) {
      fgpa = 3.7;
    } else if (gpa >= 80 && gpa < 85) {
      fgpa = 3.3;
    } else if (gpa >= 75 && gpa < 80) {
      fgpa = 3.0;
    } else if (gpa >= 70 && gpa < 74) {
      fgpa = 2.7;
    } else if (gpa >= 65 && gpa < 70) {
      fgpa = 2.3;
    } else if (gpa >= 60 && gpa < 65) {
      fgpa = 2.0;
    } else if (gpa >= 55 && gpa < 60) {
      fgpa = 1.7;
    } else if (gpa >= 50 && gpa < 55) {
      fgpa = 1.3;
    } else if (gpa < 50) {
      fgpa = 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GPA Result"),

        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Text(
              "Your GPA Result is given below.",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          SizedBox(
            height: 70,
          ),
          Expanded(
            child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0))),
                child: Column(children: [
                  SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: Text(
                      "Total Marks $gpa",
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Center(
                    child: Text(
                      "GPA $fgpa",
                      style: TextStyle(
                          fontSize: 100,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ])),
          )
        ],
      ),
    );
  }
}
