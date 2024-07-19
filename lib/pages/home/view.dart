import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visible_algo_flutter/common/index.dart';
import 'index.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("HomePage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      id: "home",
      builder: (_) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              appBar(),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: controller.items.length,
                  (context, index) => ListTile(
                    title: TextWidget.title2(controller.items[index].title),
                    subtitle:
                        TextWidget.body2(controller.items[index].subTitle, softWrap: true, overflow: TextOverflow.visible, maxLines: null,),
                        trailing: const Icon(Icons.chevron_right, color: Colors.black26,),
                        onTap: ()=>controller.onListItemTapped(controller.items[index].route),
                  ),

                ),
                //itemExtent: 50,
              )
            ],
          ),
        );
      },
    );
  }

  // app bar
  Widget appBar() {
    return SliverAppBar(
      //title: const TextWidget.title1('看见算法', color: Colors.white,),
      backgroundColor: AppColors.primary,
      expandedHeight: 200,
      floating: true,
      pinned: true,
      snap: true,
      actions: [
        ButtonWidget.icon(
          const Icon(
            Icons.info_outline_rounded,
            color: Colors.white,
          ),
          onTap: () {},
        ),
      ],
      flexibleSpace: const FlexibleSpaceBar(
        title: TextWidget.title1(
          "看见算法",
          color: Colors.white,
        ),
        centerTitle: true,
        collapseMode: CollapseMode.pin,
        background: ImageWidget.asset(
          AssetsImages.barBgJpeg,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
