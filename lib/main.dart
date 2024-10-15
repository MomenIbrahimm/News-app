import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/helpers/bloc_observe.dart';
import 'package:news_app/core/local_cache/cache_helper.dart';

import 'core/di/dependency_injection.dart';
import 'news_app.dart';

void main() async {
  WidgetsFlutterBinding();
  getInit();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();

  bool? isSwitch = CacheHelper.getData(key: 'isSwitch');
  isSwitch ??= false;

  runApp(NewsApp(isSwitch: isSwitch));

  // Widget widget;
/*  bool? isBoarding = CacheHelper.getData(key: 'onBoarding');

  if (isBoarding != null) {
    widget = const LayoutScreen();
  } else {
    widget = OnBoardingScreen();
  }*/
}
