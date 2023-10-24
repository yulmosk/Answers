import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../data/_data.dart';
import '../../states/_states.dart';
import '../../ui_kit/_ui_kit.dart';
import '../widgets/_widgets.dart';

class StickerDetailController extends GetxController {
  final _state = Get.find<StickerState>();
  Sticker get sticker => _state.selectedSticker();

  void onIncreaseQuantityTap() {
    _state.onIncreaseQuantityTap(sticker);
  }

  void onDecreaseQuantityTap() {
    _state.onDecreaseQuantityTap(sticker);
  }

  void onAddToCartTap() {
    _state.onAddToCartTap(sticker);
  }

  void onAddRemoveFavoriteTap() {
    _state.onAddRemoveFavoriteTap(sticker);
  }
}

class StickerDetail extends GetView<StickerDetailController> {
  const StickerDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Center(child: Image.asset(controller.sticker.image, scale: 2)),
      floatingActionButton: _floatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: _bottomAppBar(context),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: const Icon(Icons.arrow_back),
      ),
      title: Text(
        'Sticker Detail Screen',
        style: TextStyle(color: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white),
      ),
      actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))],
    );
  }

  Widget _floatingActionButton() {
    return Obx(() => FloatingActionButton(
          elevation: 0.0,
          backgroundColor: AppColor.accent,
          onPressed: controller.onAddRemoveFavoriteTap,
          child: controller.sticker.isFavorite ? const Icon(AppIcon.heart) : const Icon(AppIcon.outlinedHeart),
        ));
  }

  Widget _bottomAppBar(BuildContext context) {
    return ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: BottomAppBar(
            child: SizedBox(
                height: 300,
                child: Container(
                  color: Theme.of(context).brightness == Brightness.dark ? AppColor.dark : Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              RatingBar.builder(
                                itemPadding: EdgeInsets.zero,
                                itemSize: 20,
                                initialRating: controller.sticker.score,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                glow: false,
                                ignoreGestures: true,
                                itemBuilder: (_, __) => const FaIcon(
                                  FontAwesomeIcons.solidStar,
                                  color: AppColor.yellow,
                                ),
                                onRatingUpdate: (rating) {
                                  print('$rating');
                                },
                              ),
                              const SizedBox(width: 15),
                              Text(
                                controller.sticker.score.toString(),
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                "(${controller.sticker.voter})",
                                style: Theme.of(context).textTheme.titleMedium,
                              )
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\$${controller.sticker.price}",
                                style: Theme.of(context).textTheme.displayLarge?.copyWith(color: AppColor.accent),
                              ),
                              CounterButton(
                                onIncrementTap: controller.onIncreaseQuantityTap,
                                onDecrementTap: controller.onDecreaseQuantityTap,
                                label: Obx(() => Text(
                                      controller.sticker.quantity.toString(),
                                      style: Theme.of(context).textTheme.displayLarge,
                                    )),
                              )
                            ],
                          ),
                          const SizedBox(height: 15),
                          Text(
                            "Description",
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          const SizedBox(height: 15),
                          Text(
                            controller.sticker.description,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 30),
                          SizedBox(
                            width: double.infinity,
                            height: 45,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 30),
                              child: ElevatedButton(
                                onPressed: controller.onAddToCartTap,
                                child: const Text("Add to cart"),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ))));
  }
}
