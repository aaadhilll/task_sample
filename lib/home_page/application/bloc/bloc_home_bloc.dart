import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bloc_home_event.dart';
part 'bloc_home_state.dart';

class BlocHomeBloc extends Bloc<BlocHomeEvent, BlocHomeState> {
  BlocHomeBloc() : super(BlocHomeInitial()) {
    on<ButtonTask4TappingEvent>(buttonTask4TappingEvent);
    on<ButtonTask2TappingEvent>(buttonTask2TappingEvent);
  }

  FutureOr<void> buttonTask4TappingEvent(
      ButtonTask4TappingEvent event, Emitter<BlocHomeState> emit) async {
    emit(NavaigateTap4ButtonTapingState());
  }

  FutureOr<void> buttonTask2TappingEvent(
      ButtonTask2TappingEvent event, Emitter<BlocHomeState> emit) async {
    emit(NavaigateTap2ButtonTapingState());
  }
}
