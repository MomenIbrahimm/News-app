import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/business/data/model/news_model.dart';
import 'package:news_app/features/science/presentation/logic/science_cubit.dart';

import '../../../../../core/theming/color_manger.dart';
import '../../../../../core/widgets/article_item.dart';

class ScienceListview extends StatelessWidget {
  const ScienceListview({super.key, required this.scienceModel});

  final NewsModel scienceModel;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: ColorManger.primaryColor,
      onRefresh: () {
        return Future.delayed(
          const Duration(seconds: 1),
          () {
            context.read<ScienceCubit>().getScienceData();
          },
        );
      },
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: scienceModel.articles!.length,
        itemBuilder: (context, index) => ArticleItem(
          model: scienceModel.articles![index],
        ),
      ),
    );
  }
}
