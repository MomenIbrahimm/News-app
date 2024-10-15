import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/core/helpers/spacing.dart';
import 'package:news_app/core/widgets/custom_text.dart';
import 'package:news_app/core/widgets/webview_screen.dart';

import '../../../../core/theming/color_manger.dart';
import '../../../business/data/model/news_model.dart';
import '../../../layout/presentation/logic/cubit.dart';

class DetailsScreen extends StatelessWidget {
  final Articles model;

  const DetailsScreen({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    String? time =
        DateFormat.yMMMd().format(DateTime.parse(model.publishedAt!));
    return Scaffold(
      backgroundColor: AppCubit.get(context).isSwitch
          ? ColorManger.black
          : ColorManger.white,
      body: Padding(
        padding: const EdgeInsets.only(
          right: 15.0,
          left: 15.0,
          top: 50.0,
          bottom: 10.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(model.urlToImage ?? ""),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: CircleAvatar(
                        backgroundColor:
                            ColorManger.primaryColor.withOpacity(0.5),
                        child: const Icon(
                          Icons.arrow_back,
                          color: ColorManger.white,
                        )),
                  )
                ],
              ),
              verticalSpace(20.0),

              Text(
                model.title ?? "No Title",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              verticalSpace(20),
              Row(
                children: [
                  const CircleAvatar(
                    radius: 16.0,
                    backgroundImage: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVuTT1vhyh16roQWY_cEzcNmXDK1dshKllA&s"),
                  ),
                  horizontalSpace(5),
                  Expanded(
                    child: Text(
                      model.author ?? "Unknown",
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Text(
                    time,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
              verticalSpace(10),
              //defaultText(title != null ? 'Title: $title' : 'Title: Unknown'),
              verticalSpace(10),
              customText(model.description != null
                  ? 'Description: ${model.description}'
                  : 'Description: Unknown'),
              verticalSpace(10),

              if (model.content != null) customText(model.content),
              verticalSpace(10),

              if (model.url != null)
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WebviewScreen(model.url),
                      ),
                    );
                  },
                  child: Text(
                    'Visit Link: ${model.url}',
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
