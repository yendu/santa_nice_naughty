
import 'package:equatable/equatable.dart';

import '../models/child.dart';

class ChildState extends Equatable {
  final List<Child> children;

  const ChildState(this.children);

  @override
  List<Object> get props => [children];
}