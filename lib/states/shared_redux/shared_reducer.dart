import 'package:redux/redux.dart';

import '../../data/_data.dart';
import 'shared_action.dart';
import 'shared_state.dart';

/// Reducer
final sharedReducer = combineReducers<SharedState>([
  TypedReducer<SharedState, CategoryTapAction>(_onCategoryTap),
]);

SharedState _onCategoryTap(SharedState state, CategoryTapAction action) {
  final categories = state.categories.map((e) {
    if (e.type == action.category.type) {
      return e.copyWith(isSelected: true);
    } else {
      return e.copyWith(isSelected: false);
    }
  }).toList();

  if (action.category.type == StickerType.all) {
    final stickersByCategory = state.stickers;
    return state.copyWith(categories: categories,stickersByCategory: stickersByCategory);
  } else {
    final stickersByCategory = state.stickers.where((e) => e.type == action.category.type).toList();
    return state.copyWith(categories: categories,stickersByCategory: stickersByCategory);
  }
}