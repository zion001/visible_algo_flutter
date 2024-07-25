
import 'dart:math';
import 'package:visible_algo_flutter/pages/index.dart';
import 'package:visible_algo_flutter/pages/maze/index.dart';

enum SearchResult {
  failed, //搜索失败，没有路径
  searching, //搜索仍在进行中
  finished, //搜索成功，找到路径
}

/// 深度优先搜索路径

typedef CallBackSearchPath = void Function(List<Point<int>> tempPath, List<Point<int>> failedPath); // 搜索路径
typedef CallBackFinishSearch = void Function(); // 搜索完成
typedef CallBackFailedSearch = void Function(); // 搜索失败

class DeepFirstPath {
  // 单例
  static final DeepFirstPath _shared = DeepFirstPath._internal();
  factory DeepFirstPath() {
    return _shared;
  }
  DeepFirstPath._internal();

  // 暂存路径
  List<Point<int>> stackTempPath = [];
  // 已搜索但走不通的路径
  List<Point<int>> failedPath = [];

  // 寻找路径
  Future<void> searchPath(
    List<List<MapCell>> map, {
    required int stepMilliseconds,
    required CallBackSearchPath searchCallBack,
    required CallBackFinishSearch finishCallBack,
    required CallBackFailedSearch failedCallBack,
  }) async {
    // 重置
    stackTempPath.clear();
    failedPath.clear();
    // 将起点放入暂存
    stackTempPath.add(Point(0, 0));

    SearchResult searchResult;
    do {
      print('************************');
      print('暂存路径： $stackTempPath');
      print('失败: $failedPath');
      searchResult = _searhOneStep(map: map, ptCell: stackTempPath.last);
      switch (searchResult) {
        case SearchResult.failed:
          failedCallBack();
          break;
        case SearchResult.searching:
          searchCallBack(stackTempPath, failedPath);
          await Future.delayed(Duration(milliseconds: stepMilliseconds));
          continue;
        case SearchResult.finished:
          finishCallBack();
          break;
      }
    } while (searchResult != SearchResult.failed &&
        searchResult != SearchResult.finished);
  }

  //找指定单元格的邻居，如果可通行，则将邻居放到暂存路径，并进入下一次
  SearchResult _searhOneStep(
      {required List<List<MapCell>> map, required Point<int> ptCell}) {
    //左
    if (_isOpen(map: map, ptCell: ptCell, direction: MyDirection.left)) {
      Point<int> neighbor =
          _getNeighbor(ptCell: ptCell, direction: MyDirection.left);
      stackTempPath.add(neighbor);
      return (neighbor.x == map.length-1 && neighbor.y == map.length-1)
          ? SearchResult.finished
          : SearchResult.searching;
    }
    //上
    else if (_isOpen(map: map, ptCell: ptCell, direction: MyDirection.top)) {
      Point<int> neighbor =
          _getNeighbor(ptCell: ptCell, direction: MyDirection.top);
      stackTempPath.add(neighbor);
      return (neighbor.x == map.length-1 && neighbor.y == map.length-1)
          ? SearchResult.finished
          : SearchResult.searching;
    }
    //右
    else if (_isOpen(map: map, ptCell: ptCell, direction: MyDirection.right)) {
      Point<int> neighbor =
          _getNeighbor(ptCell: ptCell, direction: MyDirection.right);
      stackTempPath.add(neighbor);
      return (neighbor.x == map.length-1 && neighbor.y == map.length-1)
          ? SearchResult.finished
          : SearchResult.searching;
    }
    //下
    else if (_isOpen(map: map, ptCell: ptCell, direction: MyDirection.bottom)) {
      Point<int> neighbor =
          _getNeighbor(ptCell: ptCell, direction: MyDirection.bottom);
      stackTempPath.add(neighbor);
      return (neighbor.x == map.length-1 && neighbor.y == map.length-1)
          ? SearchResult.finished
          : SearchResult.searching;
    }
    // 所有方向均不可行，从将此单元格放入failedPath中，并且从 stackTempPath中移出
    else {
      stackTempPath.removeLast();
      if (stackTempPath.isEmpty) {
        //搜索失败
        return SearchResult.failed;
      }
      failedPath.add(ptCell);
      return SearchResult.searching;
    }
  }

  // 判断指定坐标cell的指定方向是否可通行(两个单元格可通行，且对应方向邻居不在failedPath中, 也不在stackTempPath中)
  bool _isOpen(
      {required List<List<MapCell>> map,
      required Point<int> ptCell,
      required MyDirection direction}) {
    MapCell cell = map[ptCell.x][ptCell.y];
    if (!cell.isOpen(direction: direction)) {
      return false;
    }
    // 对应方向邻居
    var neighbor = _getNeighbor(ptCell: ptCell, direction: direction);
    return !failedPath.contains(neighbor) && !stackTempPath.contains(neighbor);
  }

  // 获取指定单元格的指定方向邻居
  Point<int> _getNeighbor(
      {required Point<int> ptCell, required MyDirection direction}) {
    switch (direction) {
      case MyDirection.left:
        return ptCell + Point(-1, 0);
      case MyDirection.top:
        return ptCell + Point(0, -1);
      case MyDirection.right:
        return ptCell + Point(1, 0);
      case MyDirection.bottom:
        return ptCell + Point(0, 1);
    }
  }
}
