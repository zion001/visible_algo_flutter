import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class BubbleSortPage extends GetView<BubbleSortController> {
  const BubbleSortPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("冒泡排序"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BubbleSortController>(
      init: BubbleSortController(),
      id: "bubble_sort",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("bubble_sort")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
