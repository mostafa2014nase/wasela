import 'package:flutter/material.dart';
import 'package:wasela/helper_methods/functions/functions_needed.dart';

class UserAccountScreen extends StatelessWidget {
  const UserAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: generateAppBar(
        context: context,
        title: "حسابى",
        svgPath: "wallet",
      ),
    );
  }
}
