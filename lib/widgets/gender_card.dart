import 'package:bmi_calculator/resources/app_colors.dart';
import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  const GenderCard({super.key,
    required this.onClick,
    required this.icon,
    required this.gender,
    required this.type,

   });
 final Function onClick;
 final IconData icon;
 final String gender;
  final String type;

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: GestureDetector(
        onTap: () {
          onClick(gender);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color:type==gender?AppColors.ScoundaryColor:AppColors.greyColor
          ),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
               icon ,
                size: 100,
                color: Colors.white,
              ),
              Text(
                gender,
                style: TextStyle(
                    color: Colors.grey, fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
