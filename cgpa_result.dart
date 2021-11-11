

import 'package:flutter/material.dart';

class CgpaResult extends StatefulWidget {
  double cgpa;
  CgpaResult(this.cgpa);
  // const CgpaResult({Key? key}) : super(key: key);

  @override
  _CgpaResultState createState() => _CgpaResultState(this.cgpa);
}

class _CgpaResultState extends State<CgpaResult> {
  double cgpa;
  _CgpaResultState(this.cgpa);
  double res;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    res = double.parse((cgpa).toStringAsFixed(2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CGPA Result"),

        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Text(
              "Your CGPA Result is given below.",
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
                    height: 120,
                  ),
                  Center(
                    child: Text(
                      "CGPA $res",
                      style: TextStyle(
                          fontSize: 80,
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

