import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class ScalableTableHeader extends StatelessWidget {
  final List<Widget> children;

  /// Use [Container] width or [Expanded] with width wrapper
  final Widget Function(BuildContext, int columnIndex, Widget child)
      columnWrapper;

  final EdgeInsets? padding;

  const ScalableTableHeader({
    required this.children,
    required this.columnWrapper,
    this.padding,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _HorizontalTable(
      children: children,
      columnWrapper: columnWrapper,
      padding: padding,
    );
  }
}

class ScalableTableRow extends StatelessWidget {
  final List<Widget> children;

  final MaterialStateColor? color;

  /// Use [Container] width or [Expanded] with width wrapper
  final Widget Function(BuildContext, int columnIndex, Widget child)
      columnWrapper;

  final Function()? onTap;

  final EdgeInsets? padding;

  const ScalableTableRow({
    required this.children,
    required this.columnWrapper,
    required this.color,
    this.onTap,
    this.padding,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final child = GestureDetector(
      onTap: onTap,
      child: Container(
        color: color ?? Colors.transparent,
        child: _HorizontalTable(
          children: children,
          columnWrapper: columnWrapper,
          padding: padding,
        ),
      ),
    );

    if (onTap == null) return child;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: child,
    );
  }
}

class _HorizontalTable extends StatelessWidget {
  final List<Widget> children;

  /// Use [Container] width or [Expanded] with width wrapper
  final Widget Function(BuildContext, int columnIndex, Widget child)
      columnWrapper;

  final EdgeInsets? padding;

  const _HorizontalTable({
    required this.children,
    required this.columnWrapper,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: (padding ?? const EdgeInsets.symmetric(horizontal: 20)) +
          const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: children
            .mapIndexed((index, child) => columnWrapper(context, index, child))
            .toList(),
      ),
    );
  }
}
