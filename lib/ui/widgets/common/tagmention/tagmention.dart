import 'package:flutter/material.dart';
import 'package:my_first_app/ui/common/app_colors.dart';
import 'package:my_first_app/ui/common/rectangle_with_notch_painter.dart';
import 'package:stacked/stacked.dart';
import 'package:super_tooltip/super_tooltip.dart';

import 'tagmention_model.dart';

class Tagmention extends StackedView<TagmentionModel> {
  Tagmention({
    Key? key,
    required this.image,
    required this.text,
    this.textStyle =
        const TextStyle(fontSize: 18, color: kcHotPinkWithTealColor),
    this.padding = const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
    required this.imageRadius,
    this.margin,
    this.radius = 11,
    this.shadow = 0,
    this.triangleWidth = 8,
    this.triangleHeight = 8,
    this.triangleRadius = 3,
    this.color = Colors.black,
    required this.isVisible, // 新增一个属性用于控制可见性，默认为true
    required this.spaceBetween,
  })  : assert(text.trim().isNotEmpty, 'text value must not be empty.'),
        super(key: key);

  final bool isVisible; // 控制小部件的可见性

  /// The circular image besides the text.
  final Image image;

  /// The text value.
  final String text;

  /// The text style of the text value.
  final TextStyle textStyle;

  /// padding.
  final EdgeInsetsGeometry padding;

  /// margin.
  final EdgeInsetsGeometry? margin;

  /// The size [radius] of the circular image.
  final double imageRadius;

  /// The color of the painted shape.
  final Color color;

  /// The radius value for the edges of the shape (aka: border radius).
  final double radius;

  /// The box shadow behind the painted shape.
  final double shadow;

  /// The notch width.
  final double triangleWidth;

  /// The notch height.
  final double triangleHeight;

  /// The radius for the edges of the notch.
  final double triangleRadius;

  /// The space between the circle image and the text.
  final double spaceBetween;

  final _controller = SuperTooltipController();

  Future<bool> _willPopCallback() async {
    // If the tooltip is open we don't pop the page on a backbutton press
    // but close the ToolTip
    if (_controller.isVisible) {
      await _controller.hideTooltip();
      return false;
    }
    return true;
  }

  @override
  Widget builder(
    BuildContext context,
    TagmentionModel viewModel,
    Widget? child,
  ) {
    // ignore: deprecated_member_use
    if (!isVisible) return SizedBox(); // 如果小部件不可见，则返回一个空的 SizedBox
    return CustomPaint(
      painter: RectangleWithNotchPainter(
        color: color,
        radius: radius,
        shadow: shadow,
        triangleWidth: triangleWidth,
        triangleHeight: triangleHeight,
        triangleRadius: triangleRadius,
      ),
      child: Container(
        padding: padding,
        margin: margin,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: image.image,
              radius: imageRadius,
            ),
            SizedBox(width: spaceBetween),
            // 检查文字数量是否超过 3
            text.length > 2
                ? Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          text,
                          style: textStyle,
                          softWrap: true, // 允许文字换行
                        ),
                      ],
                    ),
                  )
                : Text(
                    text,
                    style: textStyle,
                  ),
          ],
        ),
      ),
    ); //u
  }

  void makeTooltip() {
    _controller.showTooltip();
  }

  @override
  TagmentionModel viewModelBuilder(
    BuildContext context,
  ) =>
      TagmentionModel();
}
