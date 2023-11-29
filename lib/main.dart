import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:santa_nice_naughty/screens/children_page.dart';

import 'bloc/child_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChildBloc>(
      create: (context) => ChildBloc(),
      child: MaterialApp(home: ChildrenPage()),
    );
  }
}
