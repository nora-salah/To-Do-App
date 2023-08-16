import 'package:todo_app/templets/app_asset.dart';
import 'package:todo_app/templets/strings.dart';

class OnBoardingModal {
  final String img;
  final String title;
  final String subTitle;

  OnBoardingModal(
      {required this.img, required this.title, required this.subTitle});

  static List<OnBoardingModal> OnBoardingOne = [
    OnBoardingModal(
        img: AppAssets.On1,
        title: AppString.OnBoardingTitleone,
        subTitle: AppString.OnBoardingSubTitleone),
    OnBoardingModal(
        img: AppAssets.On2,
        title: AppString.OnBoardingTitleTwo,
        subTitle: AppString.OnBoardingSubTitleTwo),
    OnBoardingModal(
        img: AppAssets.On3,
        title: AppString.OnBoardingTitleThree,
        subTitle: AppString.OnBoardingSubTitleThree)
  ];
}













/*class onBoarding{

  String t1;
  String t2;
  String t3;
  onBoarding({required this.t1,required this.t2,required this.t3});
  static List<onBoarding> OnBoardingone=[

    onBoarding(
      t1: AppString.AppName,
      t2: AppString.addtask,
      t3: AppString.AppName,
    ),
    onBoarding(
      t1: AppString.AppName,
      t2: AppString.addtask,
      t3: AppString.AppName,
    ),onBoarding(
      t1: AppString.AppName,
      t2: AppString.addtask,
      t3: AppString.AppName,
    ),
  ];

}*/
