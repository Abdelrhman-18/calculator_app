import 'package:calculator_app/custom_bottom.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String equation = "0";
  String result = "0";

  void buttonPressed(String buttonText) {
    setState(() {
      switch (buttonText) {
        case "C":
          equation = "0";
          result = "0";
          break;
        case "⌫":
          if (equation != "0") {
            equation = equation.substring(0, equation.length - 1);
            if (equation.isEmpty) equation = "0";
          }
          break;
        case "=":
          String expression = equation;
          expression = expression.replaceAll('x', '*');
          expression = expression.replaceAll('÷', '/');

          try {
            Parser p = Parser();
            Expression exp = p.parse(expression);
            ContextModel cm = ContextModel();
            double eval = exp.evaluate(EvaluationType.REAL, cm);

            result = eval.toString();
            if (result.endsWith('.0')) {
              result = result.substring(0, result.length - 2);
            }
          } catch (e) {
            result = "Error";
          }
          break;
        default:
          if (equation == "0") {
            equation = buttonText;
          } else {
            equation += buttonText;
          }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          "Calculator",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
      body: Column(
        spacing: 20,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      equation,
                      style: const TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 120),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      result,
                      style: const TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          keyboardRow(
            ['C', '+/-', '%', '÷'],
            [Colors.grey, Colors.grey, Colors.grey, Colors.blue],
          ),
          keyboardRow(
            ['7', '8', '9', 'x'],
            [
              Colors.grey.shade800,
              Colors.grey.shade800,
              Colors.grey.shade800,
              Colors.blue,
            ],
          ),
          keyboardRow(
            ['4', '5', '6', '-'],
            [
              Colors.grey.shade800,
              Colors.grey.shade800,
              Colors.grey.shade800,
              Colors.blue,
            ],
          ),
          keyboardRow(
            ['1', '2', '3', '+'],
            [
              Colors.grey.shade800,
              Colors.grey.shade800,
              Colors.grey.shade800,
              Colors.blue,
            ],
          ),
          keyboardRow(
            ['.', '0', '⌫', '='],
            [
              Colors.grey.shade800,
              Colors.grey.shade800,
              Colors.grey.shade800,
              Colors.blue,
            ],
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget keyboardRow(List<String> buttons, List<Color> colors) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(buttons.length, (index) {
        return CustomBottom(
          title: buttons[index],
          color: colors[index],
          textSize: 28,
          onPressed: () => buttonPressed(buttons[index]),
        );
      }),
    );
  }
}
