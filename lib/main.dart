import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'states/_states.dart';
import 'ui/_ui.dart';
import 'ui_kit/_ui_kit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<StickerState>(
        create: (_) => StickerState(),
        child: MaterialApp(
      title: 'Sunny Stickers',
      theme: AppTheme.darkTheme,
      home: const HomeScreen(),
    ),
    );
  }
}
