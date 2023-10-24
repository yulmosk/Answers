import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/_data.dart';
import '../../states/_states.dart';
import '../../ui_kit/_ui_kit.dart';
import '../_ui.dart';

class FavoriteScreenController extends GetxController {
  final _state = Get.find<StickerState>();
  List<Sticker> get favoriteItems => _state.favorite();
}

class FavoriteScreen extends GetView<FavoriteScreenController> {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: _appBar(context),
          body: EmptyWrapper(
            type: EmptyWrapperType.favorite,
            title: "Empty favorite",
            isEmpty: controller.favoriteItems.isEmpty,
            child: _favoriteListView(context),
          ),
        ));
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      title: Text(
        "Favorite screen",
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }

  Widget _favoriteListView(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(30),
      itemCount: controller.favoriteItems.length,
      itemBuilder: (_, index) {
        Sticker sticker = controller.favoriteItems[index];
        return Card(
          color: Theme.of(context).brightness == Brightness.light ? Colors.white : AppColor.dark,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: ListTile(
            title: Text(
              sticker.name,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            leading: Image.asset(sticker.image),
            subtitle: Text(
              sticker.description,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            trailing: const Icon(AppIcon.heart, color: Colors.redAccent),
          ),
        );
      },
      separatorBuilder: (_, __) => Container(
        height: 20,
      ),
    );
  }
}
