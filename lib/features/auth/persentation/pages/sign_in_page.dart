import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rent_a_car/core/dimens/dimens.dart';
import 'package:rent_a_car/core/drawables/drawable.dart';
import 'package:rent_a_car/core/themes/app_pallete.dart';
import 'package:rent_a_car/core/utils/show_snackbar.dart';
import 'package:rent_a_car/core/widgets/primary_button.dart';
import 'package:rent_a_car/features/auth/persentation/bloc/auth_bloc.dart';
import 'package:rent_a_car/features/auth/persentation/pages/sign_up_page.dart';
import 'package:rent_a_car/features/auth/persentation/widgets/auth_field.dart';
import 'package:rent_a_car/features/home/persentation/pages/home_page.dart';
import 'package:rent_a_car/features/splash/persentation/widgets/social_signin_button.dart';

import '../../../../core/widgets/Loader.dart';
import '../widgets/large_text.dart';

class SignInPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const SignInPage());

  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppDimens.pagePadding!),
          child: Form(
            key: formKey,
            child: BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthFailure) {
                  showSnackBar(context, 'Invalid user name & password',
                      isError: true);
                }
                else if(state is AuthSuccess){
                  Navigator.push(context, HomePage.route());
                }
              },
              builder: (context, state) {
                if (state is AuthLoading) {
                  return const Center(child: Loader());
                }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 50.0,
                      ),
                      const LargeText(
                        text: 'Sign In',
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        width: AppDimens.screenWidth! * 0.15,
                        height: 4.0,
                        decoration: BoxDecoration(
                            color: AppPallete.neonGrayColor,
                            borderRadius: BorderRadius.circular(40.0)),
                      ),
                      const SizedBox(
                        height: 50.0,
                      ),
                      AuthField(
                          hintText: 'Email or phone',
                          controller: emailController),
                      const SizedBox(
                        height: 20.0,
                      ),
                      AuthField(
                          hintText: 'Password', controller: passwordController),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Forgot password?',
                        style: GoogleFonts.inter(textStyle: const TextStyle()),
                      ),
                      const SizedBox(
                        height: 50.0,
                      ),
                      PrimaryButton(
                          text: 'Sign in',
                          callback: () {
                            if (!formKey.currentState!.validate()) {
                              showSnackBar(
                                  context, 'Above field\'s are required!',
                                  isError: true);
                            } else {
                              context.read<AuthBloc>().add(AuthSignIn(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim()));
                            }
                          }),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Center(
                        child: Text(
                          'OR',
                          style: GoogleFonts.inter(
                              textStyle: const TextStyle(fontSize: 20.0)),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      SocialSignInButton(
                          text: 'Continue with google',
                          callback: () {},
                          logo: Drawable.google_icon),
                      const SizedBox(
                        height: 10.0,
                      ),
                      SocialSignInButton(
                          text: 'Continue with facebook',
                          callback: () {},
                          logo: Drawable.facebook_icon),
                      const SizedBox(
                        height: 50.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Don’t Have an account yet?',
                            style: GoogleFonts.inter(
                                textStyle: const TextStyle(fontSize: 14.0)),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, SignUpPage.route());
                            },
                            child: Text(
                              'SIGN UP',
                              style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: AppPallete.gradient3),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  );
              },
            ),
          ),
        ),
      ),
    );
  }
}
