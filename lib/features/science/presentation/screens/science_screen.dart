import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/widgets/article_loading_item.dart';
import 'package:news_app/features/science/presentation/logic/science_cubit.dart';
import 'package:news_app/features/science/presentation/logic/science_states.dart';
import 'package:news_app/features/science/presentation/screens/widgets/science_listview.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScienceCubit, ScienceStates>(
      buildWhen: (previous, current) =>
          State is! Loading || current is Loaded || State is Error,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const ArticleLoadingItem(),
          error: (failure) => Center(child: Text(failure)),
          loaded: (scienceModel) => ScienceListview(scienceModel: scienceModel),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
