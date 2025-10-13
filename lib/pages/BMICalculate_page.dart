import 'dart:math';
import 'package:bmi_calculator/pages/calculate_page.dart';
import 'package:bmi_calculator/resources/app_colors.dart';
import 'package:bmi_calculator/widgets/custom_card.dart';
import 'package:bmi_calculator/widgets/gender_card.dart';
import 'package:flutter/material.dart';


class BmiCalculatorPage extends StatefulWidget {
  const BmiCalculatorPage({super.key});

  @override
  State<BmiCalculatorPage> createState() => _BmiCalculatorPageState();
}

class _BmiCalculatorPageState extends State<BmiCalculatorPage> {
  double sliderHeight = 180;
  int weightCount =20;
  int age = 20;
  String type='';
  void onClick(gender) {
    if(gender=='Male'){
      type='Male';
    }else{
      type='Female';
    }
    setState(() {});
  }
void onDecrement(title){
  if(title=='Weight'){
    weightCount--;
    print(weightCount);
  }else if(title=='Age'){
    age--;
    print(age);
  }
  setState(() {});
}
  void onIncrement(title){
    if(title=='Weight'){
      weightCount++;
      print(weightCount);
    }else if(title=='Age'){
      age++;
      print(age);
    }
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.lightPrimaryColor,
        appBar: AppBar(
          backgroundColor:AppColors.primaryColor ,
          centerTitle: true,
          title:  Text(
            "BMI CALCULATOR",style: TextStyle(color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold),
              ),
          ),
        body: Container(
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.all(14),
          color: AppColors.primaryColor,
          child: Column(
            children: [
              Expanded(
                  child: Row(
                children: [
                  GenderCard(onClick: onClick,
                    icon: Icons.male,
                    gender: 'Male',
                    type: type,
                    ),
                  SizedBox(
                    width:MediaQuery.of(context).size.width*0.05,
                  ),
                  GenderCard(onClick: onClick,
                    icon: Icons.female,
                    gender: 'Female',
                    type: type,
                   ),
                ],
              )),
              SizedBox(
                height:MediaQuery.of(context).size.height*0.03,
              ),
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                  color: AppColors.greyColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Height",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Row(
                      textBaseline: TextBaseline.alphabetic,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${sliderHeight.round()}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 45,
                              fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          "cm",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Slider(
                        activeColor: AppColors.ScoundaryColor,
                        min: 80,
                        max: 200,
                        value: sliderHeight,
                        onChanged: (value) {
                          setState(() {
                            sliderHeight = value;
                          });
                        })
                  ],
                ),
              )),
              SizedBox(
                height:MediaQuery.of(context).size.height*0.03,
              ),
              Expanded(
                  child: Row(
                children: [
                  CustomCard(
                      title: 'Weight',
                      count:weightCount,
                      onDecrement: onDecrement,
                      onIncrement: onIncrement
                  ),
                  SizedBox(
                    width:MediaQuery.of(context).size.width*0.05,
                  ),
                  CustomCard(
                      title: 'Age',
                      count:age,
                      onDecrement: onDecrement,
                      onIncrement: onIncrement
                  ),
                ],
              )),
              SizedBox(
                height:MediaQuery.of(context).size.height*0.03,
              ),
              SizedBox(
                  width: double.infinity,
                  height:MediaQuery.of(context).size.height*0.1,

                  child: MaterialButton(
                    color: AppColors.ScoundaryColor,
                    onPressed: () {
                      double result = (weightCount / pow(sliderHeight / 100, 2));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CalculatePage(
                              result: result,
                            ),
                          ));
                    },
                    child:  Text(
                      "CALCUlATE",
                      style: TextStyle(color:AppColors.whiteColor,
                          fontSize: 20),
                    ),
                  ))
            ],
          ),
        ));
  }
}
