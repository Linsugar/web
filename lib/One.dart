import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnlyOne extends StatefulWidget {
  const OnlyOne({Key? key}) : super(key: key);

  @override
  State<OnlyOne> createState() => _OnlyOneState();
}

class _OnlyOneState extends State<OnlyOne> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder(
      child: Text("sss",style: TextStyle(fontSize: 30),),
    );
  }
}
