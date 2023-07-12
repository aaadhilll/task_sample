part of 'bloc_accpted_bloc.dart';

@immutable
abstract class BlocAccptedState {}

class BlocAccptedInitial extends BlocAccptedState {}

//Action
abstract class ActionAcceptedPageState extends BlocAccptedState {}

class NavigateToAwaitiPageState extends ActionAcceptedPageState {}

class NavigateToRejectedPageState extends ActionAcceptedPageState {}
// builder

class LoadingInitialAcceptedPageState extends BlocAccptedState {}

class SuccusGetDataAcceptedReviewLIstStat extends BlocAccptedState {
  final List<UserDataModel> userAccptedModel;
  SuccusGetDataAcceptedReviewLIstStat({required this.userAccptedModel});
}
