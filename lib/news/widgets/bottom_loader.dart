import 'package:flutter/material.dart';

import '../utils/dimens.dart';

class BottomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: Dimens.HEIGHT_LARGE,
        width: Dimens.HEIGHT_LARGE,
        child: CircularProgressIndicator(strokeWidth: 1.5),
      ),
    );
  }
}
