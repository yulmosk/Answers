
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sun_stickers/data/_data.dart';


part 'shared_event.dart';
part 'shared_state.dart';

class SharedBloc extends Bloc<SharedEvent, SharedState> {
  SharedBloc() : super(SharedState()) {
    on<CategoryTapEvent>(_onCategoryTap);
  }

  void _onCategoryTap(CategoryTapEvent event, Emitter<SharedState>  emit){
    state.categories.map((e) {
      if (e.type == event.category.type) {
        e.isSelected = true;
      } else {
        e.isSelected = false;
      }
    }).toList();
    emit(state);
  }

}