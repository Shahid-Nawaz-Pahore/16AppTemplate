import 'package:animation_wrappers/animation_wrappers.dart';
// import 'package:buy_this_app/buy_this_app.dart';
import 'package:flutter/material.dart';
import 'package:hungerz_feedback/Components/colorButton.dart';
import 'package:hungerz_feedback/Locale/locales.dart';
import 'package:hungerz_feedback/pages/login.dart';
import 'package:hungerz_feedback/pages/questionPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Config/app_config.dart';

class HomePage extends StatefulWidget {
  final int tableOrdersDelivered = 0;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _checkForBuyNow();
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      body: FadedSlideAnimation(
        Container(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  GestureDetector(
                    onDoubleTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => LoginUi()));
                    },
                    child: FadedScaleAnimation(
                      RichText(
                        text: TextSpan(
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(
                                    letterSpacing: 2,
                                    fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'HUNGERZ',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20)),
                              TextSpan(
                                  text: 'REVIEW',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 20)),
                            ]),
                      ),
                      durationInMilliseconds: 600,
                    ),
                  ),
                ],
              ),
              Spacer(),
              FadedScaleAnimation(
                Row(
                  children: [
                    Text(locale.giveYour!,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(letterSpacing: 1, fontSize: 25)),
                    SizedBox(
                      width: 5,
                    ),
                    Text(locale.feedback!,
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            letterSpacing: 1,
                            fontSize: 25,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                durationInMilliseconds: 600,
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(locale.yourWordMeansALot!,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(letterSpacing: 2, color: Colors.grey)),
                ],
              ),
              Spacer(),
              Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    QuestionPage(locale.howWas)));
                      },
                      child: FadedScaleAnimation(
                        ColorButton(locale.bringItOn),
                        durationInMilliseconds: 600,
                      )),
                ],
              ),
              Expanded(
                  flex: 5,
                  // height: MediaQuery.of(context).size.height * 0.35,
                  child: Image(image: AssetImage("assets/Layer 15.png"))),
            ],
          ),
        ),
        beginOffset: Offset(0.0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
      //  floatingActionButton: AppConfig.isDemoMode
      //     ? BuyThisApp.button(
      //         AppConfig.appName,
      //         'https://dashboard.vtlabs.dev/projects/envato-referral-buy-link?project_slug=hungerz_flutter',
      //       )
      //     : null,
      // bottomNavigationBar: AppConfig.isDemoMode
      //     ? Container(
      //         padding: const EdgeInsets.all(8),
      //         child:
      //             // BuyThisApp.developerRowOpusDark(
      //             //     Colors.transparent, Theme.of(context).primaryColorLight)
      //             BuyThisApp.developerRowOpus(
      //                 Colors.transparent, Theme.of(context).primaryColor),
      //       )
      //     : const SizedBox.shrink(),
    );
  }

  void _checkForBuyNow() async {
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // if (!sharedPreferences.containsKey("key_buy_this_shown") &&
    //     AppConfig.isDemoMode) {
    //   Future.delayed(Duration(seconds: 10), () async {
    //     if (mounted) {
    //       BuyThisApp.showSubscribeDialog(context);
    //       sharedPreferences.setBool("key_buy_this_shown", true);
    //     }
    //   });
    // }
  }
}
