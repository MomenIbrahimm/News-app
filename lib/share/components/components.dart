import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:news_app/modules/details_screen.dart';
import 'package:news_app/share/style/style.dart';

int currentIndex = 1;

Widget defaultTab({required IconData icon, required String text}) {
  return Tab(icon: Icon(icon), text: text, height: 70);
}

Widget switchTab() {
  return // Here default theme colors are used for activeBgColor, activeFgColor, inactiveBgColor and inactiveFgColor
      FlutterToggleTab(
    borderRadius: 7.5,
    width: 60,
    height: 30,
    selectedIndex: currentIndex,
    selectedBackgroundColors: const [Colors.blueGrey, Colors.blueGrey],
    selectedTextStyle: const TextStyle(
        color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
    unSelectedTextStyle: const TextStyle(
        color: Colors.black87, fontSize: 14, fontWeight: FontWeight.w500),
    labels: const ['اخبار مصرية', 'Us News'],
    selectedLabelIndex: (index) {
      currentIndex = index;
      print(index);
    },
    isScroll: false,
  );
}

Widget buildArticlesItem(article, context, {String text = 'details'}) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
                child: Text(
              'Author: ${article['author'] ?? 'Unknown'}',
              maxLines: 1,
            )),
            const Spacer(),
            Text('${article['publishedAt']}'),
          ],
        ),
      ),
      CachedNetworkImage(
        placeholder: (context,url)=> const Center(child: CircularProgressIndicator()),
          errorWidget: (context,url,error)=>  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Failed to load image check your internet',style: TextStyle(fontSize: 12.0,color: Colors.red),),
              Icon(Icons.error,size: 25.0,color: Colors.red,)
            ],
          ),
          cacheManager: CacheManager(
            Config(
              'customCacheKey',
              stalePeriod: const Duration(days: 7),
            ),
          ),
          imageUrl:
              '${article['urlToImage'] ?? 'https://media.istockphoto.com/id/1390033645/photo/world-news-background-which-can-be-used-for-broadcast-news.jpg?b=1&s=170667a&w=0&k=20&c=glqFWZtWU4Zqyxd8CRu5_Or81zqwe7cyhturXaIFEOA='}'),
      const SizedBox(
        height: 5.0,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Row(
          children: [
            Expanded(
              child: Text('${article['title']}',
                  style: aBeeZee, overflow: TextOverflow.ellipsis, maxLines: 2),
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
                    Navigator.push(
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
                                )));
                  },
                  child: Text(text,style: const TextStyle(color: Colors.white),),
                )),
          ],
        ),
      ),
    ],
  );
}

Widget defaultText(text) {
  return Text(text, style: aBeeZee);
}

Widget defaultSizedBox() {
  return const SizedBox(
    height: 10,
  );
}

Widget myDivider() {
  return const Divider();
}
