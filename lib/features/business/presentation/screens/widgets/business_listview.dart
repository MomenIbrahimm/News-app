import 'package:flutter/material.dart';
import 'package:news_app/features/business/data/model/news_model.dart';

import '../../../../../core/widgets/article_item.dart';

class BusinessListview extends StatelessWidget {
  const BusinessListview({super.key, required this.businessModel});

  final NewsModel businessModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: businessModel.articles!.length,
      itemBuilder: (context, index) =>
          ArticleItem(model: businessModel.articles![index]),
    );
  }
}
