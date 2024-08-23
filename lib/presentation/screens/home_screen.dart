import 'package:flutter/material.dart';

import '../../core/utils/global_key_manager.dart';
import '../widgets/button_display_widget.dart';
import '../widgets/page_body_widget.dart';
import '../widgets/page_view_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final GlobalKey globalKey = GlobalKeyManager().globalKey;
  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: globalKey,
      child: const SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              PageViewWidget(),
              PageBodyWidget(),
              ButtonDisplayWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
