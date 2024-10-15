import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/widgets/article_loading_item.dart';
import 'package:news_app/features/sports/presentation/screens/widgets/sports_listview.dart';

import '../logic/sports_cubit.dart';
import '../logic/sports_states.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SportsCubit, SportsStates>(
      buildWhen: (previous, current) =>
          State is! Loading || State is Loaded || State is Error,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () {
            return const ArticleLoadingItem();
          },
          error: (error) {
            return Center(
              child: Text(error),
            );
          },
          loaded: (sportsModel) {
            return SportsListview(sportsModel: sportsModel);
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
