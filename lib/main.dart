import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'states/_states.dart';
import 'ui/_ui.dart';
import 'ui_kit/_ui_kit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  SharedData get _state => StickerState().state;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) => MaterialApp(
      title: 'Sunny Stickers',
      theme: _state.isLight ? AppTheme.lightTheme : AppTheme.darkTheme,
      home: const HomeScreen(),
    ));
  }
}
