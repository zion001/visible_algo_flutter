import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:visible_algo_flutter/common/index.dart';

import 'index.dart';

class BubbleSortPage extends GetView<BubbleSortController> {
  const BubbleSortPage({Key? key}) : super(key: key);

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
        '''冒泡排序的基本思想是将较大的元素逐渐“浮”到数组的右端，而较小的元素逐渐“沉”到数组的左端。其基本原理如下：

        1:从数组的第一个元素开始，比较相邻的两个元素。
        2:如果前一个元素大于后一个元素（升序排序），则交换它们的位置。
        3:步骤1和步骤2，直到遍历整个数组。
        4:上步骤，每次遍历都将最大的元素“冒泡”到数组的末尾。
        5:复以上步骤，但不包括已排序的最大元素，直到整个数组排序完成。''',
        maxLines: 10000,
        softWrap: true,
      ).marginSymmetric(horizontal: AppSpace.card),

    ].toColumn();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BubbleSortController>(
      init: BubbleSortController(),
      id: "bubble_sort",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("冒泡排序")),
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
