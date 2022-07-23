import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  final String msg;

  ErrorView(this.msg);

  @override
  Widget build(BuildContext context) {
    return Text(msg);
  }
}
