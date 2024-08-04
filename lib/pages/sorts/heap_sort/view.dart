import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class HeapSortPage extends GetView<HeapSortController> {
  const HeapSortPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("堆排序"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HeapSortController>(
      init: HeapSortController(),
      id: "heap_sort",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("heap_sort")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
