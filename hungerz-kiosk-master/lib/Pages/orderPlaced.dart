import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:hungerz_kiosk/Pages/landingPage.dart';
import 'package:hungerz_kiosk/Locale/locales.dart';

class OrderPlaced extends StatefulWidget {
  @override
  _OrderPlacedState createState() => _OrderPlacedState();
}

class _OrderPlacedState extends State<OrderPlaced> {
  @override
  // void initState() {
  //   super.initState();
  //   Future.delayed(Duration(seconds: 5), () {
  //     Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => LandingPage(),
  //         ));
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: FadedSlideAnimation(
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    locale.weMustSay!,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    locale.youveGreat!,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 20),
                  ),
                  Text(
                    locale.choiceoOfTaste!,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 20),
                  ),
                ],
              ),
              Spacer(),
              FadedScaleAnimation(
                Container(
                  width: 250,
                  child: Image(
                    image: AssetImage("assets/order confirmed.png"),
                  ),
                ),
                durationInMilliseconds: 600,
              ),
              Spacer(),
              Column(
                children: [
                  Text(
                    locale.yourOrderNumberIs!,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontSize: 20,
                        letterSpacing: 2,
                        color: Colors.blueGrey.shade700),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "23",
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontSize: 50,
                        letterSpacing: 3,
                        color: Colors.blueGrey.shade700),
                  ),
                ],
              ),
              Spacer(),
              Column(
                children: [
                  Text(
                    locale.payAtCounterWhen!,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 13),
                  ),
                  Text(
                    locale.yourOrderWillBeReady!,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 13),
                  ),
                ],
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LandingPage(),
                      ));
                },
                child: Text("Home",
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontSize: 20,
                        letterSpacing: 2,
                        color: Theme.of(context).primaryColor)),
              ),
              Spacer(),
            ],
          ),
        ),
        beginOffset: Offset(0.0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
