part of 'shared_bloc.dart';

abstract class SharedEvent{}

class  CategoryTapEvent extends SharedEvent{
  CategoryTapEvent(this.category);

  final StickerCategory category;
}