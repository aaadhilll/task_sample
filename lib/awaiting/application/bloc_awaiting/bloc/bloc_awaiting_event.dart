part of 'bloc_awaiting_bloc.dart';

@immutable
abstract class BlocAwaitingEvent {}

class AwaitingReviewGetDataEvent extends BlocAwaitingEvent {}

class NavigateToAcceptedPageEvent extends BlocAwaitingEvent {}

class NavigateToRejectedPageEvent extends BlocAwaitingEvent {}

//
class AcceptBttonClickedEvent extends BlocAwaitingEvent {
  final UserDataModel clikedAccept;
  AcceptBttonClickedEvent({required this.clikedAccept});
}

class RejectBttonClickedEvent extends BlocAwaitingEvent {
  final UserDataModel clickedReject;
  RejectBttonClickedEvent({required this.clickedReject});
}
