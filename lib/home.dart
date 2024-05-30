import 'package:bmi_calculator/result.dart';
import 'package:flutter/material.dart';

import 'genter.dart';
import 'numberselect.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isMale = true;
  double height = 150;
  double weight = 60;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(41, 43, 61, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(41, 43, 61, 1),
        title: const Center(
          child: Text(
            'BMI CALCULATOR',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GenderSelection(
                  isSelected: isMale,
                  label: 'MALE',
                  icon: Icons.male,
                  onTap: () {
                    setState(() {
                      isMale = true;
                    });
                  },
                ),
                const SizedBox(width: 10),
                GenderSelection(
                  isSelected: !isMale,
                  label: 'FEMALE',
                  icon: Icons.female,
                  onTap: () {
                    setState(() {
                      isMale = false;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              height: 200,
              width: 400,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(92, 92, 116, 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'HEIGHT',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 140,
                      ),
                      Text(
                        '${height.round()}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'cm',
                        style: TextStyle(color: Colors.white54),
                      )
                    ],
                  ),
                  Slider(
                    activeColor: const Color.fromRGBO(226, 66, 105, 1),
                    value: height,
                    min: 100,
                    max: 220,
                    divisions: 120,
                    label: '${height.round()} cm',
                    onChanged: (double value) {
                      setState(() {
                        height = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Container(
                  height: 200,
                  width: 160,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(92, 92, 116, 1),
                      borderRadius: BorderRadius.circular(18)),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'WEIGHT',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                      NumberSelection(
                        value: weight,
                        onChanged: (double newValue) {
                          setState(() {
                            weight = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  height: 200,
                  width: 160,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(92, 92, 116, 1),
                      borderRadius: BorderRadius.circular(18)),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'AGE',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      NumberSelection(
                        value: age.toDouble(),
                        onChanged: (double newValue) {
                          setState(() {
                            age = newValue.round();
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              height: 50,
              width: 350,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(226, 66, 105, 1),
                ),
                onPressed: () {
                  double bmi = weight / ((height / 100) * (height / 100));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Result(
                          result: '${bmi.toStringAsFixed(2)}',
                        ),
                      ));
                },
                child: const Text(
                  'CALCULATE',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
