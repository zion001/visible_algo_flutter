import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:visible_algo_flutter/common/index.dart';
import 'package:visible_algo_flutter/pages/sorts/bubble_sort/controller.dart';

import 'index.dart';

class SelectionSortPage extends GetView<SelectionSortController> {
  const SelectionSortPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return [
      const Divider(),
      numbersView().height(100),
      ButtonWidget.text(
        '生成一组随机数 ',
        backgroundColor:
            controller.isRunning ? Colors.black26 : AppColors.inversePrimary,
        width: 120,
        height: 40,
        onTap: controller.randomNumbers,
      ),
      const Gap(25),
      ButtonWidget.text(
        '开始排序',
        width: 120,
        height: 40,
        backgroundColor:
            controller.isRunning ? Colors.black26 : AppColors.primaryContainer,
        onTap: controller.onSortTapped,
      ),
      const Gap(25),
      const Divider(),
      const TextWidget.body2(
        '''算法步骤
      1:首先，将第一个元素设为最小值（或最大值）。
      2:然后，将列表中的每个元素与最小值（或最大值）进行比较，如果找到更小的（或更大的）值，则更新最小值（或最大值）的索引。
      3:最后，将最小值（或最大值）与列表中的第一个位置交换。
      4:重复步骤1-3，直到整个列表排序完成。''',
        maxLines: 10000,
        softWrap: true,
      ).marginSymmetric(horizontal: AppSpace.card),
    ].toColumn();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SelectionSortController>(
      init: SelectionSortController(),
      id: "selection_sort",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("选择排序")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }

  // 数字列表
  Widget numbersView() {
    Widget _oneNumber({required MyNumber nubmer}) {
      return AnimatedPositioned(
        duration: controller.swapDuration,
        top: 0,
        left: nubmer.left,
        child: Container(
          color: nubmer.isSwaping ? AppColors.error : AppColors.primary,
          width: controller.numberSize,
          height: controller.numberSize,
          child: Center(
              child: TextWidget.title2(
            '${nubmer.number}',
            textAlign: TextAlign.center,
            color: AppColors.onPrimary,
          )),
        ),
      );
    }

    var widgets = <Widget>[];
    for (int i = 0; i < controller.numbers.length; i++) {
      var widg = _oneNumber(nubmer: controller.numbers[i]);
      widgets.add(widg);
    }

    return Stack(
      children: widgets,
    );
  }
}
