import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:visible_algo_flutter/common/index.dart';
import 'package:visible_algo_flutter/common/widgets/index.dart';

import 'index.dart';

class AboutPage extends GetView<AboutController> {
  const AboutPage({super.key});

  // 主视图
  Widget _buildView() {
    return [
      const TextWidget.body1('     这是一个尝试用动画方式展示算法过程的APP，希望能帮助用户更好的理解算法。后续将陆续增加更多内容。', softWrap: true, maxLines: 100000,), 
      Gap(100),
      TextWidget.body2('版本号:${controller.packageInfo?.version}'),
      ]
        .toColumn()
        .marginSymmetric(horizontal: AppSpace.page);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AboutController>(
      init: AboutController(),
      id: "about",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("关于")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
