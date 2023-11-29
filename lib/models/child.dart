import 'package:equatable/equatable.dart';

class Child extends Equatable {
  final String name;
  final String country;
  final bool isNice;

  const Child({required this.name, required this.country, this.isNice = true});

  Child copyWith({String? name, String? country, bool? isNice}) {
    return Child(
      name: name ?? this.name,
      country: country ?? this.country,
      isNice: isNice ?? this.isNice,
    );
  }

  @override
  List<Object?> get props => [name, country, isNice];
}
