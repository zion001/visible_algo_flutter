import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:visible_algo_flutter/common/index.dart';

import 'index.dart';
import 'widgets/maze_painter.dart';

class MazePage extends GetView<MazeController> {
  const MazePage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return [
      AspectRatio(
        aspectRatio: 1.0,
        child: Container(
          width: controller.paintSize,
          height: controller.paintSize,
          child: CustomPaint(
            painter: MazePainter(
              mapCells: controller.mapCells,
              tempSearchPath: controller.tempSearchPath,
              failedSearchPath: controller.failedSearchPath,
            ),
          ),
        ).border(
          all: 0.8,
          color: AppColors.primary,
        ),
      ),
      const Divider(
        thickness: 0.5,
      ),
      [
        [
          const TextWidget.body2('地图大小'),
          Gap(AppSpace.button),
          IgnorePointer(
            ignoring: controller.isMapCreating,
            child: DropdownButton(
              value: controller.selMapSize,
              items: controller.listMapSize.map((size) {
                return DropdownMenuItem(
                  value: size,
                  child: TextWidget.body2('$size').center(),
                );
              }).toList(),
              underline: null,
              onChanged: (size) {
                //controller.setMapSize(size ?? controller.listMapSize.first);
                controller.createMapSize(
                    size: size ?? controller.listMapSize.first);
              },
            ),
          ),
        ].toRow(),
        const TextWidget.body2('生成算法'),
        IgnorePointer(
          ignoring: controller.isMapCreating,
          child: ButtonWidget.textFilled(
            controller.isMapCreating ? '生成中' : '生成地图',
            textColor: Colors.white,
            bgColor:
                controller.isMapCreating ? AppColors.error : AppColors.primary,
            onTap: controller.createMapData,
          ),
        ),
      ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
      const Divider(
        thickness: 0.5,
      ),
      ButtonWidget.textFilled('寻找路径', textColor: Colors.white, height: 40, onTap: controller.searchPath,),
    ].toListView().paddingHorizontal(AppSpace.page);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MazeController>(
      init: MazeController(),
      id: "maze",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("maze")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
