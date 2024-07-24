import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:visible_algo_flutter/common/index.dart';

import 'index.dart';

class MonteCarloPiPage extends GetView<MonteCarloPiController> {
  const MonteCarloPiPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return [
      AspectRatio(
        aspectRatio: 1.0,
        child: Container(
          width: controller.paintSize,
          height: controller.paintSize,
          child: CustomPaint(
            painter: MyPainter(listPoints: controller.listPoints),
          ),
        ).border(
          all: 0.8,
          color: AppColors.primary,
        ),
      ),
      Gap(AppSpace.button),
      [
        TextWidget.body2('内:${controller.inCnt}'),
        TextWidget.body2('外:${controller.outCnt}'),
        TextWidget.body2('近似Pi:${controller.estimatedPi.toStringAsFixed(10)}'),
      ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
      Gap(AppSpace.button),
      // 图表
      SfCartesianChart(
        primaryXAxis: NumericAxis(
          isVisible: false,
          crossesAt: 3.14159, // 将 X 轴放置在 Y 轴的 0 位置
          minimum: 0.0,
          maximum: controller.totalCount / 20,
        ),
        primaryYAxis: NumericAxis(
          minimum: 2.8,
          maximum: 3.4,
          interval: 0.1,
          plotBands: [
            PlotBand(
              start: 3.14159,
              end: 3.14159,
              borderColor: AppColors.error,
              borderWidth: 1.0,
            )
          ],
        ),
        annotations: [
          CartesianChartAnnotation(
            widget: TextWidget.body2(
              '\u03C0',
              color: AppColors.error,
            ),
            x: controller.totalCount / 20 - 15,
            y: 3.18,
            coordinateUnit: CoordinateUnit.point,
          ),
        ],
        legend: const Legend(isVisible: false),
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <CartesianSeries<EstimatedPi, int>>[
          LineSeries<EstimatedPi, int>(
            dataSource: controller.listPi,
            width: 0.5,
            xValueMapper: (EstimatedPi estPi, _) => estPi.index,
            yValueMapper: (EstimatedPi estPi, _) => estPi.pi,
            name: '估算Pi值',
            dataLabelSettings: const DataLabelSettings(isVisible: false),
          )
        ],
      ).height(200),
      Gap(AppSpace.button * 2),
      ButtonWidget.textFilled(
        controller.isRunning ? '停止' : '开始',
        bgColor: controller.isRunning ? AppColors.error : AppColors.primary,
        height: 45,
        textColor: AppColors.onPrimary,
        onTap: controller.onExecuteTapped,
      ),
    ].toListView().paddingHorizontal(AppSpace.page);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MonteCarloPiController>(
      init: MonteCarloPiController(),
      id: "monte_carlo_pi",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("蒙特卡洛求Pi近似值")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}

class MyPainter extends CustomPainter {
  List<MyPoint> listPoints;

  MyPainter({required this.listPoints});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
      size.center(Offset.zero),
      size.width / 2,
      Paint()
        ..color = AppColors.primary
        ..strokeWidth = 0.25
        ..style = PaintingStyle.stroke,
    );
    var inOffsets = <Offset>[];
    var outOffsets = <Offset>[];
    for (int i = 0; i < listPoints.length; ++i) {
      if (listPoints[i].isIncluded()) {
        inOffsets.add(Offset(listPoints[i].x, listPoints[i].y));
      } else {
        outOffsets.add(Offset(listPoints[i].x, listPoints[i].y));
      }
    }
    canvas.drawPoints(
      PointMode.points,
      inOffsets,
      Paint()
        ..color = AppColors.primary
        ..strokeCap = StrokeCap.round
        ..strokeWidth = 1.0,
    );
    canvas.drawPoints(
      PointMode.points,
      outOffsets,
      Paint()
        ..color = AppColors.error
        ..strokeCap = StrokeCap.round
        ..strokeWidth = 1.0,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    if (listPoints.length < 100) {
      return true;
    } else if (listPoints.length >= 100 &&
        listPoints.length < 1000 &&
        listPoints.length % 5 == 0) {
      return true;
    } else if (listPoints.length >= 1000 &&
        listPoints.length < 5000 &&
        listPoints.length % 20 == 0) {
      return true;
    } else if (listPoints.length >= 5000 && listPoints.length % 100 == 0) {
      return true;
    }

    return false;
  }
}
