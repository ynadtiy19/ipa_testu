import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:my_first_app/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';

import 'my_bottom_navigation_bar_model.dart';

class MyBottomNavigationBar extends StackedView<MyBottomNavigationBarModel> {
  const MyBottomNavigationBar(
    this.onTabSelected, {
    Key? key,
  }) : super(key: key);

  final Function(int) onTabSelected;
  // final void Function(int index) onTabSelectedCallback;
// 使用媒体查询来获取底部导航栏的高度，您可以调整0.08的比例以适应不同平台和需求
  @override
  Widget builder(
    BuildContext context,
    MyBottomNavigationBarModel viewModel,
    Widget? child,
  ) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
            rippleColor: Colors.grey[300]!,
            hoverColor: Color(kcRiceYellowColor.value),
            gap: 8,
            activeColor: Colors.black,
            iconSize: 24,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: Duration(milliseconds: 400),
            tabBackgroundColor: Color(kcRiceYellowColor.value),
            color: Colors.black,
            onTabChange: (index) {
              //其中index是gnov的一个固定变量
              onTabSelected(index);
              // viewModel.showTagLabel(context);
              // viewModel.showTagmention(index);
              // viewModel.onTabChange(index);
              // viewModel.onTabSelectedCallback(index);
              // 根据gnov变量值，进行选中，作为匿名函数的一部分（匿名函数的参数）Notify parent about index change
            },
            tabs: const [
              GButton(
                icon: LineIcons.telegram,
                text: 'Chatbuddy',
              ),
              GButton(
                icon: LineIcons.tasks,
                text: 'Todopad',
              ),
              GButton(
                icon: LineIcons.pinterestSquare,
                text: 'Gallery',
              ),
              GButton(
                icon: LineIcons.userAlt,
                text: 'Profile',
              ),
            ],
          ),
        )));
  }

  @override
  MyBottomNavigationBarModel viewModelBuilder(BuildContext context) =>
      MyBottomNavigationBarModel();
}
