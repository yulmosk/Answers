import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sun_stickers/states/_states.dart';

import 'ui/_ui.dart';
import 'ui_kit/_ui_kit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SharedBloc>(
      create: (context) => SharedBloc(),
      child: MaterialApp(
        title: 'Sunny Stickers',
        theme: AppTheme.darkTheme,
        home: const HomeScreen(),
      ),
    );
  }
}


