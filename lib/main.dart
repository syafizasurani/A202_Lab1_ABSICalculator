import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ASBICalculator(),
    );
  }
}

class ASBICalculator extends StatefulWidget {
  ASBICalculator({Key key}) : super(key: key);

  @override
  _ASBICalculator createState() => _ASBICalculator();
}

class _ASBICalculator extends State<ASBICalculator> {
  int currentIndex = 0;
  double absi = 0;
  int age = 0;
  double height = 0;
  double weight = 0;
  double waist = 0;
  final TextEditingController ageController = new TextEditingController();
  final TextEditingController heightController = new TextEditingController();
  final TextEditingController weightController = new TextEditingController();
  final TextEditingController waistController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("ABSI Calculator",
          style: TextStyle(color: Colors.black),),
          elevation: 0.0,
          backgroundColor: Color(0xfffafafa),
          actions: [
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.settings,
              color: Colors.black,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    radioButton("Male", Colors.blueAccent, 0),
                    radioButton("Female", Colors.pink, 1),
                  ],
                ),
                //SizedBox(height: 20,
                //),
                //Text(
                  //"Age (Years Old):",
                  //style: TextStyle(
                    //fontSize: 12,
                  //),
                //),
                SizedBox(
                  height: 18,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  controller: ageController,
                  style: TextStyle(
                    fontSize: 16.5,
                  ),
                  decoration: InputDecoration(
                    hintText: "Enter your age (years old)",
                    filled: true,
                    fillColor: Colors.green[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                //Text(
                 // "Your Height (cm):",
                  //style: TextStyle(
                    //fontSize: 18,
                  //),
                //),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  controller: heightController,
                  style: TextStyle(
                    fontSize: 16.5,
                  ),
                  decoration: InputDecoration(
                    hintText: "Enter your height (cm)",
                    filled: true,
                    fillColor: Colors.green[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                //Text(
                  //"Your Weight (kg):",
                  //style: TextStyle(
                    //fontSize: 18,
                  //),
                //),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  controller: weightController,
                  style: TextStyle(
                    fontSize: 16.5,
                  ),
                  decoration: InputDecoration(
                    hintText: "Enter your weight (kg)",
                    filled: true,
                    fillColor: Colors.green[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                //Text(
                  //"Your Waist Circumference (cm):",
                  //style: TextStyle(
                    //fontSize: 18,
                  //),
                //),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  controller: waistController,
                  style: TextStyle(
                    fontSize: 16.5,
                  ),
                  decoration: InputDecoration(
                    hintText: "Enter your waist circumference (cm)",
                    filled: true,
                    fillColor: Colors.green[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: RaisedButton(
                    onPressed: calculateABSI,
                    color: Colors.green,
                    child: Text("Calculate",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    "Your ABSI is:",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    "" + absi.toStringAsFixed(5),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: RaisedButton(
                    onPressed: clear,
                    color: Colors.redAccent,
                    child: Text("Clear",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void calculateABSI(){
    setState(() {
      age = int.parse(ageController.text);
      height = double.parse(heightController.text) / 100;
      weight = double.parse(weightController.text);
      waist = double.parse(waistController.text);
      double bmi = weight / (height * height);
      double bmis = pow(bmi, 2.0 / 3.0);
      double heights = pow(height, 1.0 / 2.0);
      double _waist = waist / 100;
      absi = _waist / (bmis * heights);
      print(absi);
    });
  }

  void clear(){
    setState(() {
      ageController.clear();
      heightController.clear();
      weightController.clear();
      waistController.clear();
    });
  }

  void changeIndex(int index){
    setState(() {
      currentIndex = index;
    });
  }

  Widget radioButton(String value, Color color, int index){
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal:12.0),
        height: 51,
        child: FlatButton(
          // if current index is equal to the button index then put the color
          color: currentIndex == index ? color: Colors.grey[300],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          onPressed: (){
            changeIndex(index);
          },
          child: Text(value, 
          style: TextStyle(
            color: currentIndex == index ? Colors.white : color,
            fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}