import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:visible_algo_flutter/common/index.dart';
import 'package:visible_algo_flutter/common/widgets/text.dart';

import 'index.dart';

class ShareTheMoneyPage extends GetView<ShareTheMoneyController> {
  const ShareTheMoneyPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return ListView(
      children: [
        // 图表
        SfCartesianChart(
          primaryXAxis: const NumericAxis(
            isVisible: false,
            crossesAt: 0, // 将 X 轴放置在 Y 轴的 0 位置
          ),
          primaryYAxis: const NumericAxis(
            minimum: -500,
            maximum: 500,
          ),
          legend: const Legend(isVisible: false),
          tooltipBehavior: TooltipBehavior(enable: true),
          series: <CartesianSeries<MoneyData, int>>[
            ColumnSeries<MoneyData, int>(
              dataSource: controller.moneyList,
              xValueMapper: (MoneyData money, _) => money.index,
              yValueMapper: (MoneyData money, _) => money.money,
              name: '各人员金钱数',
              dataLabelSettings: const DataLabelSettings(isVisible: false),
            )
          ],
        ),
        const Divider(
          color: Colors.black12,
          thickness: 0.5,
        ),
        Obx(
          () => TextWidget.body2(
            '已执行次数: ${controller.curCount} / ${controller.count}',
            textAlign: TextAlign.center,
          ),
        ),
        // 执行次数
        [
          const TextWidget.title3('  执行次数'),
          Obx(() => IgnorePointer(
                ignoring: controller.isRunning.value,
                child: InputWidget.text(
                  controller: controller.countTextController,
                  hintText: '请输入执行次数',
                  textAlign: TextAlign.end,
                ),
              ).expanded()),
        ].toRow(),
        const Divider(
          color: Colors.black12,
          thickness: 0.5,
        ),
        // 执行速度
        [
          const TextWidget.title3('  执行倍率').expanded(),
          DropdownButtonHideUnderline(
            child: Obx(
              () => IgnorePointer(
                ignoring: controller.isRunning.value,
                child: DropdownButton(
                  value: controller.curSpeed.value,
                  items: controller.speedList.map((speed) {
                    return DropdownMenuItem(
                      value: speed,
                      child: TextWidget.body2('$speed倍').center(),
                    );
                  }).toList(),
                  underline: null,
                  onChanged: (speed) {
                    controller.setSpeed(speed ?? 1);
                  },
                ),
              ),
            ),
          ),
        ].toRow(),
        const Divider(
          color: Colors.black12,
          thickness: 0.5,
        ),
        // 允许负数
        [
          const TextWidget.title3('  允许负数').expanded(),
          Obx(() => IgnorePointer(
                ignoring: controller.isRunning.value,
                child: CupertinoSwitch(
                  value: controller.isAllowNegtive.value,
                  activeColor: AppColors.primary,
                  onChanged: (_) {
                    controller.onAllowNegtiveChange();
                  },
                ),
              )),
        ].toRow(),
        const Divider(
          color: Colors.black12,
          thickness: 0.5,
        ),
        // 执行
        const Gap(20),
        Obx(
          () => ButtonWidget.textRoundFilled(
            controller.isRunning.value ? '停止' : '执行',
            bgColor: controller.isRunning.value
                ? AppColors.error
                : AppColors.primary,
            borderRadius: 10,
            textColor: Colors.white,
            height: 40,
            onTap: controller.onExecuteTapped,
          ).marginSymmetric(horizontal: AppSpace.button),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShareTheMoneyController>(
      init: ShareTheMoneyController(),
      id: "share_the_money",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("模拟分钱")),
          body: SafeArea(
            child: _buildView()
                .onTap(() => FocusScope.of(context).requestFocus(FocusNode())),
          ),
        );
      },
    );
  }
}
