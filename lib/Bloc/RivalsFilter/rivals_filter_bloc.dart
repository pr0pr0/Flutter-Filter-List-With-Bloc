import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:travel/models/Filter/CityFilter.dart';
import 'package:travel/models/Filter/Fliter.dart';
import 'package:travel/models/Filter/RivalsFilter.dart';

part 'rivals_filter_event.dart';
part 'rivals_filter_state.dart';

class RivalsFilterBloc extends Bloc<RivalsFilterEvent, RivalsFilterState> {
  RivalsFilterBloc() : super(RivalsFilterLoading()) {
    on<RivalsFilterLoaded>(_onRivalsLoaded);
    on<RivalsFilterUpdate>(_onRivalsUpdate);
    on<CityFilterUpdate>(_onCityUpdate);
  }

  FutureOr<void> _onRivalsLoaded(
      RivalsFilterLoaded event, Emitter<RivalsFilterState> emit) {
    emit(
      RivalsFiltersLoaded(
          filter: Filter(
        cityFilter: cityList(CityFilter.Filters),
        rivalsFilter: rivalList(RivalsFilter.Filters),
      )),
    );
  }

  FutureOr<void> _onRivalsUpdate(
      RivalsFilterUpdate event, Emitter<RivalsFilterState> emit) {
    final state = this.state;
    if (state is RivalsFiltersLoaded) {
      final List<dynamic> updatedRivalsFilter =
          state.filter.rivalsFilter.map((rivalsFilter) {
        return rivalsFilter.id == event.rivalsFilter.id
            ? event.rivalsFilter
            : rivalsFilter;
      }).toList();
      emit(
        RivalsFiltersLoaded(
            filter: Filter(
          cityFilter: state.filter.cityFilter,
          rivalsFilter: updatedRivalsFilter,
        )),
      );
    }
  }

  FutureOr<void> _onCityUpdate(
      CityFilterUpdate event, Emitter<RivalsFilterState> emit) {
    final state = this.state;
    if (state is RivalsFiltersLoaded) {
      final List<dynamic> updatedCityFilter =
          state.filter.cityFilter.map((citiesFilter) {
        return citiesFilter.id == event.cityFilter.id
            ? event.cityFilter
            : citiesFilter;
      }).toList();
      emit(
        RivalsFiltersLoaded(
            filter: Filter(
          rivalsFilter: state.filter.rivalsFilter,
          cityFilter: updatedCityFilter,
        )),
      );
    }
  }
}

List<dynamic> rivalList(List<RivalsFilter> Filters) {
  var seen = <int>{};
  Filters.sort(
    (a, b) {
      return a.rivals.compareTo(b.rivals);
    },
  );
  List<dynamic> uniqueList =
      Filters.where((rivals) => seen.add(rivals.rivals)).toList();

  return uniqueList;
}

List<dynamic> cityList(List<CityFilter> Filters) {
  var seen = <String>{};

  List<dynamic> uniqueList =
      Filters.where((cities) => seen.add(cities.city)).toList();

  return uniqueList;
}
