import 'package:equatable/equatable.dart';
import 'package:travel/models/Rivals.dart';

class RivalsFilter extends Equatable {
  final int id;
  final int rivals;
  final bool value;

  RivalsFilter({required this.id, required this.rivals, required this.value});

  @override
  List<Object?> get props => [id, rivals, value];

  static List<RivalsFilter> Filters = rival
      .map((rivals) => RivalsFilter(
          id: rivals.id, rivals: rivals.rivals, value: false))
      .toList();

  RivalsFilter copyWith({int? id, int? rivals, bool? value}) {
    return RivalsFilter(
        id: id ?? this.id,
        rivals:rivals ?? this. rivals,
        value: value ?? this.value);
  }
}
