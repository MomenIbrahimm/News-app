import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/theming/color_manger.dart';
import 'features/layout/presentation/logic/cubit.dart';
import 'features/layout/presentation/logic/state.dart';
import 'features/onboarding/on_boarding_screen.dart';

class NewsApp extends StatelessWidget {
  final bool? isSwitch;

  const NewsApp({super.key, this.isSwitch});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          AppCubit()..switchButton(fromShared: isSwitch),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: ColorManger.primarySwatch,
              primaryTextTheme: TextTheme(
                bodyLarge: GoogleFonts.aBeeZee(),
              ),
              textTheme: Theme.of(context).textTheme.apply(
                  bodyColor: AppCubit.get(context).isSwitch
                      ? Colors.white
                      : Colors.black87,
                  displayColor: Colors.blue),
              appBarTheme: AppBarTheme(
                backgroundColor: ColorManger.primaryColor,
                elevation: 2.0,
                titleTextStyle:
                    GoogleFonts.aBeeZee(fontWeight: FontWeight.bold),
                systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: Colors.black12,
                ),
              ),
            ),
            home: const OnBoardingScreen(),
          );
        },
      ),
    );
  }
}
