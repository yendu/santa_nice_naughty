
import 'package:equatable/equatable.dart';

import '../models/child.dart';



abstract class ChildEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AddChild extends ChildEvent {
  final Child child;

  AddChild(this.child);
}

class ToggleChildStatus extends ChildEvent {
  final int index;

  ToggleChildStatus(this.index);
}