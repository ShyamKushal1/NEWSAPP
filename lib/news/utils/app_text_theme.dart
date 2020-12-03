import 'package:flutter/material.dart';

import 'utils.dart';

/*It has different theme used in the project*/

class AppTextTheme {

  static TextStyle title(BuildContext context) {
    var theme = Theme.of(context).textTheme.headline6;
    var fontSize = theme.fontSize;
    if (Common.isLargeScreen(context)) fontSize = fontSize * 1.5;
    return Theme.of(context).textTheme.headline6.copyWith(fontSize: fontSize);
  }

  static TextStyle subtitle(BuildContext context) {
    var theme = Theme.of(context).textTheme.subtitle2;
    var fontSize = theme.fontSize;
    if (Common.isLargeScreen(context)) fontSize = fontSize * 1.5;
    return Theme.of(context).textTheme.subtitle2.copyWith(
        fontSize: fontSize);
  }

  static TextStyle medium(BuildContext context) {
    var fontSize = Dimens.TEXT_SIZE_MEDIUM;
    if (Common.isLargeScreen(context)) fontSize = fontSize * 1.5;
    return Theme.of(context).textTheme.subtitle1;
  }

  static TextStyle label(BuildContext context) {
    var fontSize = Dimens.TEXT_SIZE_MEDIUM;
    if (Common.isLargeScreen(context)) fontSize = fontSize * 1.5;
    return Theme.of(context).textTheme.subtitle1.copyWith(color: Colors.black,
        fontWeight: FontWeight.bold);
  }

  static TextStyle url(BuildContext context) {
    var fontSize = Dimens.TEXT_SIZE_SMALL;
    if (Common.isLargeScreen(context)) fontSize = fontSize * 1.5;
    return Theme.of(context).textTheme.subtitle2.copyWith(color: Colors.blue, decoration: TextDecoration.underline);
  }

  static TextStyle small(BuildContext context) {
    var fontSize = Dimens.TEXT_SIZE_SMALL;
    if (Common.isLargeScreen(context)) fontSize = fontSize * 1.5;
    return Theme.of(context).textTheme.subtitle2.copyWith(color: Common.getColorFromHex(ColorValue.Label_Color));
  }
}
