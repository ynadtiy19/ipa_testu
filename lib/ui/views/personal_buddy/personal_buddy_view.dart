import 'package:flutter/material.dart';
import 'package:my_first_app/ui/widgets/common/tag_line/tag_line.dart';
import 'package:stacked/stacked.dart';

import 'personal_buddy_viewmodel.dart';

class PersonalBuddyView extends StackedView<PersonalBuddyViewModel> {
  const PersonalBuddyView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PersonalBuddyViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Center(
          child: TagLine(),
        ));
  }

  @override
  PersonalBuddyViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PersonalBuddyViewModel();
}
