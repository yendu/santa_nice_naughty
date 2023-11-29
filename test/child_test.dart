import 'package:flutter_test/flutter_test.dart';
import 'package:santa_nice_naughty/bloc/child_bloc.dart';
import 'package:santa_nice_naughty/bloc/child_event.dart';
import 'package:santa_nice_naughty/bloc/child_state.dart';
import 'package:santa_nice_naughty/models/child.dart';

void main() {
  group('ChildBloc', () {
    test('emits correct state after adding a child', () {
      final bloc = ChildBloc();
      final initialChild = Child(name: 'Yonatan', country: 'Ethiopia');
      final expectedState = ChildState([initialChild]);

      bloc.add(AddChild(initialChild));

      expectLater(bloc.stream, emits(expectedState));
    });

    test('emits correct state after toggling child status', () {
      final bloc = ChildBloc();
      final child = Child(name: 'Liya', country: 'German', isNice: false);
      final expectedState = ChildState([child.copyWith(isNice: false)]);

      bloc
        ..add(AddChild(child))
        ..add(ToggleChildStatus(0));

      expectLater(bloc.stream, emits(expectedState));
    });
  });
}