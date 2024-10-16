import 'package:flutter/material.dart';
import 'package:news_app/core/local_cache/cache_helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/theming/color_manger.dart';
import '../layout/presentation/screens/layout_screen.dart';
import 'model/on_boarding_model.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var pageController = PageController();
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Container(
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(list[index].image), fit: BoxFit.fill),
              ),
            ),
            const SizedBox(
              height: 30,
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
                  activeDotColor: ColorManger.primaryColor,
                  dotColor: Colors.black12,
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Center(
                child: Text(
              list[index].title,
              style:
                  const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            )),
            const SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                list[index].description,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const Spacer(),
            if (isLast == false)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          CacheHelper.setData(key: 'onBoarding', value: true)
                              .then((value) {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LayoutScreen()),
                                (route) => false);
                          });
                        },
                        child: const Text(
                          'skip',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: ColorManger.primaryColor),
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
                        backgroundColor:
                            ColorManger.primaryColor.withOpacity(0.8),
                        elevation: 0.0,
                        child: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: ColorManger.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            if (isLast == true)
              Center(
                child: SizedBox(
                  width: 150,
                  height: 50,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: ColorManger.primaryColor,
                    onPressed: () {
                      CacheHelper.setData(key: 'onBoarding', value: true).then(
                        (value) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LayoutScreen()),
                              (route) => false);
                        },
                      );
                    },
                    child: const Text(
                      'Get Started',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                ),
              ),
            const SizedBox(
              height: 20.0,
            ),
          ],
        );
      },
    ));
  }
}
