import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold(
      {super.key,
      required this.body,
      this.appBar,
      this.bottomNavigationBar,
      this.resizeToAvoidBottomInset = true,
      this.bottomSheet,
      this.backgroundColor});
  final Widget body;
  final AppBar? appBar;
  final Widget? bottomNavigationBar;
  final bool resizeToAvoidBottomInset;
  final Widget? bottomSheet;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: appBar,
      body: SafeArea(
        bottom: resizeToAvoidBottomInset
            ? MediaQuery.of(context).viewInsets.bottom > 0
            : false,
        child: body,
      ),
      bottomNavigationBar: bottomNavigationBar,
      bottomSheet: bottomSheet != null ? SafeArea(child: bottomSheet!) : null,
    );
  }
}
