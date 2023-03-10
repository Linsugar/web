import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp( const ProviderScope(
    child:MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1080, 1920),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context,child){
        return MaterialApp(
          title: '这是首页',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home: child,
        );
      },
      child: const MyHomePage(title: "博客"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _textController = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    _textController.addListener(() {
      print(_textController.text);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title,style: TextStyle(fontSize: 40.sp),),
        actions:  [
          Center(child: Text("发表意见",style: TextStyle(fontSize: 40.sp))),
          SizedBox(width: 70.w,),
          GestureDetector(
            onTap: ()async{
             await _showDail(context,_textController);
            },
              child: Center(child: Text("投诉",style: TextStyle(fontSize: 40.sp)))),
          SizedBox(width: 30.w,),
        ],
      ),
      body: Center(
        child: Text(
          '找不到好的背景图，好的背景图要钱，哎，不要了,就这样',
          style: TextStyle(fontSize: 80.sp),
        ),
      ),
    );
  }
}


//展示弹窗
  Future _showDail(BuildContext context,TextEditingController txt) async{
       showDialog(context: context,builder: (BuildContext ctx){
         return  SimpleDialog(
           title: Center(child: Text("请输入你的意见,我不会接受的！",style: TextStyle(fontSize: 30.sp),)),
           children: [
             SizedBox(height: 30.h,),
             Container(
               width: 100.w,
               height: 100.h,
               padding: EdgeInsets.only(left: 5.w,right: 5.w),
               child: TextField(
                 controller: txt,
                 style: TextStyle(fontSize: 30.sp),
                 maxLines: 1,
                 maxLength: 20,
                 decoration: InputDecoration(
                 hintText: "这里输入你的意见",
                 border: InputBorder.none,
                 hintStyle: TextStyle(fontSize: 30.sp),
                   counterText: ""
               ),),
             ),
             SizedBox(height: 30.h,),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 TextButton(
                 onPressed: (){
                   Navigator.pop(ctx);
                 }, child: Text("取消",style: TextStyle(fontSize: 30.sp,color: Colors.red,),)),
                 TextButton(onPressed: (){}, child: Text("确认",style: TextStyle(fontSize: 30.sp),))
               ],
             )
           ],
         );

  });
}

