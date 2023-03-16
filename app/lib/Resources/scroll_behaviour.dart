import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class touchScrollBehavior extends ScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
      };
}
