import 'package:bloc/bloc.dart';

import '../models/child.dart';
import 'child_event.dart';
import 'child_state.dart';

class ChildBloc extends Bloc<ChildEvent, ChildState> {
  ChildBloc() : super(const ChildState([]));

  @override
  Stream<ChildState> mapEventToState(ChildEvent event) async* {
    if (event is AddChild) {
      yield ChildState(List.from(state.children)..add(event.child));
    } else if (event is ToggleChildStatus) {
      List<Child> updatedList = List.from(state.children);
      updatedList[event.index] = updatedList[event.index]
          .copyWith(isNice: !updatedList[event.index].isNice);
      yield ChildState(updatedList);
    }
  }
}
