import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:my_first_app/app/app.locator.dart';
import 'package:my_first_app/app/app.router.dart';
import 'package:my_first_app/ui/utils/Utils.dart';
import 'package:my_first_app/ui/views/chat/chat_view.dart';
import 'package:my_first_app/ui/views/chat/page/SettingPage.dart';
import 'package:my_first_app/ui/views/personal_buddy/personal_buddy_view.dart';
import 'package:my_first_app/ui/views/profile/profile_view.dart';
import 'package:my_first_app/ui/views/to_do/to_do_view.dart';
import 'package:my_first_app/ui/widgets/common/my_bottom_navigation_bar/my_bottom_navigation_bar.dart';
import 'package:my_first_app/ui/widgets/common/my_bottom_navigation_bar/my_bottom_navigation_bar_model.dart';
import 'package:my_first_app/ui/widgets/common/tagmention/tagmention.dart';
import 'package:my_first_app/ui/widgets/common/users_list/Test_Sider_Bar_Page.dart';
import 'package:stacked/stacked.dart';
import 'package:my_first_app/ui/common/app_colors.dart';
import 'package:my_first_app/ui/common/ui_helpers.dart';
import 'package:vibration/vibration.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    double screenWidth = MediaQuery.of(context).size.width;

    double navigationBarHeight = 75; // 底部导航栏高度

    Map<String, double> positionValues =
        viewModel.calculatePosition(screenWidth);

    return Scaffold(
      drawer: Drawer(
        child: TestSiderBarPage(),
      ),

      // drawer: TestSiderBarPage(),
      // body: SafeArea(
      //   child: Padding(
      //     padding: const EdgeInsets.symmetric(horizontal: 25.0),
      //     child: Center(
      //       child: Column(
      //         mainAxisSize: MainAxisSize.min,
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           verticalSpaceLarge,
      //           Column(
      //             children: [
      //               const Text(
      //                 'Hello, STACKED!',
      //                 style: TextStyle(
      //                   fontSize: 35,
      //                   fontWeight: FontWeight.w900,
      //                 ),
      //               ),
      //               verticalSpaceMedium,
      //               MaterialButton(
      //                 color: Color.fromARGB(255, 187, 84, 84),
      //                 onPressed: viewModel.incrementCounter,
      //                 child: Text(
      //                   viewModel.counterLabel,
      //                   style: const TextStyle(color: Colors.white),
      //                 ),
      //               ),
      //             ],
      //           ),
      //           verticalSpaceLarge,
      //           // Add buttons here,准备进入chat界面，与以上划分一条分界线
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               MaterialButton(
      //                 color: kcPrimaryColor,
      //                 onPressed: () =>
      //                     Navigator.of(context).pushNamed(Routes.chatView),
      //                 child: const Text(
      //                   'Go to Chat',
      //                   style: TextStyle(color: Colors.white),
      //                 ),
      //               ),
      //             ],
      //           ),
      //           // verticalSpaceLarge,

      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //               MaterialButton(
      //                 color: kcDarkGreyColor,
      //                 onPressed: viewModel.showDialog,
      //                 child: const Text(
      //                   'Show Dialog',
      //                   style: TextStyle(
      //                     color: Colors.white,
      //                   ),
      //                 ),
      //               ),
      //               MaterialButton(
      //                 color: kcDarkGreyColor,
      //                 onPressed: viewModel.showBottomSheet,
      //                 child: const Text(
      //                   'Show Bottom Sheet',
      //                   style: TextStyle(
      //                     color: Colors.white,
      //                   ),
      //                 ),
      //               ),
      //             ],
      //           )
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
      //建立body部分
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              elevation: 20,
              title: const Text('GoogleNavBar'),
              backgroundColor: Colors.transparent,
              // elevation: 0,
              // actions: [
              //   const SizedBox(width: 6),
              //   IconButton(
              //     icon: const Icon(Icons.security_rounded),
              //     splashColor: Colors.black54,
              //     iconSize: 40,
              //     color: const Color.fromRGBO(37, 34, 34, 1.0),
              //     onPressed: () {
              //       Vibration.vibrate(duration: 50);
              //       Utils.jumpPage(context, const SettingPage());
              //     },
              //   ),
              //   const SizedBox(width: 8),
              // ],
            ),
          ),
          // 主体内容
          Positioned.fill(
            top: navigationBarHeight,
            left: 0,
            right: 0,
            child: SafeArea(
              child: ViewModelBuilder<HomeViewModel>.reactive(
                viewModelBuilder: () => HomeViewModel(),
                builder: (context, model, child) {
                  print(
                      'uuudIndex in builder: ${viewModel.uuuindex}'); // 打印 uuudIndex 的值
                  return _buildBodyContent(viewModel.uuuindex); // 使用选中的索引值构建 UI
                },
              ),
            ),
          ),

          // 底部栏部分
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Builder(
              builder: (BuildContext context) {
                return MyBottomNavigationBar(
                  (index) {
                    // 处理底部导航栏按钮点击事件
                    viewModel.onTabChange(index);
                    print('Selected Index changed to: $index');
                    print('Selected Index: $index');
                  },
                );

                // 在底部导航栏上方显示的内容
              },
            ),
          ),
          // return {'left': fourthButtonLeft, 'right': fourthButtonRight};
          Positioned(
            left: positionValues['left'],
            right: positionValues['right'],
            bottom: navigationBarHeight,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return GestureDetector(
                  onTap: () {
                    viewModel
                        .startTimerToHideWidget(); // 调用 ViewModel 中的隐藏小部件的方法
                  },
                  child: Container(
                    child: Tagmention(
                      image: Image.network(
                        'https://th.bing.com/th/id/R.a4c78f98e707adfe4a9e024fc94c60cd?rik=t4OBjeoHBmDQSA&riu=http%3a%2f%2fpic.zsucai.com%2ffiles%2f2013%2f0717%2fbingo4.jpg&ehk=7%2fpyasmzImudxXSc5zx0K5jp8%2fOqQnsg3SmeEo%2bAMpY%3d&risl=&pid=ImgRaw&r=0',
                        // 使用父级约束的高度
                      ),
                      text: '🐳${viewModel.uuuindex}%',
                      imageRadius: positionValues['radiusTag']!,
                      spaceBetween: positionValues['spaceBetween']!,
                      isVisible: viewModel.isVisible,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBodyContent(int selectedIndex) {
    print('Current selectedIndex: $selectedIndex'); // 添加此行进行调试
    switch (selectedIndex) {
      case 0:
        return ChatView();
      case 1:
        return ToDoView();
      case 2:
        return PersonalBuddyView();
      case 3:
        return ProfileView();
      default:
        return Container();
    }
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
