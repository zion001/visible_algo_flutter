import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class TwoRoadsQuickSortPage extends GetView<TwoRoadsQuickSortController> {
  const TwoRoadsQuickSortPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("双路快排"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TwoRoadsQuickSortController>(
      init: TwoRoadsQuickSortController(),
      id: "two_roads_quick_sort",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("two_roads_quick_sort")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
