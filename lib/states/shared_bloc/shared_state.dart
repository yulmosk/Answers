part of 'shared_bloc.dart';

class SharedState extends Equatable {
  SharedState({
    required this.categories,
    required this.stickers,
    required this.stickersByCategory,
  });
  List<StickerCategory> categories;
  List<Sticker> stickers;
  List<Sticker> stickersByCategory;

  SharedState.initial() : this(
      categories: AppData.categories,
      stickers: AppData.stickers,
      stickersByCategory: AppData.stickers,
  );

  @override
  List<Object?> get props => [categories,stickers,stickersByCategory,];

  SharedState copyWith({
    List<StickerCategory>? categories,
    List<Sticker>? stickers,
    List<Sticker>? stickersByCategory,
  }) {
    return SharedState(
      categories: categories ?? this.categories,
      stickers: stickers ?? this.stickers,
      stickersByCategory: stickersByCategory ?? this.stickersByCategory,
    );
  }
}