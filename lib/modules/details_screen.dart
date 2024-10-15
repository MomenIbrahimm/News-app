import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:news_app/modules/webview_screen.dart';
import 'package:news_app/share/components/components.dart';

import '../features/layout/presentation/logic/cubit.dart';
import '../features/layout/presentation/logic/state.dart';
import '../share/style/const.dart';

class DetailsScreen extends StatelessWidget {
  final author;
  final title;
  final description;
  final content;
  final url;
  final publishDate;
  final image;

  const DetailsScreen(
      {this.author,
      this.title,
      this.description,
      this.content,
      this.url,
      this.image,
      this.publishDate});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: NewsCubit.get(context).isSwitch ? b : w,
          appBar: AppBar(
            backgroundColor: NewsCubit.get(context).isSwitch ? b : w,
            iconTheme: NewsCubit.get(context).isSwitch
                ? const IconThemeData(
                    color: Colors.black,
                  )
                : const IconThemeData(
                    color: Colors.white,
                  ),
            leading: IconButton(
              color: NewsCubit.get(context).isSwitch ? b : w,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: (const Icon(Ionicons.arrow_back, color: Colors.black87)),
            ),
            elevation: 0.0,
            centerTitle: true,
            title: const Text(
              'read the full content',
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        image: DecorationImage(
                            image: NetworkImage(image != null
                                ? '$image'
                                : 'https://media.istockphoto.com/id/1390033645/photo/world-news-background-which-can-be-used-for-broadcast-news.jpg?b=1&s=170667a&w=0&k=20&c=glqFWZtWU4Zqyxd8CRu5_Or81zqwe7cyhturXaIFEOA='),
                            fit: BoxFit.cover)),
                  ),
                  defaultSizedBox(),
                  defaultText(
                      author != null ? 'Author: $author' : 'Author: Unknown'),
                  defaultSizedBox(),
                  defaultText(
                      title != null ? 'Title: $title' : 'Title: Unknown'),
                  defaultSizedBox(),
                  defaultText(description != null
                      ? 'Description: $description'
                      : 'Description: Unknown'),
                  defaultSizedBox(),
                  defaultText(content != null
                      ? 'Content: $content'
                      : 'Content: Unknown'),
                  defaultSizedBox(),
                  defaultText(publishDate != null
                      ? 'publishedAt: $publishDate'
                      : 'publishedAt: Unknown'),
                  defaultSizedBox(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      child: Text(
                        url != null
                            ? 'This link will explain more details of this news if you want click on it: $url'
                            : 'Url: Unknown',
                        style: const TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WebviewScreen(url)));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
