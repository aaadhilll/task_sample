import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infopark/accepted/screen/accepte_screen.dart';

import '../application/bloc_awaiting/bloc/bloc_awaiting_bloc.dart';
import '../domain/user_data_model.dart';

class AwaitingPage extends StatelessWidget {
  AwaitingPage({super.key});
  final BlocAwaitingBloc blocAwaiting = BlocAwaitingBloc();
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    blocAwaiting.add(AwaitingReviewGetDataEvent());
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            BlocConsumer<BlocAwaitingBloc, BlocAwaitingState>(
              listenWhen: (previous, current) =>
                  current is ActionAwaitingPageState,
              buildWhen: (previous, current) =>
                  current is! ActionAwaitingPageState,
              bloc: blocAwaiting,
              listener: (context, state) {
                if (state is NavigateToAcceptedePageState) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AcctedScreen()));
                }
                if (state is AccrptedProductActionState) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text('Accepted')));
                }
              },
              builder: (context, state) {
                switch (state.runtimeType) {
                  case LoadingInitialAwaitingPageState:
                    return Padding(
                      padding: EdgeInsets.only(top: width / 1.3),
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );

                  case SuccusGetDataAwaitingReviewLIstStat:
                    final succusState =
                        state as SuccusGetDataAwaitingReviewLIstStat;
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
                                  blocAwaiting
                                      .add(NavigateToAcceptedPageEvent());
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
                              itemCount: succusState.userDataModel.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.all(width / 35),
                                  child: ImageUserDetailsButtonWidget(
                                    age: succusState.userDataModel[index].age,
                                    date: succusState
                                        .userDataModel[index].dateApplied,
                                    gender:
                                        succusState.userDataModel[index].gender,
                                    img: succusState
                                        .userDataModel[index].imageUrl,
                                    location: succusState
                                        .userDataModel[index].location,
                                    name: succusState.userDataModel[index].name,
                                    onTapReject: () {
                                      print('object');
                                    },
                                    ontapAccept: () {
                                      blocAwaiting.add(AcceptBttonClickedEvent(
                                          clikedAccept: succusState
                                              .userDataModel[index]));
                                    },
                                    ontapConsider: () {},
                                  ),
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

class UserTileWidget extends StatelessWidget {
  const UserTileWidget(
      {super.key, required this.blocAwaiting, required this.userDataModel});
  final UserDataModel userDataModel;
  final BlocAwaitingBloc blocAwaiting;

  @override
  Widget build(BuildContext context) {
    // final double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ImageUserDetailsButtonWidget(
        age: userDataModel.age,
        date: userDataModel.dateApplied,
        gender: userDataModel.gender,
        img: userDataModel.imageUrl,
        location: userDataModel.location,
        name: userDataModel.name,
        onTapReject: () {},
        ontapAccept: () {
          print('accept');
        },
        ontapConsider: () {},
      ),
    );
  }
}

class ImageUserDetailsButtonWidget extends StatelessWidget {
  const ImageUserDetailsButtonWidget(
      {super.key,
      // required this.width,
      // required this.userDataModel,
      required this.age,
      required this.date,
      required this.img,
      required this.location,
      required this.name,
      required this.onTapReject,
      required this.ontapAccept,
      required this.ontapConsider,
      required this.gender});

  // final double width;
  // final UserDataModel userDataModel;
  final String img, name, age, location, date, gender;
  final dynamic ontapAccept, ontapConsider, onTapReject;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: width / 1.5,
      decoration: const BoxDecoration(
        boxShadow: [BoxShadow(color: Colors.black, blurRadius: 3)],
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: width / 7,
                  height: width / 7,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.fill, image: NetworkImage(img))),
                ),
              ),
              TextBold(size: 15, test: name)
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: width / 9),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextNormal(
                          size: 15,
                          test: 'Gender :',
                        ),
                        TextNormal(
                          size: 15,
                          test: 'Age :',
                        ),
                        TextNormal(
                          size: 15,
                          test: 'Location :',
                        ),
                        TextNormal(
                          size: 15,
                          test: 'Date Applied :',
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextBold(
                          size: 15,
                          test: gender,
                        ),
                        TextBold(
                          size: 15,
                          test: age,
                        ),
                        TextBold(
                          size: 15,
                          test: location,
                        ),
                        TextBold(
                          size: 15,
                          test: date,
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                EleButton(
                  onTap: ontapAccept,
                  test: 'Accept',
                ),
                EleButton(onTap: ontapConsider, test: 'Consider'),
                EleButton(onTap: onTapReject, test: 'Reject')
              ],
            ),
          )
        ],
      ),
    );
  }
}

class EleButton extends StatelessWidget {
  const EleButton({super.key, required this.onTap, required this.test});
  final dynamic onTap;
  final String test;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        child: TextNormal(
          size: 13,
          test: test,
        ));
  }
}

class TextBold extends StatelessWidget {
  const TextBold({super.key, required this.size, required this.test});
  final String test;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Text(
      test,
      style: TextStyle(
          fontSize: size, fontWeight: FontWeight.bold, color: Colors.black),
    );
  }
}

class TextNormal extends StatelessWidget {
  const TextNormal({super.key, required this.size, required this.test});
  final String test;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Text(
      test,
      style: TextStyle(
          fontSize: size, fontWeight: FontWeight.normal, color: Colors.black),
    );
  }
}
