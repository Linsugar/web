import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';






  TextStyle getTextType({String family='PT Sans',double size=15,FontWeight font=FontWeight.w400,double space=1,Color cor=Colors.white}){
      var  textType = TextStyle(fontFamily: family,fontSize: size.sp,fontWeight: font,letterSpacing: space,color: cor);
      return textType;
    }