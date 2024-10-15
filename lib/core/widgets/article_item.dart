import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:intl/intl.dart';
import 'package:news_app/core/theming/color_manger.dart';
import 'package:news_app/features/business/data/model/news_model.dart';

import '../../features/news_details/presentation/screens/details_screen.dart';
import '../theming/style.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({super.key, required this.model});

  final Articles model;

  @override
  Widget build(BuildContext context) {
    var time = DateFormat.yMMMd().format(DateTime.parse(model.publishedAt!));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      child: Card(
        color: Colors.white,
        elevation: 2.5,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text.rich(TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Author: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: model.author ?? 'Unknown',
                        ),
                      ],
                    )),
                  ),
                  Text(
                    time,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: CachedNetworkImage(
                    placeholder: (context, url) => const SizedBox.shrink(),
                    errorWidget: (context, url, error) => const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Failed to load image check your internet',
                              style:
                                  TextStyle(fontSize: 12.0, color: Colors.red),
                            ),
                            Icon(
                              Icons.error,
                              size: 25.0,
                              color: Colors.red,
                            )
                          ],
                        ),
                    cacheManager: CacheManager(
                      Config(
                        'customCacheKey',
                        stalePeriod: const Duration(days: 7),
                      ),
                    ),
                    imageUrl: model.urlToImage ??
                        'https://media.istockphoto.com/id/1390033645/photo/world-news-background-which-can-be-used-for-broadcast-news.jpg?b=1&s=170667a&w=0&k=20&c=glqFWZtWU4Zqyxd8CRu5_Or81zqwe7cyhturXaIFEOA='),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '${model.title}',
                      style: aBeeZee.copyWith(
                          fontSize: 14.0, color: Colors.black87),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  SizedBox(
                    width: 85,
                    height: 30.0,
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      elevation: 2.0,
                      color: ColorManger.primaryColor.withOpacity(0.75),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                              model: model,
                            ),
                          ),
                        );
                      },
                      child: const FittedBox(
                        child: Text(
                          'Details',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
