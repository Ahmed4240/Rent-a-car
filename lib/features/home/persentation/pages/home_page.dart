import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rent_a_car/core/drawables/drawable.dart';
import 'package:rent_a_car/core/utils/show_snackbar.dart';
import 'package:rent_a_car/features/home/persentation/bloc/home_bloc.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/dimens/dimens.dart';
import '../../../../core/themes/app_pallete.dart';
import '../../../../core/widgets/Loader.dart';
import '../../../../core/widgets/app_bar.dart';
import '../widgets/advertise_card.dart';
import '../widgets/avaiable_cars_item.dart';
import '../widgets/drawar_view.dart';

class HomePage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const HomePage());

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController = PageController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int currentIndex = 0;
  var currentTabs = [
    const AdvertiseCard(
      title: 'page 1',
      mColor: Colors.green,
    ),
    const AdvertiseCard(
      title: 'page 2',
      mColor: Colors.purple,
    ),
    const AdvertiseCard(
      title: 'page 3',
      mColor: Colors.orange,
    ),
    const AdvertiseCard(
      title: 'page 4',
      mColor: Colors.cyan,
    ),
  ];
  final List<String> selectedTopic = [];

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (currentIndex < currentTabs.length - 1) {
        currentIndex++;
        pageController.animateToPage(
          currentIndex,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      } else {
        currentIndex = 0;
        pageController.animateToPage(
          currentIndex,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      }
    });
    context.read<HomeBloc>().add(LoadAllCarsEvent());
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    AppDimens().init(context);
    return Scaffold(
      key: scaffoldKey,
      drawer: const ContainerDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CarAppBar(
            onMenuOptionClick: () {
              scaffoldKey.currentState?.openDrawer();
            },
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    height: 160.0,
                    child: PageView(
                      controller: pageController,
                      onPageChanged: (int index) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      children: currentTabs,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Flexible(
                        flex: 6,
                        fit: FlexFit.tight,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: Constants.topics
                                .map(
                                  (e) => Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        if (selectedTopic.contains(e)) {
                                          selectedTopic.remove(e);
                                        } else {
                                          selectedTopic.add(e);
                                        }
                                        setState(() {});
                                      },
                                      child: Chip(
                                        label: Text(e,
                                            style: GoogleFonts.ptSans()),
                                        backgroundColor:
                                            selectedTopic.contains(e)
                                                ? AppPallete.gradient1
                                                : null,
                                        side: selectedTopic.contains(e)
                                            ? null
                                            : const BorderSide(
                                                color: AppPallete.borderColor,
                                              ),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                      Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Image.asset(Drawable.ep_search_icon)),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Cars Available Near You',
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(fontSize: 20.0),
                          )),
                      Text('View more',
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                                fontSize: 14.0, color: AppPallete.errorColor),
                          ))
                    ],
                  ),
                  BlocConsumer<HomeBloc, HomeState>(
                    listener: (context, state) {
                      // TODO: implement listener
                      if (state is FailureState) {
                        showSnackBar(context, state.message);
                      }
                    },
                    builder: (context, state) {
                      if (state is LoadingState) {
                        return const Loader();
                      } else if (state is SuccessState) {
                        return Expanded(
                          child: GridView.builder(
                            shrinkWrap: true,
                            itemCount: state.carsList.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount:
                                        (orientation == Orientation.portrait)
                                            ? 2
                                            : 3),
                            itemBuilder: (BuildContext context, int index) {
                              return CarItemView(item: state.carsList[index]);
                            },
                          ),
                        );
                      } else {
                        return Center(
                          child: Image.asset(Drawable.error_icon),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
