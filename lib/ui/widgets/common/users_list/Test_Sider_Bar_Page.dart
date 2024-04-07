import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:my_first_app/ui/common/app_colors.dart';
import 'package:my_first_app/ui/common/ui_helpers.dart';
import 'package:side_rail/side_rail.dart';

class TestSiderBarPage extends StatefulWidget {
  const TestSiderBarPage({super.key});

  @override
  State<TestSiderBarPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestSiderBarPage> {
  int _selectedIndex = 0;
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideRail(
            isExpanded: !isExpanded,
            selectedIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            expandedWidth: 300,
            backgroundColor: Colors.white,
            unselectedColor: Colors.black,
            tileActiveColor: Color(kcHotPinkWithTealColor.value),
            logoPadding: 10,
            margin: const EdgeInsets.all(9),
            logo: Image.network(
              'https://th.bing.com/th/id/R.a4c78f98e707adfe4a9e024fc94c60cd?rik=t4OBjeoHBmDQSA&riu=http%3a%2f%2fpic.zsucai.com%2ffiles%2f2013%2f0717%2fbingo4.jpg&ehk=7%2fpyasmzImudxXSc5zx0K5jp8%2fOqQnsg3SmeEo%2bAMpY%3d&risl=&pid=ImgRaw&r=0',
              // 使用父级约束的高度
            ),
            footer: Visibility(
              visible: !isExpanded,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.withOpacity(.2),
                ),
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    ElevatedButton(
                        onPressed: () {}, child: const Text("Upgrade to Pro")),
                    verticalSpaceSmall,
                    Text(
                      "Upgrade to PRO version for more features.",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.grey, fontSize: 11),
                    )
                  ],
                ),
              ),
            ),
            navItems: const [
              NavDestinationItem(
                  isSectionHeader: false,
                  radius: 20,
                  trailing: Icon(
                    LineIcons.seedling,
                    size: 16,
                  ),
                  icon: Icon(LineIcons.home),
                  title: Text("Dashboard")),
              NavDestinationItem(
                  isSectionHeader: false,
                  radius: 20,
                  trailing: Icon(
                    Icons.chevron_right_rounded,
                    size: 16,
                  ),
                  icon: Icon(Icons.payment),
                  title: Text("Transaction")),
              NavDestinationItem(
                  isSectionHeader: false,
                  radius: 20,
                  trailing: Icon(
                    Icons.chevron_right_rounded,
                    size: 16,
                  ),
                  icon: Icon(Icons.credit_card),
                  title: Text("Card Payments")),
              NavDestinationItem(
                  isSectionHeader: false,
                  radius: 20,
                  trailing: Icon(
                    Icons.chevron_right_rounded,
                    size: 16,
                  ),
                  icon: Icon(Icons.folder),
                  title: Text("Documents")),
              NavDestinationItem(
                  isSectionHeader: true,
                  icon: Icon(Icons.report),
                  title: Text("Reports")),
              NavDestinationItem(
                  isSectionHeader: false,
                  radius: 20,
                  trailing: Icon(
                    Icons.chevron_right_rounded,
                    size: 16,
                  ),
                  icon: Icon(Icons.stacked_line_chart),
                  title: Text("Management Reports")),
              NavDestinationItem(
                  isSectionHeader: false,
                  radius: 20,
                  trailing: Icon(
                    Icons.chevron_right_rounded,
                    size: 16,
                  ),
                  icon: Icon(Icons.stacked_bar_chart),
                  title: Text("Financial Reports")),
              NavDestinationItem(
                  isSectionHeader: true,
                  icon: Icon(Icons.settings),
                  title: Text("Settings")),
              NavDestinationItem(
                  isSectionHeader: false,
                  radius: 20,
                  trailing: Icon(
                    Icons.chevron_right_rounded,
                    size: 16,
                  ),
                  icon: Icon(Icons.brush),
                  title: Text("Clear Cache")),
              NavDestinationItem(
                  isSectionHeader: false,
                  radius: 20,
                  trailing: Icon(
                    Icons.chevron_right_rounded,
                    size: 16,
                  ),
                  icon: Icon(Icons.settings),
                  title: Text("Preferences")),
              NavDestinationItem(
                  isSectionHeader: false,
                  radius: 20,
                  trailing: Icon(
                    Icons.chevron_right_rounded,
                    size: 16,
                  ),
                  icon: Icon(Icons.admin_panel_settings),
                  title: Text("Admin Settings")),
            ],
          ),
          // Expanded(
          //     child: Stack(
          //   children: [
          //     Column(
          //       children: [
          //         Container(
          //           color: Color.fromARGB(255, 227, 198, 198),
          //           child: Center(
          //               child: InkWell(
          //                   onTap: () {
          //                     setState(() {
          //                       isExpanded = !isExpanded;
          //                     });
          //                   },
          //                   child: const Icon(LineIcons.appStore))),
          //         ),
          //       ],
          //     ),
          //   ],
          // )),
        ],
      ),
    );
  }
}
