import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infopark/accepted/application/bloc/bloc_accpted_bloc.dart';
import 'package:infopark/awaiting/screen/home_page.dart';

class AcctedScreen extends StatelessWidget {
   AcctedScreen({super.key});
  final BlocAccptedBloc blocAccpted = BlocAccptedBloc();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    blocAccpted.add(InitialAcceptedPageEvent());
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            BlocConsumer<BlocAccptedBloc, BlocAccptedState>(
              listenWhen: (previous, current) =>
                  current is ActionAcceptedPageState,
              buildWhen: (previous, current) =>
                  current is! ActionAcceptedPageState,
              bloc: blocAccpted,
              listener: (context, state) {
                // if (state is NavigateToAcceptedePageState) {
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => const AcctedScreen()));
                // }
                // if (state is AccrptedProductActionState) {
                //   ScaffoldMessenger.of(context)
                //       .showSnackBar(const SnackBar(content: Text('Accepted')));
                // }
              },
              builder: (context, state) {
                switch (state.runtimeType) {
                  case LoadingInitialAcceptedPageState:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );

                  case SuccusGetDataAcceptedReviewLIstStat:
                    final succusState =
                        state as SuccusGetDataAcceptedReviewLIstStat;
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: const TextBold(
                                  size: 15,
                                  test: 'Awaiting Review',
                                )),
                            TextButton(
                                onPressed: () {
                                  // blocAwaiting
                                  //     .add(NavigateToAcceptedPageEvent());
                                },
                                child: const TextBold(
                                  size: 15,
                                  test: 'Accepted',
                                )),
                            TextButton(
                                onPressed: () {},
                                child: const TextBold(
                                  size: 15,
                                  test: 'Rejected',
                                )),
                          ],
                        ),
                        SizedBox(
                          width: width,
                          height: width * 1.7,
                          child: ListView.builder(
                              itemCount: succusState.userAccptedModel.length,
                              itemBuilder: (context, index) {
                                return ImageUserDetailsButtonWidget(
                                  age: succusState.userAccptedModel[index].age,
                                  date: succusState
                                      .userAccptedModel[index].dateApplied,
                                  gender:
                                      succusState.userAccptedModel[index].gender,
                                  img:
                                      succusState.userAccptedModel[index].imageUrl,
                                  location:
                                      succusState.userAccptedModel[index].location,
                                  name: succusState.userAccptedModel[index].name,
                                  onTapReject: () {
                                    print('object');
                                  },
                                  ontapAccept: () {
                                    // blocAwaiting.add(AcceptBttonClickedEvent(
                                    //     clikedAccept:
                                    //         succusState.userDataModel[index]));
                                  },
                                  ontapConsider: () {},
                                );
                              }),
                        ),
                      ],
                    );

                  default:
                    return const SizedBox();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
