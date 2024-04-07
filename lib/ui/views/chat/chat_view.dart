import 'package:flutter/material.dart';
import 'package:my_first_app/ui/views/chat/page/AppOpenPage.dart';
import 'package:my_first_app/ui/views/chat/page/HomePage.dart';
import 'package:my_first_app/ui/widgets/common/translation/translation.dart';
import 'package:stacked/stacked.dart';

import 'chat_viewmodel.dart';

class ChatView extends StackedView<ChatViewModel> {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ChatViewModel viewModel,
    Widget? child,
  ) {
    return SplashPage();
  }

  @override
  ChatViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ChatViewModel();
}
