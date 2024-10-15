import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:ionicons/ionicons.dart';
import 'package:news_app/core/widgets/article_item.dart';
import 'package:news_app/share/components/components.dart';

import '../features/layout/presentation/logic/cubit.dart';
import '../features/layout/presentation/logic/state.dart';
import '../share/style/const.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();

    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return OfflineBuilder(
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
                    TextFormField(
                      controller: searchController,
                      onChanged: (value) {
                        NewsCubit.get(context).getSearchData(value: value);
                      },
                      style: TextStyle(fontSize: 14.0, color: b),
                      decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: TextStyle(
                              color: NewsCubit.get(context).isSwitch
                                  ? Colors.blueGrey
                                  : b),
                          filled: true,
                          fillColor: w,
                          suffixIcon: Icon(
                            Ionicons.search_outline,
                            color: NewsCubit.get(context).isSwitch
                                ? Colors.blueGrey
                                : b,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.5),
                          )),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Expanded(
                        child: BuildCondition(
                      condition: state is! GetSearchDataLoadingState,
                      builder: (context) => ListView.separated(
                          itemBuilder: (context, index) =>
                              ArticleItem(model: list[index]),
                          separatorBuilder: (context, index) => myDivider(),
                          itemCount: list.length),
                      fallback: (context) =>
                          const Center(child: CircularProgressIndicator()),
                    ))
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
        );
      },
    );
  }
}
