import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sun_stickers/states/_states.dart';

import 'ui/_ui.dart';
import 'ui_kit/_ui_kit.dart';

void main() {
  _bind();
  runApp(const MyApp());
}

class MyAppController extends GetxController {
  final _state = Get.find<StickerState>();
  bool get isLight => _state.isLigth();
}

class MyApp extends GetView<MyAppController> {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Obx(() => GetMaterialApp(
          title: 'Sunny Stickers',
          theme: controller.isLight ? AppTheme.lightTheme : AppTheme.darkTheme,
          home: const HomeScreen(),
        ));
  }
}

void _bind() {
  Get.lazyPut(() => StickerState());
  Get.lazyPut(() => StickerListController());
  Get.lazyPut(() => StickerDetailController());
  Get.lazyPut(() => CartScreenController());
  Get.lazyPut(() => FavoriteScreenController());
  Get.lazyPut(() => MyAppController());
}
