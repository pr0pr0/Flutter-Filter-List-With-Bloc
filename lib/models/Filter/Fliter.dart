import 'package:equatable/equatable.dart';

class Filter extends Equatable {
  final List<dynamic> rivalsFilter;
  final List<dynamic> cityFilter;

  const Filter(
      {this.rivalsFilter = const <dynamic>[],
      this.cityFilter = const <dynamic>[]});

  @override
  List<Object?> get props => [rivalsFilter,cityFilter];

  Filter copyWith({List<dynamic>? rivalsFilter, List<dynamic>? cityFilter}) {
    return Filter(
        rivalsFilter: rivalsFilter ?? this.rivalsFilter,
        cityFilter: cityFilter ?? this.cityFilter);
  }
}
