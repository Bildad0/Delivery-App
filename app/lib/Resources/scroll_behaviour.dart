import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TouchScrollBehavior extends ScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
      };
}
