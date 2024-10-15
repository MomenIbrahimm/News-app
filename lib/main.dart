import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/features/onboarding/on_boarding_screen.dart';
import 'package:news_app/share/bloc_observe.dart';
import 'package:news_app/share/network/remote/cache_helper.dart';
import 'package:news_app/share/network/remote/dio_helper.dart';

import 'core/di/dependency_injection.dart';
import 'features/layout/presentation/logic/cubit.dart';
import 'features/layout/presentation/logic/state.dart';
import 'features/layout/presentation/screens/layout_screen.dart';

void main() async {
  WidgetsFlutterBinding();
  getInit();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  bool? isSwitch = CacheHelper.getData(key: 'isSwitch');
  isSwitch ??= false;

  Widget widget;
  bool? isBoarding = CacheHelper.getData(key: 'onBoarding');

  if (isBoarding != null) {
    widget = LayoutScreen();
  } else {
    widget = OnBoardingScreen();
  }

  runApp(MyApp(isSwitch, widget));
}

class MyApp extends StatelessWidget {
  final bool? isSwitch;
  Widget startWidget;

  MyApp(this.isSwitch, this.startWidget, {super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) {
            return NewsCubit()..switchButton(fromShared: isSwitch);
          },
        ),
      ],
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primarySwatch: Colors.blueGrey,
                primaryTextTheme: TextTheme(bodyLarge: GoogleFonts.aBeeZee()),
                textTheme: Theme.of(context).textTheme.apply(
                    bodyColor: NewsCubit.get(context).isSwitch
                        ? Colors.white
                        : Colors.black87,
                    displayColor: Colors.blue),
                appBarTheme: AppBarTheme(
                    elevation: 2.0,
                    titleTextStyle:
                        GoogleFonts.aBeeZee(fontWeight: FontWeight.bold),
                    systemOverlayStyle: const SystemUiOverlayStyle(
                      statusBarColor: Colors.black12,
                    ))),
            home: startWidget,
          );
        },
      ),
    );
  }
}

//#44666e
