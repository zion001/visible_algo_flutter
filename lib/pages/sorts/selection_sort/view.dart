import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class SelectionSortPage extends GetView<SelectionSortController> {
  const SelectionSortPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("选择排序"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SelectionSortController>(
      init: SelectionSortController(),
      id: "selection_sort",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("selection_sort")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
