import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'rivals_event.dart';
part 'rivals_state.dart';

class RivalsBloc extends Bloc<RivalsEvent, RivalsState> {
  RivalsBloc() : super(RivalsInitial()) {
    on<RivalsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
