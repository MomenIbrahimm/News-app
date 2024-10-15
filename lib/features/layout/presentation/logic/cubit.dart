import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/business/presentation/screens/business_screen.dart';
import 'package:news_app/features/layout/presentation/logic/state.dart';
import 'package:news_app/features/science/presentation/screens/science_screen.dart';
import 'package:news_app/features/sports/presentation/screens/sport_screen.dart';

import '../../../../core/local_cache/cache_helper.dart';
import '../../../search/presentation/screens/search_screen.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
    const SearchScreen(),
  ];

  bool isSwitch = false;

  void switchButton({fromShared}) {
    if (fromShared != null) {
      isSwitch = fromShared;
    } else {
      isSwitch = !isSwitch;
      CacheHelper.setData(key: 'isSwitch', value: isSwitch).then((value) {
        emit(SwitchState());
      });
    }
  }

  int currentIndex = 0;

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(ChangeBottomNav());
  }
}
