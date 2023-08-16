import 'package:todo_app/reusable/custom_elevated_btn.dart';
import 'package:todo_app/reusable/custom_txt_btn.dart';
import 'package:todo_app/templets/on_boarding_model.dart';
import 'package:todo_app/templets/strings.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../reusable/navigation.dart';
import 'colors.dart';

class OnBoardingOne extends StatelessWidget {
  OnBoardingOne({Key? key}) : super(key: key);
  PageController controller = new PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: PageView.builder(
          itemCount: 3,
          controller: controller,
          itemBuilder: (context, index) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: CustomTextButton(
                        title: AppString.skip,
                        onPressed: () {
                          controller.jumpToPage(2);
                        },
                      )

                      /*TextButton(
                        onPressed: () {
                           controller.jumpToPage(2);
                        },
                        child: Text(AppString.skip,
                          style: Theme.of(context).textTheme.displaySmall,
                        )),*/

                      ),
                  const SizedBox(
                    height: 16,
                  ),
                  //Image.asset(AppAsset.on1),
                  Image.asset(
                    OnBoardingModal.OnBoardingOne[index].img,
                  ),

                  SmoothPageIndicator(
                      controller: controller, // PageController
                      count: 3,
                      effect: const ExpandingDotsEffect(
                          activeDotColor:
                              AppColors.Primary), // your preferred effect
                      onDotClicked: (index) {}),

                  const SizedBox(
                    height: 16,
                  ),

                  Text(
                    OnBoardingModal.OnBoardingOne[index].title,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    OnBoardingModal.OnBoardingOne[index].subTitle,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      index != 0
                          ? CustomTextButton(
                              title: AppString.back,
                              onPressed: () {
                                controller.nextPage(
                                    duration: Duration(milliseconds: 1000),
                                    curve: Curves.fastLinearToSlowEaseIn);
                              },
                            )
                          /*TextButton(
                              onPressed: () {},
                              child: Text(AppString.back,
                                  style:
                                      Theme.of(context).textTheme.displaySmall),
                            )*/
                          : Container(),
                      const Spacer(),
                      index != 2
                          ? CustomElevatedBtn(
                              text: AppString.next,
                              onPRessed: () {
                                controller.nextPage(
                                    duration: Duration(milliseconds: 1000),
                                    curve: Curves.fastLinearToSlowEaseIn);
                              },
                            )
                          : CustomElevatedBtn(
                              text: AppString.getStarted,
                              onPRessed: () {
                                navigate(context: context, screen: HomeScreen());
                              },
                            )
                      /* ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => HomeScreen()));
                              },
                              style: Theme.of(context).elevatedButtonTheme.style,
                              child: const Text(AppString.getStarted),
                            ),*/
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
