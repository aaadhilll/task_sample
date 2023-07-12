part of 'bloc_job_details_bloc.dart';

@immutable
abstract class BlocJobDetailsState {}

class BlocJobDetailsInitial extends BlocJobDetailsState {}

class IntitiaLoadinPageJobState extends BlocJobDetailsState {}

class GettingSuccusDataPageJobState extends BlocJobDetailsState {
  final JobDetailModel jobModel;
  GettingSuccusDataPageJobState({required this.jobModel});
}

class ErrorLOadingState extends BlocJobDetailsState {}
