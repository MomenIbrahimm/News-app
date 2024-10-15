import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/business/data/model/news_model.dart';

import '../../../../../core/theming/color_manger.dart';
import '../../../../../core/widgets/article_item.dart';
import '../../logic/business_cubit.dart';

class BusinessListview extends StatelessWidget {
  const BusinessListview({super.key, required this.businessModel});

  final NewsModel businessModel;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: ColorManger.primaryColor,
      onRefresh: () {
        return Future.delayed(
          const Duration(seconds: 1),
          () {
            context.read<BusinessCubit>().getBusinessData();
          },
        );
      },
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: businessModel.articles!.length,
        itemBuilder: (context, index) =>
            ArticleItem(model: businessModel.articles![index]),
      ),
    );
  }
}
