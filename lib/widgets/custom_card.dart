import 'package:bmi_calculator/resources/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.title,
    required this.count,
    required this.onDecrement,
    required this.onIncrement});
final String title;
final int count;
final Function onDecrement;
  final Function onIncrement;

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.greyColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(color:Colors.grey ),
            ),
            Text(
              '$count',
              style:  TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  backgroundColor: AppColors.lightGreyColor,
                  mini: true,
                  heroTag: "weight --",
                  onPressed:() {
                    onDecrement(title);
                  },
                  child:  Icon(
                    Icons.remove,
                    color: AppColors.whiteColor,
                  ),
                ),
               SizedBox(
                  width: MediaQuery.of(context).size.width*0.03,
                ),
                FloatingActionButton(
                  backgroundColor: AppColors.lightGreyColor,
                  mini: true,
                  heroTag: "weight ++",
                  onPressed: () {
                    onIncrement(title);
                  },
                  child:  Icon(
                    Icons.add,
                    color:AppColors.whiteColor ,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
