import 'package:stacked/stacked.dart';

class TagmentionModel extends BaseViewModel {
  // OverlayEntry overlayEntry;

  // void showInstagramMention(BuildContext context) {
  //   // 移除现有的OverlayEntry
  //   overlayEntry.remove();

  //   // 获取与Overlay关联的BuildContext
  //   BuildContext overlayContext = Overlay.of(context).context;

  //   // 获取RenderBox
  //   RenderBox renderBox = context.findRenderObject() as RenderBox;

  //   // 确保我们有一个非空的RenderBox
  //   if (renderBox.hasSize) {
  //     var size = renderBox.size;
  //     var offset =
  //         renderBox.localToGlobal(Offset.zero, ancestor: overlayContext);

  //     // 计算OverlayEntry的位置
  //     double left = offset.dx + (size.width / 2);
  //     double top = offset.dy - 50; // 假设InstagramMention高度为50

  //     overlayEntry = OverlayEntry(
  //       builder: (context) => Positioned(
  //         left: left,
  //         top: top,
  //         child: InstagramMention(
  //           text: 'Lily Collins',
  //         ),
  //       ),
  //     );

  //     // 获取Overlay并插入OverlayEntry
  //     Overlay.of(overlayContext).insert(overlayEntry);
  //   }
  // }

  // // 清理OverlayEntry以防止内存泄漏
  // @override
  // void dispose() {
  //   overlayEntry.remove();
  //   super.dispose();
  // }
}
