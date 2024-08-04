import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class QuickSortPage extends GetView<QuickSortController> {
  const QuickSortPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("快速排序"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuickSortController>(
      init: QuickSortController(),
      id: "quick_sort",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("quick_sort")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
