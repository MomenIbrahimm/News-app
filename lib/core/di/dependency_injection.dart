import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/features/business/data/repo/business_repo.dart';
import 'package:news_app/features/science/data/repo/science_repo.dart';
import 'package:news_app/features/search/data/repo/search_repo.dart';
import 'package:news_app/features/sports/data/repo/sports_repo.dart';

import '../networking/api_services.dart';

GetIt getIt = GetIt.instance;

void getInit() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));

  getIt.registerSingleton<BusinessRepo>(BusinessRepo(getIt.get<ApiService>()));
  getIt.registerSingleton<SportsRepo>(SportsRepo(getIt.get<ApiService>()));
  getIt.registerSingleton<ScienceRepo>(ScienceRepo(getIt.get<ApiService>()));
  getIt.registerSingleton<SearchRepo>(SearchRepo(getIt.get<ApiService>()));
}
