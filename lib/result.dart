import 'package:bmi_calculator/home.dart';
import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  Result({super.key, required this.result});

  String result;

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  String bmistatus(double bmi) {
    if (bmi < 18.5) {
      return "Underweight";
    } else if (bmi >= 18.5 && bmi < 25) {
      return "Normal";
    } else {
      return "Overweight";
    }
  }

  String bmicaption(double bmi) {
    if (bmi < 18.5) {
      return "You're light on the scale! Time to bulk up for a balanced body!";
    } else if (bmi >= 18.5 && bmi < 25) {
      return "please give same as this You have a normal body weight. Good job!";
    } else {
      return "A little heavy on the scale! Let's trim down for a healthier you!";
    }
  }

  Widget build(BuildContext context) {
    String Bmistatus = bmistatus(double.parse(widget.result));
    String Bmicaption = bmicaption(double.parse(widget.result));

    return Scaffold(
      backgroundColor: const Color.fromRGBO(41, 43, 61, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(41, 43, 61, 1),
        title: const Text(
          'Your Result',
          style: TextStyle(
              color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 680,
              width: 400,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(92, 92, 116, 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  Text(
                    Bmistatus,
                    style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  const SizedBox(
                    height: 150,
                  ),
                  Text(
                    widget.result,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 80),
                  ),
                  const SizedBox(
                    height: 200,
                  ),
                  Text(
                    Bmicaption,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 50,
            width: 350,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(226, 66, 105, 1),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(),
                    ));
              },
              child: const Text(
                'RE-CALCULATE',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
