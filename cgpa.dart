// ignore_for_file: file_names, prefer_const_constructors, unnecessary_this
import 'package:bmi_calculator/cgpa_result.dart';
import 'package:bmi_calculator/gpa_result.dart';
import 'package:flutter/material.dart';

class SGPA extends StatefulWidget {
  @override
  State<SGPA> createState() => _SGPAState();
}

class _SGPAState extends State<SGPA> {
  int ts = 1;
  List<double> sgpa = [];
  int prev = 1;

  void tsIncrement() {
    setState(() {
      ts += 1;
    });
  }

  void tsDecrement() {
    setState(() {
      ts -= 1;
    });
  }

  double getCgpa() {
    double sum = 0;
    double res = 0;
    for (int i = 0; i <= sgpa.length - 1; i++) {
      sum = sum + sgpa[i];
    }
    res = sum / ts;
    return res;
  }

  @override
  Widget build(BuildContext context) {
    if (prev != ts) {
      prev = ts;
      sgpa = List.generate(ts, (index) => 0.0);
    }
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text("CGPA Calculator"),
        ),
        body: Column(
          children: [
            Text(
              "Enter Required Values",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.all(10.0),
                height: MediaQuery.of(context).size.height * 0.20,
                width: MediaQuery.of(context).size.width * 0.50,
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    Text(
                      "Total Semesters",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 25),
                    ),
                    Text(
                      "$ts",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 25),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            tsDecrement();
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.white),
                            child: Center(
                              child: Text(
                                "-",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 40),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            tsIncrement();
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.white),
                            child: Center(
                              child: Text(
                                "+",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 30),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  // width: 250,
                  child: ListView.builder(
                      itemCount: ts,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(top: 15),
                          decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius: BorderRadius.circular(10)),
                          height: 80,
                          child: Container(
                            padding: EdgeInsets.only(left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Semester ${index + 1}",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Slider(
                                        value: sgpa[index],
                                        min: 0,
                                        max: 4,
                                        activeColor: Colors.white,
                                        divisions: 40,
                                        onChanged: (d) {
                                          setState(() {
                                            sgpa[index] = d;
                                          });
                                        }),
                                    Text(
                                      "${sgpa[index]}",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                )),
            // Text("List is $sgpa"),
            InkWell(
              onTap: () {
                double cgpa = getCgpa();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CgpaResult(cgpa)));
              },
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Text(
                      "Calculate",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

