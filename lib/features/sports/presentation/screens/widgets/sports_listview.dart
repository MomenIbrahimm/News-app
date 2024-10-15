import 'package:flutter/material.dart';
import 'package:news_app/features/business/data/model/news_model.dart';

import '../../../../../core/widgets/article_item.dart';
import '../../../../../share/components/components.dart';

class SportsListview extends StatelessWidget {
  const SportsListview({super.key, required this.sportsModel});

  final NewsModel sportsModel;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: sportsModel.articles!.length,
      itemBuilder: (context, index) =>
          ArticleItem(model: sportsModel.articles![index]),
      separatorBuilder: (context, index) => myDivider(),
    );
  }
}
