import 'package:flutter/material.dart';

class CommonWrapper extends StatelessWidget {
  const CommonWrapper({
    Key? key,
    this.header,
    this.leftSidebar,
    this.rightSidebar,
    required this.content,
    this.footer,
    this.minWidth = 1440,
    this.maxWidth = 1920,
    this.minHeight = 720,
    this.maxHeight = 1080,
    this.contentScrollController,
    this.fitHeight = false,
  }) : super(key: key);

  final SizedBox? header;
  final Widget? leftSidebar;
  final Widget? rightSidebar;
  final Widget content;
  final SizedBox? footer;
  final double minWidth;
  final double maxWidth;
  final double minHeight;
  final double maxHeight;
  final ScrollController? contentScrollController;
  final bool fitHeight;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final double width = mediaQuery.size.width;
    final double height = mediaQuery.size.height;
    final double ovrMinWidth = width < minWidth ? minWidth : width;
    final double ovrMaxWidth = width > maxWidth ? width : ovrMinWidth;
    final double ovrMinHeight = height < minHeight ? minHeight : height;
    final double ovrMaxHeight = height > maxHeight ? height : ovrMinHeight;

    final Widget main = Row(
      children: [
        leftSidebar ?? const SizedBox(),
        Expanded(
          child: SingleChildScrollView(
            controller: contentScrollController,
            child: Column(
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: ovrMinHeight - headerHeight - footerHeight,
                    maxHeight: fitHeight ? ovrMaxHeight : double.infinity,
                  ),
                  child: content,
                ),
                footer ?? const SizedBox(),
              ],
            ),
          ),
        ),
        rightSidebar ?? const SizedBox(),
      ],
    );

    return Scrollbar(
      child: SingleChildScrollView(
        primary: true,
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: ovrMinWidth,
              maxWidth: ovrMaxWidth,
              minHeight: ovrMinHeight,
              maxHeight: ovrMaxHeight,
            ),
            child: Column(
              children: [
                header ?? const SizedBox(),
                Expanded(child: main),
              ],
            ),
          ),
        ),
      ),
    );
  }

  double get headerHeight => header?.height ?? 0;

  double get footerHeight => footer?.height ?? 0;
}