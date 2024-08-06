import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:visible_algo_flutter/common/index.dart';
import 'package:visible_algo_flutter/pages/sorts/bubble_sort/controller.dart';

import 'index.dart';

class InsertSortPage extends GetView<InsertSortController> {
  const InsertSortPage({Key? key}) : super(key: key);

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
        onTap: controller.onRandomNumberTapped,
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
        '''顾名思义，就是把一个新的元素插入已排好序的数组形成一个新的已排好序的数组 从第一个元素开始，取下一个元素比较后实现排序，形成新的数组， 再取第三个元素与该数组比较， 比较时从该数组的最后一位开始比较， 若新元素比与其比较的元素小，则将该比较的元素后移以为， 直到新元素比该数组左边找到其应该插入的位置。''',
        maxLines: 10000,
        softWrap: true,
      ).marginSymmetric(horizontal: AppSpace.card),
    ].toColumn();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InsertSortController>(
      init: InsertSortController(),
      id: "insert_sort",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("插入排序")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }

  // 数字列表
  Widget numbersView() {
    Widget _oneNumber({required MyInsertionNumber nubmer}) {
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
