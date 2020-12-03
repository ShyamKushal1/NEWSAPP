import 'package:flutter/material.dart';


class Common{

  /*It return the color from the hex color code*/
  static Color getColorFromHex(String hexColor) {
    hexColor = hexColor.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }

  /*it check the width of the mobile screen*/
  static bool isLargeScreen(BuildContext context)
  {
    double width = MediaQuery.of(context).size.width;
    if(width > 700) {
      return true;
    }
    return false;
  }

  /*it return padding value*/
  static getPadding({double top, double bottom, double left,
    double right, double allValue, double sameValue, bool all=false, bool same=false}){
    if(all == true)
      return EdgeInsets.all(allValue);
    if(same == true)
      return EdgeInsets.only(top: sameValue ?? 0, bottom: sameValue ?? 0 , left: sameValue ?? 0, right: sameValue ?? 0);
    else
      return EdgeInsets.only(top: top ?? 0, bottom: bottom ?? 0 , left: left ?? 0, right: right ?? 0);
  }

}