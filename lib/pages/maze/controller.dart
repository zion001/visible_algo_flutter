import 'dart:math';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:visible_algo_flutter/common/index.dart';
import 'package:visible_algo_flutter/pages/maze/map_algorithm/random_prim/random_prim.dart';
import 'package:visible_algo_flutter/pages/maze/path_algorithm/deep_first_path/deep_first_path.dart';

// 生成地图算法
enum MapCreateAlgorithm {
  prim(0, '随机Prim算法');
  const MapCreateAlgorithm(this.code, this.name);
  final int code;
  final String name;
}

enum MyDirection {
  left( 0, 'left' ),
  top( 1, 'top' ),
  right( 2, 'right' ),
  bottom( 3, 'bottom' );

  const MyDirection(this.code, this.direction);

  final int code;
  final String direction;
}

class MapCell {
  List<int> listConnect = [1, 1, 1, 1]; // 对应左/上/右/下四个方向的连通, 1:墙壁隔断 0:连通
  
  MapCell? previousCell; // 前导单元格

  // 打开指定方向 direction: 0123分别对应左上右下
  void open({required MyDirection direction}) {
    listConnect[direction.code] = 0;
  }

  // 判断指定方向开闭
  bool isOpen({required MyDirection direction}) {
    return listConnect[direction.code] == 0;
  }
}

class MazeController extends GetxController {

  //地图数据
  List<List<MapCell>> mapCells =  List<List<MapCell>>.empty(growable: true);
  // 画布Size
  double paintSize = Get.width - AppSpace.page * 2;
  // 地图规模列表
  List<int> listMapSize = [25, 50, 75];
  // 当前选中的地图规模
  int selMapSize = 25;
  // 算法列表
  List<String> listAlgorithm = ['算法A', '算法B', '算法C', ];

  // 是否在生成地图运行中
  //bool isMapCreating = false;
  bool isRunning = false;

  // 搜索过程中的暂存路径
  List<Point<int>> tempSearchPath = [];
  // 搜索过程中的失败路径
  List<Point<int>> failedSearchPath = [];

  MazeController();

  _initData() {
    // 默认选中第一个
    //selMapSize = listMapSize.first;
    createMapSize(size: listMapSize.first);
    update(["maze"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  @override
  void onClose() {
    super.onClose();
    DeepFirstPath().stop();
  }

/*
  // 选中地图规模
  void setMapSize(size) {
    selMapSize = size;
    createMapSize(selMapSize);
    update(["maze"]);
  }
  */

  // 生成地图规模
  void createMapSize({required int size}) {
    tempSearchPath.clear();
    failedSearchPath.clear();

    selMapSize = size;
    mapCells = List.generate(size, (_) => List.generate(size, (_) => MapCell()) );
    update(["maze"]);
  }

  //生成地图数据
  void createMapData() {
    tempSearchPath.clear();
    failedSearchPath.clear();

    createMapSize(size:selMapSize);
    isRunning = true;
    RandomPrim().createMapData(mapCells, stepMilliseconds: 3, createCallBack: (cells){
      mapCells = cells;
      update(["maze"]);
    }, finishCallBack: (){
      isRunning = false;
      update(["maze"]);
    });
  }

  void searchBtnTapped() {
    if ( !isMapAvailable(mapCells) ) {
      EasyLoading.showError('请先生成地图');
      return;
    }
    searchPath();
  }

  //导找路径
  void searchPath() {
    isRunning = true;
    DeepFirstPath().searchPath(mapCells, stepMilliseconds: 30, searchCallBack: (List<Point<int>> tempPath, List<Point<int>> failedPath){
      tempSearchPath = tempPath;
      failedSearchPath = failedPath;
      update(["maze"]);
    }, finishCallBack: (){
      print("搜索完成");
      isRunning = false;
      update(["maze"]);
    }, failedCallBack: (){
      print("搜索失败");  
      isRunning = false;
      update(["maze"]);
    }, stopCallBack: () {
      print("停止搜索");
      isRunning = false;
    },);
  }

  //判断是否有正常的地图
  bool isMapAvailable( List<List<MapCell>> mapCells) {
    if (mapCells.isEmpty) {
      return false;
    }
    if (mapCells.first.isEmpty) {
      return false;
    }
    MapCell cell = mapCells.first.first;
    if (!cell.isOpen(direction: MyDirection.left) &&
      !cell.isOpen(direction: MyDirection.top) &&
      !cell.isOpen(direction: MyDirection.right) &&
      !cell.isOpen(direction: MyDirection.bottom) 
    ) {
      return false;
    }
    return true;
  }



}
