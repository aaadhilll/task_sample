import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infopark/api_job_detail/screen/api_job_home.dart';
import 'package:infopark/awaiting/screen/home_page.dart';
import 'package:infopark/home_page/application/bloc/bloc_home_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final BlocHomeBloc blocHomeBloc = BlocHomeBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocListener<BlocHomeBloc, BlocHomeState>(
          bloc: blocHomeBloc,
          listener: (context, state) {
            if (state is NavaigateTap4ButtonTapingState) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AwaitingPage()));
            }
            if (state is NavaigateTap2ButtonTapingState) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => JobDetailHomePage()));
            }
          },
          child: Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.width / 2),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: EleButton(
                      onTap: () {
                        blocHomeBloc.add(ButtonTask4TappingEvent());
                      },
                      test: 'Task 4'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: EleButton(
                      onTap: () {
                        blocHomeBloc.add(ButtonTask2TappingEvent());
                      },
                      test: 'Task 2'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
