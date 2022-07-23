import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors.dart';

class LoadingView extends StatelessWidget {
  final bool show;

  const LoadingView({this.show = true});

  @override
  Widget build(BuildContext context) {
    return show
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Positioned(
                  child: Align(
                      alignment: Alignment.center,
                      child: Lottie.asset(
                        'assets/json/lottiefiles/app_custom_loader.json',
                        width: 250.w,
                        height: 250.h,
                        fit: BoxFit.fill,
                      )),
                ),
              ],
            ),
          )
        : SizedBox.shrink();
  }
}
