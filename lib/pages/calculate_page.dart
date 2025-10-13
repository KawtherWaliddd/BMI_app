import 'package:bmi_calculator/resources/app_colors.dart';
import 'package:flutter/material.dart';

class CalculatePage extends StatelessWidget {
  const CalculatePage({
    super.key,
    required this.result,
  });
  final double result;
  @override
  Widget build(BuildContext context) {

    final String grade;
    if (15 < result && result < 30) {
      grade = "Normal";
    } else {
      grade = "Is unNormal";
    }

    return Scaffold(
          backgroundColor: AppColors.primaryColor,
          appBar: AppBar(
            backgroundColor: AppColors.lightPrimaryColor,
            centerTitle: true,
            title: const Text(
              "YOUR RESULT",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          body:  Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
                  children: [
                   Expanded(
                     flex: 4,
                     child: Container(
                       margin: EdgeInsets.all(16),
                         padding: EdgeInsets.all(16),
                         decoration: BoxDecoration(
                       color: AppColors.lightPrimaryColor,
                       borderRadius: BorderRadius.circular(12)
                     ),
                         child: Column(children: [ Text(
                       grade,
                       style: const TextStyle(
                           color: Colors.green,
                           fontSize: 20),
                     ),
                       Text(
                         "${result.round()}",
                         style:  TextStyle(
                             fontSize: 40,
                             fontWeight: FontWeight.bold,
                             color: AppColors.whiteColor),
                       ),
                       Text(
                         "you have a $grade body weight.",
                         textAlign: TextAlign.center,
                         style: TextStyle(
                             color: AppColors.whiteColor,
                             fontSize: 20),
                       ),],)),
                   ),
                     Expanded(
                       flex: 4,
                       child: SizedBox(
                        height:MediaQuery.of(context).size.height*0.3 ,
                       ),
                     ),
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height*0.1,
                        child: MaterialButton(
                          color: AppColors.ScoundaryColor,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "RE _ CALCUlATE",
                            style: TextStyle(color:AppColors.whiteColor , fontSize: 20),
                          ),
                        ),
                      ),
                    )
                  ],
              ),
          ),
          ) ;
  }
}
