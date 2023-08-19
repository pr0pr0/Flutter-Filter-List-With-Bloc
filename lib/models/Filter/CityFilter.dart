import 'package:equatable/equatable.dart';
import 'package:travel/models/Rivals.dart';

class CityFilter extends Equatable {
  final int id;
  final String city;
  final bool value;

  CityFilter({required this.id, required this.city, required this.value});

  @override
  List<Object?> get props => [id, city, value];

  static List<CityFilter> Filters = rival

      .map(
          (rivals) => CityFilter(id: rivals.id, city: rivals.city, value: false))
      .toList();

  CityFilter copyWith({int? id, String? city, bool? value}) {
    return CityFilter(
        id: id ?? this.id,
        city: city ?? this.city,
        value: value ?? this.value);
  }

  
}
