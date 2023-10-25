import 'package:flutter/material.dart';
import 'package:sun_stickers/states/shared_data.dart';

import '../data/_data.dart';
import '../ui/_ui.dart';

class StickerState {
  StickerState._();
  static final _instance = StickerState._();
  factory StickerState() => _instance;

  late final SharedData state = SharedData();

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
