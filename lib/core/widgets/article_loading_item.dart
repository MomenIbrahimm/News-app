import 'package:flutter/material.dart';
import 'package:news_app/core/helpers/spacing.dart';

class ArticleLoadingItem extends StatelessWidget {
  const ArticleLoadingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      itemCount: 4,
      itemBuilder: (context, index) => Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              customLoadingContainer(
                height: 200,
                width: double.infinity,
              ),
              verticalSpace(5),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    customLoadingContainer(),
                    const Spacer(),
                    customLoadingContainer(),
                  ],
                ),
              ),
              customLoadingContainer(),
              const SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Row(
                  children: [
                    Expanded(
                      child: customLoadingContainer(),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    customLoadingContainer(height: 40),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  customLoadingContainer({double? height, double? width}) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.3),
          borderRadius: BorderRadius.circular(6)),
      height: height ?? 15,
      width: width ?? 100,
    );
  }
}
