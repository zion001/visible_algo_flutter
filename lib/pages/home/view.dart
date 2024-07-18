import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visible_algo_flutter/common/index.dart';
import 'index.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("HomePage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      id: "home",
      builder: (_) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(title: TextWidget.title1('算法'),)
            ],
          ),
        );
      },
    );
  }
}
