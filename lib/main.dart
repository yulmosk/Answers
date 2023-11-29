import 'package:flutter/material.dart';
import 'package:sun_stickers/states/shared_redux/_shared_redux.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'ui/_ui.dart';
import 'ui_kit/_ui_kit.dart';

void main() {
  final store = Store<SharedState>(
      sharedReducer,
      initialState: SharedState.initial()
  );
  runApp(MyApp(store: store,));
}

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.store});
  final Store<SharedState> store;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider<SharedState>(
      store: store,
      child: MaterialApp(
        title: 'Sunny Stickers',
        theme: AppTheme.darkTheme,
        home: const HomeScreen(),
      ),
    );
  }
}
