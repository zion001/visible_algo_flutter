import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:visible_algo_flutter/common/index.dart';

/// 通用列表项
class ListItemWidget extends StatelessWidget {
  /// 前图标
  final IconData? leading;

  /// 标题
  final String title;

  /// 内容
  final Widget? content;

  /// 后图标
  final Widget? trailing;

  /// 图标大小
  final double iconSize;

  /// 点击
  final Function()? onTapDown;

  const ListItemWidget({
    Key? key,
    this.leading,
    required this.title,
    this.content,
    this.trailing,
    this.iconSize = 30,
    w,
    this.onTapDown,
  }) : super(key: key);

  //const ListItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        leading,
        color: AppColors.onPrimaryContainer,
        size: iconSize,
      ),
      trailing: trailing ??
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.black26,
            size: 20.w,
          ),
      title: TextWidget.title3(title),
      tileColor: Colors.white,
    ).gestures(onTap: onTap).sliverToBoxAdapter();
  }

  // 点击事件
  void onTap() {
    if (onTapDown != null) {
      onTapDown!();
    }
  }
}
