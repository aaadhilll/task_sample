import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/job_deta_mode.dart';
import '../../ifrastructure/job_api_calling.dart';

part 'bloc_job_details_event.dart';
part 'bloc_job_details_state.dart';

class BlocJobDetailsBloc
    extends Bloc<BlocJobDetailsEvent, BlocJobDetailsState> {
  BlocJobDetailsBloc() : super(BlocJobDetailsInitial()) {
    on<FetchingJobDetailDataEvent>(fetchingJobDetailDataEvent);
  }

  FutureOr<void> fetchingJobDetailDataEvent(FetchingJobDetailDataEvent event,
      Emitter<BlocJobDetailsState> emit) async {
    emit(IntitiaLoadinPageJobState());

    var jobres = await JobDetailApiCalling().getDataJobDetails();

    jobres.fold((left) => emit(ErrorLOadingState()),
        (right) => emit(GettingSuccusDataPageJobState(jobModel: jobres.right)));
  }
}
