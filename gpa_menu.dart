import 'package:bmi_calculator/gpa_result.dart';
import 'package:flutter/material.dart';

class GpaMenu extends StatefulWidget {
  @override
  _GpaMenuState createState() => _GpaMenuState();
}

class _GpaMenuState extends State<GpaMenu> {
  double tch = 0;
  double lch = 0;
  double subMarks = 0;
  double labMarks = 0;
  double gpa = 0;
  void tchDecrement() {
    setState(() {
      tch -= 1;
    });
  }

  void tchIncrement() {
    setState(() {
      tch += 1;
    });
  }

  void lchDecrement() {
    setState(() {
      lch -= 1;
    });
  }

  void lchIncrement() {
    setState(() {
      lch += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enter Values"),
        backgroundColor: Colors.deepPurple,
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
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Container(
              margin: EdgeInsets.all(10.0),
              height: MediaQuery.of(context).size.height * 0.20,
              width: MediaQuery.of(context).size.width * 0.40,
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  Text(
                    "Theory Credit Hours",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 15),
                  ),
                  Text(
                    "$tch",
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
                          tchDecrement();
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
                              style:
                                  TextStyle(color: Colors.black, fontSize: 40),
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   width: 50,
                      // ),
                      InkWell(
                        onTap: () {
                          tchIncrement();
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
                              style:
                                  TextStyle(color: Colors.black, fontSize: 30),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              height: MediaQuery.of(context).size.height * 0.20,
              width: MediaQuery.of(context).size.width * 0.40,
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  Text(
                    "Lab Credit Hours",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 15),
                  ),
                  Text(
                    "$lch",
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
                          lchDecrement();
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
                              style:
                                  TextStyle(color: Colors.black, fontSize: 40),
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   width: 50,
                      // ),
                      InkWell(
                        onTap: () {
                          lchIncrement();
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
                              style:
                                  TextStyle(color: Colors.black, fontSize: 30),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ]),
          Row(children: [
            Text(
              "Subject Marks $subMarks",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Slider(
              value: subMarks,
              min: 0,
              max: 100,
              divisions: 100,
              label: subMarks.round().toString(),
              onChanged: (double value) {
                setState(() {
                  subMarks = value;
                });
              },
            ),
          ]),
          Row(children: [
            Text(
              "Lab Marks $labMarks",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Slider(
              value: labMarks,
              min: 0,
              max: 100,
              divisions: 100,
              label: labMarks.round().toString(),
              onChanged: (double value1) {
                setState(() {
                  labMarks = value1;
                });
              },
            ),
          ]),
          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              double val1 = subMarks * tch;
              double val2 = labMarks * lch;
              double val3 = tch + lch;
              gpa = (val1 + val2) / val3;
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GpaResult(gpa)));
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
    );
  }
}
