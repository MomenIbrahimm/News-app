import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:news_app/core/helpers/spacing.dart';
import 'package:news_app/features/search/presentation/logic/search_cubit.dart';
import 'package:news_app/features/search/presentation/screens/widgets/search_form.dart';
import 'package:news_app/features/search/presentation/screens/widgets/search_listview.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../data/repo/search_repo.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(getIt.get<SearchRepo>()),
      child: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
        ) {
          final bool connected = connectivity != ConnectivityResult.none;
          if (connected) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SearchForm(),
                  verticalSpace(5),
                  const SearchListview(),
                ],
              ),
            );
          } else {
            return Column(
              children: [
                Image.asset(
                  'assets/offlineImage.png',
                  fit: BoxFit.contain,
                ),
                const Text(
                  'You are offline check your internet connection',
                  style: TextStyle(color: Colors.blueGrey, fontSize: 18.0),
                ),
                const Icon(Icons.error, color: Colors.red),
              ],
            );
          }
        },
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
