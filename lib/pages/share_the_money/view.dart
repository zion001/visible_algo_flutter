import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class ShareTheMoneyPage extends GetView<ShareTheMoneyController> {
  const ShareTheMoneyPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("ShareTheMoneyPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShareTheMoneyController>(
      init: ShareTheMoneyController(),
      id: "share_the_money",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("share_the_money")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
