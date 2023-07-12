import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

import '../../../../data/accepted_user_data.dart';
import '../../../../data/user_data.dart';
import '../../../domain/user_data_model.dart';

part 'bloc_awaiting_event.dart';
part 'bloc_awaiting_state.dart';

class BlocAwaitingBloc extends Bloc<BlocAwaitingEvent, BlocAwaitingState> {
  BlocAwaitingBloc() : super(BlocAwaitingInitial()) {
    on<AwaitingReviewGetDataEvent>(awaitingReviewGetDataEvent);
    on<NavigateToAcceptedPageEvent>(navigateToAcceptedPageEvent);
    on<AcceptBttonClickedEvent>(acceptBttonClickedEvent);
  }

  FutureOr<void> awaitingReviewGetDataEvent(
      AwaitingReviewGetDataEvent event, Emitter<BlocAwaitingState> emit) async {
    emit(LoadingInitialAwaitingPageState());
    await Future.delayed(const Duration(seconds: 1));

    emit(SuccusGetDataAwaitingReviewLIstStat(
        userDataModel: UserData.userData
            .map((e) => UserDataModel(
                id: e['id'],
                name: e['name'],
                age: e['age'],
                gender: e['gender'],
                location: e['location'],
                dateApplied: e['dateApplied'],
                imageUrl: e['imageUrl']))
            .toList()));
  }

  FutureOr<void> navigateToAcceptedPageEvent(
      NavigateToAcceptedPageEvent event, Emitter<BlocAwaitingState> emit) {
    emit(NavigateToAcceptedePageState());
  }

  FutureOr<void> acceptBttonClickedEvent(
      AcceptBttonClickedEvent event, Emitter<BlocAwaitingState> emit) {
    print('object');
    acceptedUsetData.add(event.clikedAccept);
    emit(AccrptedProductActionState());
  }
}
