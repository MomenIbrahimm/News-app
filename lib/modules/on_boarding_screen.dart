import 'package:flutter/material.dart';
import 'package:news_app/layout/layout_screen.dart';
import 'package:news_app/share/network/remote/cache_helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../models/on_boarding_model.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var pageController = PageController();
  bool isLast = false;

  List<OnBoardingModel> list = [
    OnBoardingModel(
      'ARTICLE',
      'Sports journalism is a form of writing that reports on matters pertaining to sporting topics and competitions. Sports journalism started in the early 1800s when it was targeted to the social elite and transitioned into an integral part of the news business with newspapers having dedicated sports sections. ',
      'assets/image1.jpg',
    ),
    OnBoardingModel(
      'ARTICLE',
      'Sports journalism is a form of writing that reports on matters pertaining to sporting topics and competitions. Sports journalism started in the early 1800s when it was targeted to the social elite and transitioned into an integral part of the news business with newspapers having dedicated sports sections. ',
      'assets/image2.jpg',
    ),
    OnBoardingModel(
      'ARTICLE',
      'Sports journalism is a form of writing that reports on matters pertaining to sporting topics and competitions. Sports journalism started in the early 1800s when it was targeted to the social elite and transitioned into an integral part of the news business with newspapers having dedicated sports sections. ',
      'assets/images.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white10,
          elevation: 0.0,
        ),
        body: PageView.builder(
          itemCount: list.length,
          controller: pageController,
          reverse: false,
          onPageChanged: (index) {
            if (index == list.length - 1) {
              setState(() {
                isLast = true;
              });
            } else {
              setState(() {
                isLast = false;
              });
            }
          },
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(list[index].image)),
                      ),
                    ),
                  ),
                ),
                Center(
                    child: Text(
                  list[index].title,
                  style: const TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.bold),
                )),
                const SizedBox(
                  height: 30.0,
                ),
                Center(
                  child: SmoothPageIndicator(
                      controller: pageController,
                      axisDirection: Axis.horizontal,
                      count: list.length,
                      effect: const WormEffect(
                          dotHeight: 10.0,
                          dotWidth: 20.0,
                          radius: 20,
                          spacing: 5.0,
                          activeDotColor: Colors.blueGrey,
                          dotColor: Colors.black12)),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    list[index].description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                if (isLast == false)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        TextButton(
                            onPressed: () {
                              CacheHelper.setData(
                                      key: 'onBoarding', value: true)
                                  .then((value) {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LayoutScreen()),
                                        (route) => false);
                              });
                            },
                            child: const Text(
                              'skip',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            )),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FloatingActionButton(
                            onPressed: () {
                              pageController.nextPage(
                                duration: const Duration(milliseconds: 700),
                                curve: Curves.fastOutSlowIn,
                              );
                            },
                            child: const Icon(Icons.arrow_forward_ios_rounded),
                          ),
                        ),
                      ],
                    ),
                  ),
                if (isLast == true)
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Container(
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Theme.of(context).primaryColor,
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            CacheHelper.setData(key: 'onBoarding', value: true)
                                .then((value) {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LayoutScreen()),
                                  (route) => false);
                            });
                          },
                          child: const Text(
                            'Get Started',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.0),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
        ));
  }
}
