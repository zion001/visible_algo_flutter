import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class GuibingSortPage extends GetView<GuibingSortController> {
  const GuibingSortPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("归并排序"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GuibingSortController>(
      init: GuibingSortController(),
      id: "guibing_sort",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("guibing_sort")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
