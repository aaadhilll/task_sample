import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../awaiting/domain/user_data_model.dart';
import '../../../data/accepted_user_data.dart';

part 'bloc_accpted_event.dart';
part 'bloc_accpted_state.dart';

class BlocAccptedBloc extends Bloc<BlocAccptedEvent, BlocAccptedState> {
  BlocAccptedBloc() : super(BlocAccptedInitial()) {
    on<InitialAcceptedPageEvent>(initialAcceptedPageEvent);
  }

  FutureOr<void> initialAcceptedPageEvent(
      InitialAcceptedPageEvent event, Emitter<BlocAccptedState> emit) async {
    emit(LoadingInitialAcceptedPageState());
    emit(SuccusGetDataAcceptedReviewLIstStat(
        userAccptedModel: acceptedUsetData));
  }
}
