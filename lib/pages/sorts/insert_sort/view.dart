import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class InsertSortPage extends GetView<InsertSortController> {
  const InsertSortPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("插入排序"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InsertSortController>(
      init: InsertSortController(),
      id: "insert_sort",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("insert_sort")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
