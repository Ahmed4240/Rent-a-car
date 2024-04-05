import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rent_a_car/core/commons/app_user/app_user_cubit.dart';
import 'package:rent_a_car/core/dimens/dimens.dart';
import 'package:rent_a_car/core/drawables/drawable.dart';
import 'package:rent_a_car/features/auth/persentation/bloc/auth_bloc.dart';
import 'package:rent_a_car/features/auth/persentation/pages/sign_in_page.dart';

import '../../../../core/commons/widgets/bold_text.dart';
import '../../../../core/themes/app_pallete.dart';
import '../../../home/persentation/pages/home_page.dart';
import '../widgets/multi_color_text.dart';
import '../widgets/started_button.dart';

class SplashPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const SplashPage());

  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController animationController;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));
    animationController.forward();
    super.initState();
    context.read<AuthBloc>().add(AuthCurrentUserData());
  }

  @override
  Widget build(BuildContext context) {
    AppDimens().init(context);
    return PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) async {
          if (didPop) return;
          Navigator.pop(context);
        },
      child: Scaffold(
        body: BlocSelector<AppUserCubit, AppUserState, bool>(
          selector: (state) {
            return state is AppUserLoggedIn;
          },
          builder: (context, isUserLoggedIn) {
            print('isUserLoggedIn : ${isUserLoggedIn}');
            if (isUserLoggedIn) {
              return const HomePage();
            } else {
              return Container(
                width: AppDimens.screenWidth,
                height: AppDimens.screenHeight,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(Drawable.splash_background),
                      fit: BoxFit.cover),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: AppDimens.screenHeight! * 0.26,
                    ),
                    const MultiColorText(),
                    SizedBox(
                      height: AppDimens.screenHeight! * 0.34,
                    ),
                    const Align(
                      alignment: Alignment.bottomCenter,
                      child: BoldText(
                        content: 'Rent your dream car from the \nBest Company',
                        textColor: AppPallete.neonGrayColor,
                      ),
                    ),
                    SizedBox(
                      height: AppDimens.screenHeight! * 0.11,
                    ),
                    FadeTransition(
                      opacity: animationController
                          .drive(CurveTween(curve: Curves.easeInBack)),
                      child: StartedButton(
                        callback: () {
                          Navigator.pushReplacement(context, SignInPage.route());
                        },
                      ),
                    ),
                    SizedBox(
                      height: AppDimens.screenHeight! * 0.08,
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
