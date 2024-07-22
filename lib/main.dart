import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/route_manager.dart';
import 'package:visible_algo_flutter/common/index.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:visible_algo_flutter/global.dart';

Future<void> main() async {
  await Global.init();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: EasyLoading.init(),
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: MaterialTheme.lightScheme(), // ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // 路由
      initialRoute: RouteNames.home,
      getPages: RoutePages.list,
      
    );
  }
}
