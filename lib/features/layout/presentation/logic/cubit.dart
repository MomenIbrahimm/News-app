import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/business/presentation/screens/business_screen.dart';
import 'package:news_app/features/layout/presentation/logic/state.dart';
import 'package:news_app/features/science/presentation/screens/science_screen.dart';
import 'package:news_app/features/sports/presentation/screens/sport_screen.dart';

import '../../../../modules/search_screen.dart';
import '../../../../share/network/remote/cache_helper.dart';
import '../../../../share/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(InitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
    SearchScreen(),
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

  bool isTogel = false;

  void togelTab() {
    isTogel = !isTogel;
    emit(TogleState());
  }

  List<dynamic> business = [];
  void getBusinessData({page}) {
    emit(GetBusinessDataLoadingState());

    DioHelper.getData(url: 'v2/top-headlines', query: {
      'category': 'business',
      'country': 'us',
      'apiKey': 'da2217f76a4b4a499b2d4a56efedd6e5',
    }).then((value) {
      business = value.data['articles'];
      emit(GetBusinessDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetBusinessDataErrorState(error.toString()));
    });
  }

  List<dynamic> egBusiness = [];
  void getEgyBusinessData() {
    emit(GetEgyBusinessDataLoadingState());

    DioHelper.getData(url: 'v2/top-headlines', query: {
      'category': 'business',
      'country': 'eg',
      'apiKey': 'da2217f76a4b4a499b2d4a56efedd6e5'
    }).then((value) {
      egBusiness = value.data['articles'];
      emit(GetEgyBusinessDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetEgyBusinessDataErrorState(error.toString()));
    });
  }

  List<dynamic> sports = [];
  void getSportsData() {
    emit(GetSportsDataLoadingState());

    DioHelper.getData(url: 'v2/top-headlines', query: {
      'category': 'sports',
      'country': 'us',
      'apiKey': 'da2217f76a4b4a499b2d4a56efedd6e5'
    }).then((value) {
      sports = value.data['articles'];
      emit(GetSportsDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetSportsDataErrorState(error.toString()));
    });
  }

  List<dynamic> egySports = [];
  void getEgySportsData() {
    emit(GetEgySportsDataLoadingState());

    DioHelper.getData(url: 'v2/top-headlines', query: {
      'category': 'sports',
      'country': 'eg',
      'apiKey': 'da2217f76a4b4a499b2d4a56efedd6e5'
    }).then((value) {
      egySports = value.data['articles'];
      emit(GetEgySportsDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetEgySportsDataErrorState(error.toString()));
    });
  }

  List<dynamic> science = [];
  void getScienceData() {
    emit(GetScienceDataLoadingState());

    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'category': 'science',
        'country': 'us',
        'apiKey': 'da2217f76a4b4a499b2d4a56efedd6e5',
      },
    ).then((value) {
      science = value.data['articles'];
      emit(GetScienceDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetScienceDataErrorState(error.toString()));
    });
  }

  List<dynamic> egyScience = [];
  void getEgyScienceData() {
    emit(GetEgyScienceDataLoadingState());

    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'category': 'science',
        'country': 'eg',
        'apiKey': 'da2217f76a4b4a499b2d4a56efedd6e5',
      },
    ).then((value) {
      egyScience = value.data['articles'];
      emit(GetEgyScienceDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetEgyScienceDataErrorState(error.toString()));
    });
  }

  List<dynamic> search = [];

  void getSearchData({String? value}) async {
    emit(GetSearchDataLoadingState());
    search = [];

    try {
      var response = await DioHelper.getData(
        url: 'v2/everything',
        query: {
          'q': value,
          'apiKey': 'da2217f76a4b4a499b2d4a56efedd6e5',
        },
      );
      search = response.data['articles'];
      emit(GetSearchDataSuccessState());
    } on SocketException catch (e) {
      print('net error');
      emit(GetSearchDataErrorState(e.toString()));
    }

    // DioHelper.getData(
    //   url: 'v2/everything',
    //   query: {
    //     'q':value,
    //     'apiKey':'da2217f76a4b4a499b2d4a56efedd6e5',
    //   },
    // ).then((value){
    //   search = value.data['articles'];
    //   emit(GetSearchDataSuccessState());
    // }).catchError((error){
    //   print(error.toString());
    //   emit(GetSearchDataErrorState(error.toString()));
    // });
  }
}