import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rent_a_car/core/dimens/dimens.dart';
import 'package:rent_a_car/core/themes/app_pallete.dart';
import 'package:rent_a_car/core/widgets/Loader.dart';
import 'package:rent_a_car/features/auth/persentation/bloc/auth_bloc.dart';

import '../../../../core/drawables/drawable.dart';
import '../../../../core/utils/show_snackbar.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../domain/models/drawer_menu_item.dart';
import 'drawar_menu_item.dart';

class ContainerDrawer extends StatefulWidget {
  const ContainerDrawer({super.key});

  @override
  State<ContainerDrawer> createState() => _ContainerDrawerState();
}

class _ContainerDrawerState extends State<ContainerDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppPallete.backgroundColor,
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            showSnackBar(context, 'User logout failed', isError: true);
          }
          else{
            showSnackBar(context, 'User logout successfully', isError: false);
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(child: Loader());
          }else{
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                      width: AppDimens.screenWidth,
                      height: 300.0,
                      decoration: BoxDecoration(
                          color: AppPallete.borderColor,
                          borderRadius: BorderRadius.circular(35.0)),
                      child: Stack(
                        children: [
                          Center(
                              child: Text(
                                'Ahmed',
                                style: GoogleFonts.poly(
                                    textStyle: const TextStyle(
                                        fontSize: 100.0,
                                        color: AppPallete.largeTitleColor)),
                              )),
                          Center(child: Image.asset(Drawable.profile_image)),
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          DrawerMenuItem(
                              item: MenuItem(
                                title: 'My Profile',
                                image: Drawable.my_profile_icon,
                              )),
                          DrawerMenuItem(
                              item: MenuItem(
                                  title: 'Settings',
                                  image: Drawable.settings_icon)),
                          DrawerMenuItem(
                              item: MenuItem(
                                  title: 'Notification',
                                  image: Drawable.notification_icon)),
                          DrawerMenuItem(
                              item: MenuItem(
                                  title: 'Privacy',
                                  image: Drawable.privacy_icon)),
                          DrawerMenuItem(
                              item: MenuItem(
                                  title: 'Help & Info',
                                  image: Drawable.help_and_info_icon)),
                        ],
                      ),
                      const SizedBox(
                        height: 100.0,
                      ),
                      PrimaryButton(
                          text: 'Log Out',
                          callback: () {
                            context.read<AuthBloc>().add(AuthUserLogout());
                          }),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
