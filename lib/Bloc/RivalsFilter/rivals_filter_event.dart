part of 'rivals_filter_bloc.dart';

abstract class RivalsFilterEvent extends Equatable {
  const RivalsFilterEvent();

  @override
  List<Object> get props => [];
}
class RivalsFilterLoaded extends RivalsFilterEvent {
  @override
  List<Object> get props => [];
}

class RivalsFilterUpdate extends RivalsFilterEvent {
  final RivalsFilter rivalsFilter;

   const RivalsFilterUpdate({required this.rivalsFilter});
  @override
  List<Object> get props => [rivalsFilter];
}

class CityFilterUpdate extends RivalsFilterEvent {
  final CityFilter cityFilter;

  const CityFilterUpdate(this.cityFilter);

  @override
  List<Object> get props => [cityFilter];
}
