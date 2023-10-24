import 'package:get/get.dart';

import '../data/_data.dart';

class StickerState {
  // StickerState._();
  // static final _instance = StickerState._();
  // factory StickerState() => _instance;

  //Ключи
  // GlobalKey<CartScreenState> cartKey = GlobalKey();
  // GlobalKey<FavoriteScreenState> favoriteKey = GlobalKey();

  //Переменные
  RxList<StickerCategory> categories = AppData.categories.obs;
  RxList<Sticker> stickers = AppData.stickers.obs;
  RxList<Sticker> stickersByCategory = AppData.stickers.obs;
  RxList<Sticker> cart = <Sticker>[].obs;
  RxList<Sticker> favorite = <Sticker>[].obs;
  RxBool isLigth = true.obs;
  Rx<Sticker> selectedSticker = AppData.stickers[0].obs;

  //Действия
  Future<void> onSetSelectedSticker(Sticker sticker) async {
    selectedSticker.value = sticker;
  }

  Future<void> onCategoryTap(StickerCategory category) async {
    categories.map((e) {
      if (e.type == category.type) {
        e.isSelected = true;
      } else {
        e.isSelected = false;
      }
    }).toList();
    categories.refresh();
    if (category.type == StickerType.all) {
      stickersByCategory.value = stickers;
    } else {
      stickersByCategory.value = stickers.where((e) => e.type == category.type).toList();
    }
  }

  Future<void> onIncreaseQuantityTap(Sticker sticker) async {
    sticker.quantity++;
    selectedSticker.refresh();
    cart.refresh();
  }

  Future<void> onDecreaseQuantityTap(Sticker sticker) async {
    if (sticker.quantity == 1) return;
    sticker.quantity--;
    selectedSticker.refresh();
    cart.refresh();
  }

  Future<void> onAddToCartTap(Sticker sticker) async {
    sticker.cart = true;
    cart.value = stickers.where((p0) => p0.cart).toList();
  }

  Future<void> onRemoveFromCartTap(Sticker sticker) async {
    sticker.cart = false;
    sticker.quantity = 1;
    cart.value = stickers.where((p0) => p0.cart).toList();
  }

  Future<void> onCheckOutTap() async {
    for (var element in cart) {
      element.cart = false;
      element.quantity = 1;
    }
    cart.value = stickers.where((p0) => p0.cart).toList();
  }

  Future<void> onAddRemoveFavoriteTap(Sticker sticker) async {
    sticker.isFavorite = !sticker.isFavorite;
    selectedSticker.refresh();
    favorite.value = stickers.where((p0) => p0.isFavorite).toList();
  }

  void toggleTheme() {
    isLigth.value = !isLigth.value;
  }

  //Вспомогательные  методы
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

  //BLoC, Cubit, GetX, MobX, Provider, Riverpod, Redux

  // 14 шагов логики
  //
  //
  // 1. Подсветка выбранной категории
  // 2. Продукты по категории
  // 3. Детали: отображение продукта
  // 4. Детали: количество
  // 5.  Корзина: управление пустой корзиной
  // 6.  Детали: добавление в корзину
  // 7. Корзина: список в корзине
  // 8. Корзина: стоимость корзины
  // 9. Корзина: количество
  // 10. Корзина: удаление
  // 11. Корзина: чистка корзина на checkout
  // 12. Любимые: управление пустым экраном
  // 13. Детали: Добавление/удаление любимые
  // 14. Смена темы
}
