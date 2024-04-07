import 'package:flutter/material.dart';
import 'package:my_first_app/ui/widgets/common/color_palette_page/color_palette_page.dart';
import 'package:stacked/stacked.dart';

import 'to_do_viewmodel.dart';

class ToDoView extends StackedView<ToDoViewModel> {
  const ToDoView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ToDoViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: ColorPalettePage(),
      ),
    );
  }

  @override
  ToDoViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ToDoViewModel();
}
