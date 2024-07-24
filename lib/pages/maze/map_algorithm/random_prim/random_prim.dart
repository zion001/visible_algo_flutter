// 随机PRIM算法
/*
1. 让迷宫全都是墙.。
2. 选一个格，作为迷宫的通路，然后把它的邻墙放入列表.。
3. 当列表里还有墙时:
    3.1 从列表里随机选一个墙，如果它对面的格子不是迷宫的通路:
        3.1.1把墙打通，让对面的格子成为迷宫的通路.。
        3.1.2把那个格子的邻墙加入列表。
    3.2 如果对面的格子已经是通路了，那就从列表里移除这面墙。
*/

import 'dart:async';
import 'dart:math';

import 'package:get/get.dart';
import 'package:visible_algo_flutter/pages/index.dart';
import 'package:visible_algo_flutter/pages/maze/controller.dart';
import 'package:visible_algo_flutter/pages/maze/index.dart';

typedef CallBackCreateMap = void Function(List<List<MapCell>> map); // 生成一步地图
typedef CallBackFinishMap = void Function(); // 地图生成完成

class RandomPrim {
  // 单例
  static final RandomPrim _shared = RandomPrim._internal();
  factory RandomPrim() {
    return _shared;
  }
  RandomPrim._internal();

  List<List<MapCell>>? mapData;
  int mapSize = 0;

  // 通路集合
  List<Point<int>> openedCells = <Point<int>>[];
  // 邻墙集合
  List<Point<int>> closedCells = <Point<int>>[];

  void createMapData(
    List<List<MapCell>> map, {
    required int stepMilliseconds,
    required CallBackCreateMap createCallBack,
    required CallBackFinishMap finishCallBack,
  }) {
    // 重置数据
    openedCells.clear();
    closedCells.clear();
    mapData?.clear();
    mapSize = 0;

    if (map.isEmpty) {
      //controller.close();
      return;
    }
    mapData = map;
    mapSize = map.length;

    // 将起点（左上角）放进通路， 将其邻居放入邻墙
    openedCells.add(const Point(0, 0));
    closedCells.add(const Point(1, 0));
    closedCells.add(const Point(0, 1));

    Timer.periodic(Duration(milliseconds: stepMilliseconds), (timer) {
      // 邻墙为空条件下结束
      if (closedCells.isEmpty) {
        timer.cancel();
        finishCallBack();
      } else {
        generateMapStep(); // 执行一步生成
        createCallBack(mapData!);
      }
    });
    return;
  }

  // 生成地图过程(一步)
  void generateMapStep() {
    if (closedCells.isEmpty) {
      // 邻居集合为空，生成地图结束
      return;
    }
    /* 随机去除邻居集合成员，将它添加到通路集合，并将它的邻居加到邻居集合 */
    //生成一个随机下标
    int index = Random().nextInt(closedCells.length);
    var pt = closedCells[index];
    // print('******************************');
    //print('准备操作单元格 ${pt.x} ${pt.y}');
    openedCells.add(pt); // 放入通路集合
    closedCells.removeAt(index); // 从邻居集合中移除
    //print('通路 $openedCells');
    //print('闭路 $closedCells');

    closedCells.addAll(_getNeighbors(pt: pt, size: mapSize)); // 加入新邻居
    //print('加入新邻居后闭路 $closedCells');

    // 随机生成一个打通通道的方向先后次序，如果对应方向上是通路，就打通这两个单元格
    var lstDirection = _getDirectionOrder();
    var openedNeighbor =
        _getOneOpenedNeighbor(pt: pt, lstDirection: lstDirection);
    // 打通墙壁
    _breakTheWall(cell: pt, otherCell: openedNeighbor);
  }

