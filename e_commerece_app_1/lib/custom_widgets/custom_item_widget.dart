import 'package:e_commerece_app_1/utils/app_colors.dart';
import 'package:e_commerece_app_1/utils/ui_helper.dart';
import 'package:flutter/material.dart';

class CustomProductItemUI extends StatelessWidget {
  final Color? bgColor;
  CustomProductItemUI({this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FlutterLogo(
                  size: 110,
                ),
                Text(
                  'Wireless Headphone',
                  style: mTextStyle16(mFontWeight: FontWeight.bold),
                ),
                SizedBox(
                    height: 8), // Margin between product name and price row
                Row(
                  children: [
                    Text('\$120.00',
                        style: mTextStyle12(mFontWeight: FontWeight.bold)),
                    SizedBox(width: 12), // Margin between price and circles
                    Row(
                      children: List.generate(4, (index) {
                        if (index == 3) {
                          // For the last circle showing "+2"
                          return Container(
                            width: 20,
                            height: 20,
                            margin: EdgeInsets.only(left: 4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 0.5,
                                color: AppColors.blackColor,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                '+2',
                                style: TextStyle(
                                    fontSize: 7, fontFamily: 'poppinsFont'),
                              ),
                            ),
                          );
                        } else {
                          return Container(
                            width: 20,
                            height: 20,
                            margin: EdgeInsets.only(left: 4),
                            decoration: BoxDecoration(
                              color: Colors.orange, // Circle colors
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 1,
                                color: AppColors.blackColor,
                              ),
                            ),
                          );
                        }
                      }),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(21),
                  bottomLeft: Radius.circular(21),
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: bgColor ?? AppColors.lightGreyColor,
        borderRadius: BorderRadius.circular(21),
      ),
    );
  }
}
