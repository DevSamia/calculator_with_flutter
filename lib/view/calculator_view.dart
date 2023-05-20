// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';

import '../widget/button.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  var userQuestions = '';
  var userAnswer = '';
  

  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    '*',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '='
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(backgroundColor: Colors.pink.shade400,title: const Text('Calculator App')),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: Container(
              padding: const EdgeInsets.all(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Align(

                      alignment: Alignment.topLeft,
                      child: Container(
                        color: Colors.pink.shade100,
                        child: Text(
                          userQuestions,

                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black),
                        ),
                      )),
                  Align(
                      alignment: Alignment.topRight,
                      child: Text(userAnswer,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black))),
                ],
              ),
            )),
            Expanded(
                flex:1,
              child: GridView.builder(
                  padding: const EdgeInsets.all(10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,mainAxisExtent: 60,mainAxisSpacing: 10.0),
                  itemCount: buttons.length,
                  itemBuilder: (BuildContext context, index) {
                    if (index == 0) {
                      return MyButton(
                        onTapButton: () {
                          setState(() {
                            userQuestions = '';
                            userAnswer = '';
                          });
                        },
                        textColor: Colors.white,
                        buttonText: buttons[index],
                        color: Colors.green,
                      );
                    } else if (index == 1) {
                      return MyButton(
                        onTapButton: () {
                          setState(() {
                            userQuestions = userQuestions.substring(
                                0, userQuestions.length - 1);
                          });
                        },
                        textColor: Colors.white,
                        buttonText: buttons[index],
                        color: Colors.red,
                      );
                    } else if (index == buttons.length - 1) {
                      return MyButton(
                        onTapButton: () {
                          setState(() {
                            equalPressed();
                          });
                        },
                        textColor: Colors.white,
                        buttonText: buttons[index],
                        color: Colors.pink,
                      );
                    } else {
                      return MyButton(
                        onTapButton: () {
                          setState(() {
                            userQuestions += buttons[index];
                          });
                        },
                        textColor: isOperator(buttons[index])
                            ? Colors.white
                            : Colors.pink,
                        buttonText: buttons[index],
                        color: isOperator(buttons[index])
                            ? Colors.pink
                            : Colors.pink.shade50,
                      );
                    }
                  }),
               ),
          ],
        ),
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '%' || x == '/' || x == '*' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }

  void equalPressed() {
    String finalQuestions = userQuestions;
    finalQuestions = finalQuestions.replaceAll('X', '*');
    Parser p = Parser();

    Expression exp = p.parse(finalQuestions);
    // Bind variables:
    ContextModel cm = ContextModel();
    // Evaluate expression:
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    userAnswer = eval.toString();
  }
}
