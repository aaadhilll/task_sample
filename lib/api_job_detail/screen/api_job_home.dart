import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infopark/awaiting/screen/home_page.dart';

import '../appliction/bloc/bloc_job_details_bloc.dart';

class JobDetailHomePage extends StatelessWidget {
  JobDetailHomePage({super.key});

  final BlocJobDetailsBloc blocJobDetailsBloc = BlocJobDetailsBloc();

  @override
  Widget build(BuildContext context) {
    blocJobDetailsBloc.add(FetchingJobDetailDataEvent());
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: width,
              height: width / 4.5,
              // decoration: BoxDecoration(boxShadow: [
              //   BoxShadow(
              //     color: Colors.black,
              //     blurRadius: 3,

              //   )
              // ]),
              child: Padding(
                padding: EdgeInsets.all(width / 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset("assets/images/Group.png"),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: width / 9,
                          width: width / 9,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 227, 93, 138)),
                        ),
                        const TextBold(size: 21, test: 'J')
                      ],
                    ),
                    const TextBold(size: 17, test: 'Jobseeker'),
                    const Icon(Icons.list)
                  ],
                ),
              ),
            ),
            BlocBuilder<BlocJobDetailsBloc, BlocJobDetailsState>(
              bloc: blocJobDetailsBloc,
              builder: (context, state) {
                switch (state.runtimeType) {
                  case IntitiaLoadinPageJobState:
                    return Padding(
                      padding: EdgeInsets.only(top: width / 1.3),
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );

                  case GettingSuccusDataPageJobState:
                    final succusState = state as GettingSuccusDataPageJobState;
                    return Column(
                      children: [
                        SizedBox(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset("assets/images/ibm.png"),
                                const TextBold(
                                    size: 17, test: 'Senior .Net developer'),
                                const Icon(
                                  Icons.share,
                                  color: Color.fromARGB(255, 13, 20, 218),
                                )
                              ]),
                        ),
                        Padding(
                          padding: EdgeInsets.all(width / 24.0),
                          child: Container(
                            height: width,
                            width: width,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black12),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(width / 24),
                                  child: Text(
                                    'Job code - ${succusState.jobModel.response.details.jobCode}',
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 13, 20, 218),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ),
                                const Text(
                                  'Job Highlights',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                    'Salary:  ${succusState.jobModel.response.details.minSalary} to ${succusState.jobModel.response.details.maxSalary}'),
                                Text(
                                    'Vacancy:  ${succusState.jobModel.response.details.noOfVaccancies}'),
                                Text(
                                    'Working time:  ${succusState.jobModel.response.details.timingFrom} to ${succusState.jobModel.response.details.timingTo}'),
                                Text(
                                    'City:  ${succusState.jobModel.response.details.jobLocation}'),
                                Text(
                                    'Job type:  ${succusState.jobModel.response.details.jobTypes}'),
                                Text(
                                    'Last date:  ${succusState.jobModel.response.details.lastDateToApply}'),
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                }
                return Container();
              },
            )
          ],
        ),
      ),
    );
  }
}
