part of 'rivals_filter_bloc.dart';

abstract class RivalsFilterState extends Equatable {
  const RivalsFilterState();

  @override
  List<Object> get props => [];
}

class RivalsFilterLoading extends RivalsFilterState {}

class RivalsFiltersLoaded extends RivalsFilterState {
  final Filter filter;

  const RivalsFiltersLoaded({this.filter = const Filter()});

  @override
  List<Object> get props => [filter];
}

class RivalsFiltersUpdate extends RivalsFilterState {
  final Filter filter;

  const RivalsFiltersUpdate({required this.filter});

  @override
  List<Object> get props => [filter];
}
class CityFiltersUpdate extends RivalsFilterState {
  final Filter filter;

  const CityFiltersUpdate({required this.filter});

  @override
  List<Object> get props => [filter];
}
