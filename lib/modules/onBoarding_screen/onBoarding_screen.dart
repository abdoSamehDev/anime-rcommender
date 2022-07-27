import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../layout/home_screen/home_ screen.dart';
import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import '../../shared/network/local/chache _helper.dart';
import '../../shared/styles/colors.dart';
import '../login_screen/login_screen.dart';

class BoardingModel{
  final String image;
  final String title;
  final String body;

  BoardingModel(
      {
        required this.image,
        required this.title,
        required this.body
      });
}

class OnBoardingScreen extends StatefulWidget {

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'assets/images/logo.png',
      title: 'Title 1',
      body: 'Body 1',
    ),
    BoardingModel(
      image: 'assets/images/logo.png',
      title: 'Title 2',
      body: 'Body 2',
    ),
    BoardingModel(
      image: 'assets/images/logo.png',
      title: 'Title 3',
      body: 'Body 3',
    ),
  ];

  var boardingController = PageController();

  bool isLast = false;
  bool isFirst = false;

  void submit(){
    CacheHelper.setData(key: 'onBoarding', value: true).then((value) {
      print(value);
      if (value!){
        if(token != null){
          navigateAndReplaceTo(context, const HomeScreen());
        }else{
          navigateAndReplaceTo(context, LoginScreen());
        }

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // var cubit = LoginScreenCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: (){submit();},
            child: const Text(
              'SKIP',
              style: TextStyle(
                fontSize: 16
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: boardingController,
                physics: const BouncingScrollPhysics(),
                onPageChanged: (int index){
                  if(index == boarding.length - 1){
                    setState((){
                      isLast = true;
                    });
                  }
                  else if(index < boarding.length - 1){
                    setState((){
                      isLast = false;
                    });
                  }
                  if(index == 0){
                    setState((){
                      isFirst = true;
                    });
                  }
                  else if (index >0){
                    isFirst = false;
                  }
                },
                itemBuilder: (context, index) =>buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                FloatingActionButton(
                  heroTag: 'back button',
                  onPressed: (){
                    if(isFirst == false)
                    {
                      boardingController.previousPage(duration: const Duration(
                        milliseconds: 750
                    ),
                        curve: Curves.fastLinearToSlowEaseIn
                    );
                    }
                  },
                  child: const Icon(
                      Icons.arrow_back_ios),
                ),
                const Spacer(),
                SmoothPageIndicator(

                  controller: boardingController,
                  count: boarding.length,
                  effect: WormEffect(
                    activeDotColor: defaultLightColor,
                    dotColor: Colors.grey,
                    dotWidth: 10,
                    dotHeight: 10,
                    spacing: 12,
                    paintStyle: PaintingStyle.stroke,
                    strokeWidth: 2,
                  )
                ),
                const Spacer(),
                FloatingActionButton(
                  heroTag: 'forward button',
                  onPressed: (){
                    if (isLast){
                      submit();
                    }
                    else {
                      boardingController.nextPage(duration: const Duration(
                          milliseconds: 750
                      ),
                          curve: Curves.fastLinearToSlowEaseIn
                      );
                    }
                  },
                  child: const Icon(
                      Icons.arrow_forward_ios_rounded),
                ),
              ],
            )
          ],
        )
      ),
    );
  }

  Widget buildBoardingItem (BoardingModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image(
            image: AssetImage(model.image),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          model.title,
          style: const TextStyle(
              fontSize: 24,
              color: Colors.black,
              fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          model.body,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
