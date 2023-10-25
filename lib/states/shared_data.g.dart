// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_data.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SharedData on SharedDataBase, Store {
  late final _$categoriesAtom =
      Atom(name: 'SharedDataBase.categories', context: context);

  @override
  List<StickerCategory> get categories {
    _$categoriesAtom.reportRead();
    return super.categories;
  }

  @override
  set categories(List<StickerCategory> value) {
    _$categoriesAtom.reportWrite(value, super.categories, () {
      super.categories = value;
    });
  }

  late final _$stickersAtom =
      Atom(name: 'SharedDataBase.stickers', context: context);

  @override
  List<Sticker> get stickers {
    _$stickersAtom.reportRead();
    return super.stickers;
  }

  @override
  set stickers(List<Sticker> value) {
    _$stickersAtom.reportWrite(value, super.stickers, () {
      super.stickers = value;
    });
  }

  late final _$stickersByCategoryAtom =
      Atom(name: 'SharedDataBase.stickersByCategory', context: context);

  @override
  List<Sticker> get stickersByCategory {
    _$stickersByCategoryAtom.reportRead();
    return super.stickersByCategory;
  }

  @override
  set stickersByCategory(List<Sticker> value) {
    _$stickersByCategoryAtom.reportWrite(value, super.stickersByCategory, () {
      super.stickersByCategory = value;
    });
  }

  late final _$selectedStickerAtom =
      Atom(name: 'SharedDataBase.selectedSticker', context: context);

  @override
  Sticker get selectedSticker {
    _$selectedStickerAtom.reportRead();
    return super.selectedSticker;
  }

  @override
  set selectedSticker(Sticker value) {
    _$selectedStickerAtom.reportWrite(value, super.selectedSticker, () {
      super.selectedSticker = value;
    }, equals: observableAlwaysNotEqual);
  }

  late final _$cartAtom = Atom(name: 'SharedDataBase.cart', context: context);

  @override
  List<Sticker> get cart {
    _$cartAtom.reportRead();
    return super.cart;
  }

  @override
  set cart(List<Sticker> value) {
    _$cartAtom.reportWrite(value, super.cart, () {
      super.cart = value;
    });
  }

  late final _$favoriteAtom =
      Atom(name: 'SharedDataBase.favorite', context: context);

  @override
  List<Sticker> get favorite {
    _$favoriteAtom.reportRead();
    return super.favorite;
  }

  @override
  set favorite(List<Sticker> value) {
    _$favoriteAtom.reportWrite(value, super.favorite, () {
      super.favorite = value;
    });
  }

  late final _$isLightAtom =
      Atom(name: 'SharedDataBase.isLight', context: context);

  @override
  bool get isLight {
    _$isLightAtom.reportRead();
    return super.isLight;
  }

  @override
  set isLight(bool value) {
    _$isLightAtom.reportWrite(value, super.isLight, () {
      super.isLight = value;
    });
  }

  late final _$onCategoryTapAsyncAction =
      AsyncAction('SharedDataBase.onCategoryTap', context: context);

  @override
  Future<void> onCategoryTap(StickerCategory category) {
    return _$onCategoryTapAsyncAction.run(() => super.onCategoryTap(category));
  }

  late final _$setSelectedStickerAsyncAction =
      AsyncAction('SharedDataBase.setSelectedSticker', context: context);

  @override
  Future<void> setSelectedSticker(Sticker sticker) {
    return _$setSelectedStickerAsyncAction
        .run(() => super.setSelectedSticker(sticker));
  }

  late final _$onIncreaseQuantityTapAsyncAction =
      AsyncAction('SharedDataBase.onIncreaseQuantityTap', context: context);

  @override
  Future<void> onIncreaseQuantityTap(Sticker sticker) {
    return _$onIncreaseQuantityTapAsyncAction
        .run(() => super.onIncreaseQuantityTap(sticker));
  }

  late final _$onDecreaseQuantityTapAsyncAction =
      AsyncAction('SharedDataBase.onDecreaseQuantityTap', context: context);

  @override
  Future<void> onDecreaseQuantityTap(Sticker sticker) {
    return _$onDecreaseQuantityTapAsyncAction
        .run(() => super.onDecreaseQuantityTap(sticker));
  }

  late final _$onAddToCartTapAsyncAction =
      AsyncAction('SharedDataBase.onAddToCartTap', context: context);

  @override
  Future<void> onAddToCartTap(Sticker sticker) {
    return _$onAddToCartTapAsyncAction.run(() => super.onAddToCartTap(sticker));
  }

  late final _$onRemoveFromCartTapAsyncAction =
      AsyncAction('SharedDataBase.onRemoveFromCartTap', context: context);

  @override
  Future<void> onRemoveFromCartTap(Sticker sticker) {
    return _$onRemoveFromCartTapAsyncAction
        .run(() => super.onRemoveFromCartTap(sticker));
  }

  late final _$onCheckOutTapAsyncAction =
      AsyncAction('SharedDataBase.onCheckOutTap', context: context);

  @override
  Future<void> onCheckOutTap() {
    return _$onCheckOutTapAsyncAction.run(() => super.onCheckOutTap());
  }

  late final _$onAddRemoveFavoriteTapAsyncAction =
      AsyncAction('SharedDataBase.onAddRemoveFavoriteTap', context: context);

  @override
  Future<void> onAddRemoveFavoriteTap(Sticker sticker) {
    return _$onAddRemoveFavoriteTapAsyncAction
        .run(() => super.onAddRemoveFavoriteTap(sticker));
  }

  late final _$onThemeToggleAsyncAction =
      AsyncAction('SharedDataBase.onThemeToggle', context: context);

  @override
  Future<void> onThemeToggle() {
    return _$onThemeToggleAsyncAction.run(() => super.onThemeToggle());
  }

  @override
  String toString() {
    return '''
categories: ${categories},
stickers: ${stickers},
stickersByCategory: ${stickersByCategory},
selectedSticker: ${selectedSticker},
cart: ${cart},
favorite: ${favorite},
isLight: ${isLight}
    ''';
  }
}
