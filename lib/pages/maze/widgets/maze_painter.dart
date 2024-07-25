import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:visible_algo_flutter/common/index.dart';
import 'package:visible_algo_flutter/pages/index.dart';

class MazePainter extends CustomPainter {
  double wallWidth; // 墙壁宽度
  Color wallColor; // 墙壁颜色

  List<List<MapCell>> mapCells; // 地图数据
  List<Point<int>> tempSearchPath; // 搜索暂存路径
  List<Point<int>> failedSearchPath; // 搜索失败路径

  MazePainter({
    this.wallWidth = 1.5,
    this.wallColor = Colors.black,
    required this.mapCells,
    required this.tempSearchPath,
    required this.failedSearchPath,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (mapCells.isEmpty) {
      return;
    }

    // 每个单元格大小
    var cellSize = size.width / mapCells.length;
    // 墙壁Painter
    var wallPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1;
    for (int i = 0; i < mapCells.length; ++i) {
      for (int j = 0; j < mapCells[i].length; ++j) {
        var cell = mapCells[i][j];
        var offset = Offset(i * cellSize, j * cellSize);
        drawCell(
          canvas: canvas,
          cell: cell,
          size: cellSize,
          offset: offset,
          paint: wallPaint,
        );
      }
    }
    // 标记起点和终点
    Offset entry = Offset(cellSize / 2, cellSize / 2);
    Offset exit = Offset(size.width - cellSize / 2, size.height - cellSize / 2);
    canvas.drawPoints(PointMode.points, [entry, exit], Paint()
      ..color = Colors.green // AppColors.primary
      ..strokeCap = StrokeCap.round
      ..strokeWidth = cellSize * 0.7);
    // 标记暂存路径
    var tempPathPoints = tempSearchPath.map( (pt){
      return Offset(pt.x * cellSize + cellSize / 2, pt.y * cellSize + cellSize / 2);
    }).toList();
    canvas.drawPoints(PointMode.points, tempPathPoints, Paint()
      ..color = Colors.orangeAccent // AppColors.primary
      ..strokeCap = StrokeCap.round
      ..strokeWidth = cellSize * 0.7);
    // 标记失败路径
    var faliedPathPoints = failedSearchPath.map( (pt){
      return Offset(pt.x * cellSize + cellSize / 2, pt.y * cellSize + cellSize / 2);
    }).toList();
    canvas.drawPoints(PointMode.points, faliedPathPoints, Paint()
      ..color = Colors.black26 // AppColors.primary
      ..strokeCap = StrokeCap.round
      ..strokeWidth = cellSize * 0.7);

  }

  // 画一个单元格canvas: 画布 cell:单元格数据 cellSize:单元格大小 offset:左上角坐标 paint
  void drawCell({
    required Canvas canvas,
    required MapCell cell,
    required double size,
    required Offset offset,
    required Paint paint,
  }) {
    if (!cell.isOpen(direction: MyDirection.left)) {
      canvas.drawLine(offset, offset + Offset(0, size), paint);
    }
    if (!cell.isOpen(direction: MyDirection.top)) {
      canvas.drawLine(offset, offset + Offset(size, 0), paint);
    }
    if (!cell.isOpen(direction: MyDirection.right)) {
      canvas.drawLine(
          offset + Offset(size, 0), offset + Offset(size, size), paint);
    }
    if (!cell.isOpen(direction: MyDirection.bottom)) {
      canvas.drawLine(
          offset + Offset(0, size), offset + Offset(size, size), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
