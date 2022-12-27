import 'package:bmi_calculator/constants/app_constants.dart';
import 'package:bmi_calculator/constants/dimensions.dart';
import 'package:bmi_calculator/widgets/left_bar_widget.dart';
import 'package:bmi_calculator/widgets/right_bar_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _heightController;
  late TextEditingController _weightController;
  double _bmiResult = 0;
  String _textResult = "";
  double height = 0;
  double width = 0;

  @override
  void initState() {
    _heightController = TextEditingController();
    _weightController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
          style: TextStyle(color: accentHexColor, fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: height * 0.05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: width * 0.361,
                child: TextField(
                  textAlign: TextAlign.center,
                  controller: _heightController,
                  style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accentHexColor),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Height",
                      hintStyle: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: Colors.white.withOpacity(0.8))),
                ),
              ),
              SizedBox(
                width: width * 0.361,
                child: TextField(
                  controller: _weightController,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accentHexColor),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Weight",
                      hintStyle: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: Colors.white.withOpacity(0.8))),
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.045,
          ),
          GestureDetector(
            onTap: () {
              double height = double.tryParse(_heightController.text) ?? 0;
              double weight = double.tryParse(_weightController.text) ?? 0;
              setState(() {
                _bmiResult = weight / (height * height);
                if (_bmiResult > 25) {
                  _textResult = "You're over weight";
                } else if (_bmiResult >= 18.5 && _bmiResult <= 25) {
                  _textResult = "You have normal weight";
                } else {
                  _textResult = "You're under weight";
                }
              });
            },
            child: Text(
              "Calculate",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: accentHexColor),
            ),
          ),
          SizedBox(
            height: height * 0.05,
          ),
          Text(
            _bmiResult.toStringAsFixed(2),
            style: TextStyle(
                fontSize: 90,
                fontWeight: FontWeight.w400,
                color: accentHexColor),
          ),
          SizedBox(
            height: height * 0.05,
          ),
          Visibility(
            visible: _textResult.isNotEmpty,
            child: Text(
              _textResult,
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                  color: accentHexColor),
            ),
          ),
          SizedBox(
            height: height * 0.025,
          ),
          LeftBar(width: width * 0.11),
          SizedBox(
            height: height * 0.025,
          ),
          LeftBar(width: 0.194 * width),
          SizedBox(
            height: height * 0.025,
          ),
          LeftBar(width: width * 0.11),
          SizedBox(
            height: height * 0.025,
          ),
          RightBar(width: 0.194 * width),
          SizedBox(
            height: height * 0.025,
          ),
          RightBar(width: 0.194 * width),
        ],
      )),
    );
  }
}
