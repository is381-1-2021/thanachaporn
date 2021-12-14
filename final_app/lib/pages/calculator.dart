import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String equation = "0";
  String result = "0";
  String expression = "";

  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        equation = "0";
        result = "0";
      } else if (buttonText == "CE") {
        expression = equation;
        result = "0";
      } else if (buttonText == "<-") {
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      } else if (buttonText == "x^2") {
        equation = "(" + equation + ")" + "^2";
      } else if (buttonText == "√x") {
        equation = "(" + equation + ")" + "^(1/2)";
      } else if (buttonText == "1/x") {
        equation = "(" + equation + ")" + "^(-1)";
      } else if (buttonText == "+/-") {
        equation = "(" + equation + ")" + "×(-1)";
        ;
      } else if (buttonText == "%") {
        equation = "(" + equation + ")" + "× 0.01";
      } else if (buttonText == "=") {
        expression = equation;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = "${exp.evaluate(EvaluationType.REAL, cm)}";
        } catch (e) {
          result = "Error";
        }
        // เฉพาะตอนเปลี่ยนเป็น '/2'
        // Provider.of<NotesProviders>(context, listen: false)
        //     .addNote(equation, result);
        Map<String, dynamic> data = {"equation": equation, "result": result};
        FirebaseFirestore.instance
            .collection("thanachaporn_final")
            .add(data)
            .then((value) => print("History Updated"))
            .catchError((error) => print("Failed to Update History!!"));
      } else {
        if (equation == "0") {
          equation = buttonText;
        } else {
          equation = equation + buttonText;
        }
      }
    });
  }

  Widget buildButton(
      String buttonText, double buttonHeight, Color buttonColor) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      color: buttonColor,
      child: TextButton(
          style: TextButton.styleFrom(
            textStyle: TextStyle(fontSize: 30.0, color: Colors.white),
            shadowColor: Colors.black,
            side: BorderSide(
                width: 1,
                color: Colors.blueGrey.shade900,
                style: BorderStyle.solid),
          ),
          onPressed: () => buttonPressed(buttonText),
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 30.0, color: Colors.white),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
            children: [
              IconButton(
                  onPressed: () async {
                    Navigator.pushNamed(context, '/4');
                  },
                  icon: Icon(Icons.menu)),
              SizedBox(
                width: 15,
              ),
              Text('Standard'),
            ],
          ),
          elevation: 0),
      body: Container(
        color: Colors.blueGrey.shade900,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              color: Colors.blueGrey.shade900,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(10.0),
              child: Text(
                equation,
                style: TextStyle(fontSize: 25, color: Colors.white60),
              ),
            ),
            Container(
              height: 150,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(10.0),
              child: Text(
                result,
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  color: Colors.blueGrey.shade900,
                  width: MediaQuery.of(context).size.width * 0.95,
                  child: Table(
                    children: [
                      TableRow(children: [
                        buildButton("%", 1, Colors.black45),
                        buildButton("CE", 1, Colors.black45),
                        buildButton("C", 1, Colors.black45),
                        buildButton("<-", 1, Colors.black45),
                      ]),
                      TableRow(children: [
                        buildButton("1/x", 1, Colors.black45),
                        buildButton("x^2", 1, Colors.black45),
                        buildButton("√x", 1, Colors.black45),
                        buildButton("÷", 1, Colors.black45),
                      ]),
                      TableRow(children: [
                        buildButton("7", 1, Colors.black),
                        buildButton("8", 1, Colors.black),
                        buildButton("9", 1, Colors.black),
                        buildButton("×", 1, Colors.black45),
                      ]),
                      TableRow(children: [
                        buildButton("4", 1, Colors.black),
                        buildButton("5", 1, Colors.black),
                        buildButton("6", 1, Colors.black),
                        buildButton("-", 1, Colors.black45),
                      ]),
                      TableRow(children: [
                        buildButton("1", 1, Colors.black),
                        buildButton("2", 1, Colors.black),
                        buildButton("3", 1, Colors.black),
                        buildButton("+", 1, Colors.black45),
                      ]),
                      TableRow(children: [
                        buildButton("+/-", 1, Colors.black),
                        buildButton("0", 1, Colors.black),
                        buildButton(".", 1, Colors.black),
                        buildButton("=", 1, Colors.lightBlue.shade900),
                      ]),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
