part of 'bloc_awaiting_bloc.dart';

@immutable
abstract class BlocAwaitingState {}

class BlocAwaitingInitial extends BlocAwaitingState {}

// action
abstract class ActionAwaitingPageState extends BlocAwaitingState {}

class NavigateToAcceptedePageState extends ActionAwaitingPageState {}

class NavigateToRejectedPageState extends ActionAwaitingPageState {}

class AccrptedProductActionState extends ActionAwaitingPageState{}

// builder

class LoadingInitialAwaitingPageState extends BlocAwaitingState {}

class SuccusGetDataAwaitingReviewLIstStat extends BlocAwaitingState {
  final List<UserDataModel> userDataModel;
  SuccusGetDataAwaitingReviewLIstStat({required this.userDataModel});
}
