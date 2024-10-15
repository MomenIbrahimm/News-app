import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:intl/intl.dart';
import 'package:news_app/features/business/data/model/news_model.dart';

import '../../share/style/style.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({super.key, required this.model});

  final Articles model;

  @override
  Widget build(BuildContext context) {
    var time = DateFormat.yMMMd().format(DateTime.parse(model.publishedAt!));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Author: ${model.author ?? 'Unknown'}',
                        maxLines: 1,
                      ),
                    ),
                    const Spacer(),
                    Text(time),
                  ],
                ),
              ),
              CachedNetworkImage(
                  placeholder: (context, url) => const SizedBox.shrink(),
                  errorWidget: (context, url, error) => const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Failed to load image check your internet',
                            style: TextStyle(fontSize: 12.0, color: Colors.red),
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
              const SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        '${model.title}',
                        style: aBeeZee,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    SizedBox(
                      width: 80,
                      height: 30.0,
                      child: MaterialButton(
                        elevation: 5.0,
                        color: Colors.blueGrey,
                        onPressed: () {
                          /*  Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailsScreen(
                                        author: article['author'],
                                        title: article['title'],
                                        description: article['description'],
                                        content: article['content'],
                                        publishDate: article['publishedAt'],
                                        url: article['url'],
                                        image: article['urlToImage'],
                                      )));*/
                        },
                        child: const Text(
                          'Details',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
