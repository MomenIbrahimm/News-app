import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:news_app/core/di/dependency_injection.dart';
import 'package:news_app/core/theming/style.dart';
import 'package:news_app/features/business/data/repo/business_repo.dart';
import 'package:news_app/features/business/presentation/logic/business_cubit.dart';
import 'package:news_app/features/layout/presentation/screens/widgets/custom_tab.dart';
import 'package:news_app/features/science/data/repo/science_repo.dart';
import 'package:news_app/features/science/presentation/logic/science_cubit.dart';
import 'package:news_app/features/sports/data/repo/sports_repo.dart';
import 'package:news_app/features/sports/presentation/logic/sports_cubit.dart';

import '../../../../core/theming/color_manger.dart';
import '../logic/cubit.dart';
import '../logic/state.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              BusinessCubit(getIt.get<BusinessRepo>())..getBusinessData(),
        ),
        BlocProvider(
          create: (context) =>
              SportsCubit(getIt.get<SportsRepo>())..getSportsData(),
        ),
        BlocProvider(
          create: (context) =>
              ScienceCubit(getIt.get<ScienceRepo>())..getScienceData(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          return DefaultTabController(
            length: AppCubit.get(context).screens.length,
            child: Scaffold(
              backgroundColor: AppCubit.get(context).isSwitch
                  ? ColorManger.black
                  : ColorManger.white,
              appBar: AppBar(
                /*       actions: [
                  IconButton(
                    onPressed: () {
                      NewsCubit.get(context).switchButton();
                    },
                    icon: Icon(
                      Icons.nightlight,
                      color: !NewsCubit.get(context).isSwitch
                          ? ColorManger.black
                          : ColorManger.white,
                    ),
                  )
                ],*/
                title: Container(
                    color: Colors.black12,
                    child: Text(
                      'News all over the world',
                      style: TextStyle(fontSize: size),
                    )),
                bottom: const TabBar(
                  indicatorColor: ColorManger.white,
                  tabs: [
                    CustomTab(icon: Ionicons.business, text: 'Business'),
                    CustomTab(icon: Ionicons.body, text: 'Sports'),
                    CustomTab(icon: Ionicons.thermometer, text: 'Science'),
                    CustomTab(icon: Ionicons.search, text: 'Search'),
                  ],
                ),
              ),
              body: TabBarView(
                children: AppCubit.get(context).screens,
              ),
            ),
          );
        },
      ),
    );
  }
}
