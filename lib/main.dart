import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:visible_algo_flutter/common/routers/index.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initialization(null);

  runApp(const MyApp());
}

//启动图延时移除方法
void initialization(BuildContext? context) async {
  //延迟3秒
  await Future.delayed(const Duration(seconds: 3));
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // 路由
      initialRoute: RouteNames.home,
      getPages: RoutePages.list,
    );
  }
}
