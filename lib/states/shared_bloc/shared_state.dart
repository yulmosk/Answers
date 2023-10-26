part of 'shared_bloc.dart';

class SharedState extends Equatable {

  List<StickerCategory> categories = AppData.categories;


  @override
  List<Object?> get props => [categories];

  SharedState copyWith({List<StickerCategory>? categories}) {
    return SharedState(
      categories: categories ?? this.categories,
    );
  }
}