  // 获取反指定坐标单元格的邻居坐标(不在通路里的邻居,也不在邻居里的)
  List<Point<int>> _getNeighbors({required Point<int> pt, required int size}) {
    var neighbors = <Point<int>>[];
    if (pt.x > 0) {
      var tempPt = Point(pt.x - 1, pt.y);
      if (!openedCells.contains(tempPt) && !closedCells.contains(tempPt)) {
        neighbors.add(tempPt); // 左
      }
    }
    if (pt.y > 0) {
      var tempPt = Point(pt.x, pt.y - 1);
      if (!openedCells.contains(tempPt) && !closedCells.contains(tempPt)) {
        neighbors.add(tempPt); // 上
      }
    }
    if (pt.x < size - 1) {
      var tempPt = Point(pt.x + 1, pt.y);
      if (!openedCells.contains(tempPt) && !closedCells.contains(tempPt)) {
        neighbors.add(tempPt); // 右
      }
    }
    if (pt.y < size - 1) {
      var tempPt = Point(pt.x, pt.y + 1); //下
      if (!openedCells.contains(tempPt) && !closedCells.contains(tempPt)) {
        neighbors.add(tempPt); // 右
      }
    }
    //print("获取新邻居 ${neighbors}");
    return neighbors;
  }

  // 随机生成一个方向先后顺序
  List<MyDirection> _getDirectionOrder() {
    var lst = [
      MyDirection.left,
      MyDirection.top,
      MyDirection.right,
      MyDirection.bottom
    ];
    lst.shuffle();
    return lst;
  }

  // 判断给定坐标单元格，根据给定的方向顺序，找到第一个通路单元
  Point<int> _getOneOpenedNeighbor({
    required Point<int> pt,
    required List<MyDirection> lstDirection,
  }) {
    for (int i = 0; i < lstDirection.length; i++) {
      var ptNeighbor = _isOpendCell(pt: pt, direction: lstDirection[i]);
      if (ptNeighbor != Point<int>(-1, -1)) {
        return ptNeighbor;
      }
    }
    return Point(-1, -1);
  }

  // 判断指定单元格指定方向是否是通路单元, 如果是通路，则返回对应的下标，如果不是通路程，返回Point(-1,-1)
  Point<int> _isOpendCell(
      {required Point<int> pt, required MyDirection direction}) {
    var ptResult = pt;
    switch (direction.code) {
      case 0: //左
        ptResult = pt + Point(-1, 0);
        break;
      case 1: //上
        ptResult = pt + Point(0, -1);
        break;
      case 2: //右
        ptResult = pt + Point(1, 0);
        break;
      case 3: //下
        ptResult = pt + Point(0, 1);
        break;
    }
    if (ptResult.x < 0 ||
        ptResult.y < 0 ||
        ptResult.x > mapSize - 1 ||
        ptResult.y > mapSize - 1) {
      return Point(-1, -1);
    }
    var result = openedCells.firstWhere((point) => point == ptResult,
        orElse: () => Point(-1, -1));
    return result;
  }

  // 打通指定单元格间的墙壁
  void _breakTheWall(
      {required Point<int> cell, required Point<int> otherCell}) {
    // 判断两个单元格的位置关系
    if (cell.x > otherCell.x) {
      // cell 在 other cell右边
      mapData?[cell.x][cell.y].open(direction: MyDirection.left); //打通cell左
      mapData?[otherCell.x][otherCell.y]
          .open(direction: MyDirection.right); //打通otherCell右
    } else if (cell.x < otherCell.x) {
      // cell 在 other cell左边
      mapData?[cell.x][cell.y].open(direction: MyDirection.right); //打通cell右
      mapData?[otherCell.x][otherCell.y]
          .open(direction: MyDirection.left); //打通otherCell左
    } else if (cell.y > otherCell.y) {
      // cell 在 other cell下边
      mapData?[cell.x][cell.y].open(direction: MyDirection.top); //打通cell上
      mapData?[otherCell.x][otherCell.y]
          .open(direction: MyDirection.bottom); //打通otherCell下
    } else if (cell.y < otherCell.y) {
      // cell 在 other cell上边
      mapData?[cell.x][cell.y].open(direction: MyDirection.bottom); //打通cell下
      mapData?[otherCell.x][otherCell.y]
          .open(direction: MyDirection.top); //打通otherCell上
    }
  }
}
