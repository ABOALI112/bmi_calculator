import 'package:bmi_calculator/constants/app_constants.dart';
import 'package:bmi_calculator/widgets/left_bar.dart';
import 'package:bmi_calculator/widgets/right_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightControl = TextEditingController();
  TextEditingController _weightControl = TextEditingController();
  double _BmiResult = 0;
  String _textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
          style: TextStyle(
            color: accentHexColor,
            fontWeight: FontWeight.w300,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                  child: TextField(
                    controller: _heightControl,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accentHexColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Height",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.white.withOpacity(0.8),
                        )),
                  ),
                ),
                Container(
                  width: 130,
                  child: TextField(
                    controller: _weightControl,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accentHexColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Weight",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.white.withOpacity(0.8),
                        )),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                double _h = double.parse(_heightControl.text);
                double _w = double.parse(_weightControl.text);
                setState(() {
                  _BmiResult = _w / (_h * _h);
                  if (_BmiResult > 25) {
                    _textResult = "You\'re overweight ";
                  } else if (_BmiResult >= 18.5 && _BmiResult <= 25) {
                    _textResult = "You have Normal Weight ";
                  } else {
                    _textResult = "You are Skinny";
                  }
                });
              },
              child: Container(
                child: Text(
                  "Calculate",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: accentHexColor,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              child: Text(
                _BmiResult.toStringAsFixed(2),
                style: TextStyle(
                  fontSize: 90,
                  color: accentHexColor,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Visibility(
              visible: _textResult.isNotEmpty,
              child: Container(
                child: Text(
                  _textResult,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                    color: accentHexColor,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const leftbar(BarWidth: 40),
            const SizedBox(
              height: 20,
            ),
            const leftbar(BarWidth: 70),
            const SizedBox(
              height: 20,
            ),
            const leftbar(BarWidth: 40),
            const SizedBox(
              height: 20,
            ),
            RightBar(BarWidth: 70),
            const SizedBox(
              height: 50,
            ),
            RightBar(BarWidth: 70)
          ],
        ),
      ),
    );
  }
}
