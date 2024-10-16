import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:news_app/core/helpers/spacing.dart';
import 'package:news_app/core/theming/color_manger.dart';
import 'package:news_app/features/search/presentation/logic/search_cubit.dart';
import 'package:news_app/features/search/presentation/logic/search_states.dart';

class SearchListview extends StatelessWidget {
  const SearchListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchStates>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => buildSearchLoadingItem(),
          error: (error) => Text(error),
          loaded: (searchModel) => Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 10),
              itemCount: searchModel.articles!.length,
              itemBuilder: (context, index) {
                var time = DateFormat.yMMM().format(
                  DateTime.parse(searchModel.articles![index].publishedAt!),
                );

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Stack(
                    children: [
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(6),
                                child: CachedNetworkImage(
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,
                                  imageUrl: searchModel
                                          .articles![index].urlToImage ??
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVuTT1vhyh16roQWY_cEzcNmXDK1dshKllA&s",
                                ),
                              ),
                              horizontalSpace(10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            searchModel
                                                    .articles![index].author ??
                                                "Unknown",
                                            maxLines: 1,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              overflow: TextOverflow.fade,
                                            ),
                                          ),
                                        ),
                                        horizontalSpace(5),
                                        Text(
                                          time,
                                          maxLines: 1,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w800,
                                            overflow: TextOverflow.ellipsis,
                                            fontSize: 15,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                    verticalSpace(5),
                                    Text(
                                      searchModel.articles![index].title ??
                                          "No Title",
                                      maxLines: 2,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Positioned(
                          bottom: 10,
                          right: 10,
                          child: Icon(
                            Ionicons.heart,
                            color: ColorManger.primaryColor,
                          ))
                    ],
                  ),
                );
              },
            ),
          ),
          orElse: () => const Padding(
            padding: EdgeInsets.only(top: 30.0),
            child: Text(
              "Search For News",
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
          ),
        );
      },
    );
  }

  buildSearchLoadingItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Stack(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Container(
                      height: 100,
                      width: 100,
                      color: Colors.grey.withOpacity(0.3),
                    ),
                  ),
                  horizontalSpace(10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(6)),
                                height: 15,
                                width: 100,
                              ),
                            ),
                            horizontalSpace(5),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(6)),
                              height: 15,
                              width: 100,
                            ),
                          ],
                        ),
                        verticalSpace(5),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(6)),
                          height: 15,
                          width: 100,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 10,
              right: 10,
              child: Icon(
                Ionicons.heart,
                color: Colors.grey.withOpacity(0.3),
              ))
        ],
      ),
    );
  }
}
