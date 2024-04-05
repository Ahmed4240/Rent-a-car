import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rent_a_car/core/themes/theme.dart';
import 'package:rent_a_car/features/home/persentation/bloc/home_bloc.dart';
import 'package:rent_a_car/features/splash/persentation/pages/splash_page.dart';

import 'core/commons/app_user/app_user_cubit.dart';
import 'features/auth/persentation/bloc/auth_bloc.dart';
import 'init_dependancies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (_) => serviceLocator<AppUserCubit>()),
    BlocProvider(create: (_) => serviceLocator<AuthBloc>()),
    BlocProvider(create: (_) => serviceLocator<HomeBloc>()),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: AppTheme.lightThemeMode,
        home: const SplashPage());
  }
}
