import 'package:mobx/mobx.dart';

import '../data/_data.dart';

part 'shared_data.g.dart';

class SharedData = SharedDataBase with _$SharedData;

abstract class SharedDataBase with Store {
  @observable
  List<StickerCategory> categories = AppData.categories;
  @observable
  List<Sticker> stickers = AppData.stickers;
  @observable
  List<Sticker> stickersByCategory = AppData.stickers;
  @alwaysNotify
  Sticker selectedSticker = AppData.stickers[0];
  @observable
  List<Sticker> cart = <Sticker>[];
  @observable
  List<Sticker> favorite = <Sticker>[];
  @observable
  bool isLight = true;

  @action
  Future<void> onCategoryTap(StickerCategory category) async {
    categories.map((e) {
      if (e.type == category.type) {
        e.isSelected = true;
      } else {
        e.isSelected = false;
      }
    }).toList();
    categories = [...categories];
    if (category.type == StickerType.all) {
      stickersByCategory = stickers;
    } else {
      stickersByCategory = stickers.where((e) =>
      e.type == category.type).toList();
    }
  }

  @action
  Future<void> setSelectedSticker(Sticker sticker) async {
    selectedSticker = sticker;
  }

  @action
  Future<void> onIncreaseQuantityTap(Sticker sticker) async {
    sticker.quantity++;
    selectedSticker = sticker;
    cart = stickers.where((e) => e.cart).toList();
  }

  @action
  Future<void> onDecreaseQuantityTap(Sticker sticker) async {
    if (sticker.quantity == 1) return;
    sticker.quantity--;
    selectedSticker = sticker;
    cart = stickers.where((e) => e.cart).toList();
  }

  @action
  Future<void> onAddToCartTap(Sticker sticker) async {
    sticker.cart = true;
    cart = stickers.where((e) => e.cart).toList();
  }

  @action
  Future<void> onRemoveFromCartTap(Sticker sticker) async {
    sticker.cart = false;
    sticker.quantity = 1;
    cart = stickers.where((e) => e.cart).toList();
  }

  @action
  Future<void> onCheckOutTap() async {
    for (var element in cart) {
      element.cart = false;
      element.quantity = 1;
    }
    cart = stickers.where((e) => e.cart).toList();
  }

  @action
  Future<void> onAddRemoveFavoriteTap(Sticker sticker) async {
    sticker.isFavorite = !sticker.isFavorite;
    selectedSticker = sticker;
    favorite = stickers.where((e) => e.isFavorite).toList();
  }

  @action
  Future<void> onThemeToggle() async {
    isLight = !isLight;
  }

  String stickerPrice(Sticker sticker) {
    return (sticker.quantity * sticker.price).toString();
  }

  double get subtotal {
    double amount = 0.0;
    for (var element in cart) {
      amount = amount + element.price * element.quantity;
    }
    return amount;
  }
}
