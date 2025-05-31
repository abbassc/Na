import 'package:flutter/material.dart';
import 'package:nahej_ali/themes/nahej_ali_theme_data.dart';
import 'package:provider/provider.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({super.key, required this.fill});

  final double fill;

  @override
  Widget build(BuildContext context) {

    //final themeManager = Provider.of<ThemeManager>(context);
    Color themeColor = Theme.of(context).disabledColor;
    
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 15,
        ),
        child: FractionallySizedBox(
          heightFactor: fill,
          child: DecoratedBox(
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(8),
                ),
                color: themeColor,
                ),
          ),
        ),
      ),
    );
  }
}
