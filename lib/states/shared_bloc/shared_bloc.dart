
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sun_stickers/data/_data.dart';


part 'shared_event.dart';
part 'shared_state.dart';

class SharedBloc extends Bloc<SharedEvent, SharedState> {
  SharedBloc() : super(SharedState.initial()) {
    on<CategoryTapEvent>(_onCategoryTap);
    on<IncreaseQuantityTapEvent>(_onIncreaseQuantityTap);
    on<DecreaseQuantityTapEvent>(_onDecreaseQuantityTap);
    on<AddToCartTapEvent>(_onAddToCartTap);
    on<RemoveFromCartTapEvent>(_onRemoveFromCartTap);
  }

  void _onCategoryTap(CategoryTapEvent event, Emitter<SharedState>  emit){
    final List<StickerCategory> categories = state.categories.map((e) {
      if (e.type == event.category.type) {
        return e.copyWith(isSelected: true);
      } else {
        return e.copyWith(isSelected: false);
      }
    }).toList();
    if (event.category.type == StickerType.all) {
      emit(state.copyWith(categories: categories, stickersByCategory: state.stickers));
    } else {
      final List<Sticker> stickersByCategory = state.stickers
          .where((e) => e.type == event.category.type)
          .toList();
      emit(state.copyWith(categories: categories, stickersByCategory: stickersByCategory));
    }
  }


  void _onIncreaseQuantityTap(IncreaseQuantityTapEvent event, Emitter<SharedState> emit) {
    final List<Sticker> stickers = state.stickers.map((e) {
      if (e.id == event.stickerId) {
        return e.copyWith(quantity: e.quantity + 1);
      } else {
        return e;
      }
    }).toList();
    emit(state.copyWith(stickers: stickers));
  }

  void _onDecreaseQuantityTap(DecreaseQuantityTapEvent event, Emitter<SharedState> emit) {
    final List<Sticker> stickers = state.stickers.map((e) {
      if (e.id == event.stickerId) {
        return e.quantity == 1 ? e : e.copyWith(quantity: e.quantity - 1);
      } else {
        return e;
      }
    }).toList();
    emit(state.copyWith(stickers: stickers));
  }

  void _onAddToCartTap(AddToCartTapEvent event, Emitter<SharedState> emit){

  }

  void _onRemoveFromCartTap(RemoveFromCartTapEvent event, Emitter<SharedState> emit){

  }

  List<Sticker> get cart => state.stickers.where((e) => e.cart).toList();
  List<Sticker> get factory => state.stickers.where((e) => e.favorite).toList();
  int getIndex(int stickerId) {
    int index = state.stickers.indexWhere((e) => e.id == stickerId);
    return index;
  }
  Sticker getStickerById(int stickerId) {
    return state.stickers[getIndex(stickerId)];
  }
}