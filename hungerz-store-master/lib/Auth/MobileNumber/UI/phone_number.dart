// import 'package:buy_this_app/buy_this_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hungerz_store/Locale/locales.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Config/app_config.dart';
import 'mobile_input.dart';

//first page that takes phone number as input for verification
class PhoneNumber extends StatefulWidget {
  static const String id = 'phone_number';

  @override
  _PhoneNumberState createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
  @override
  void initState() {
    super.initState();
    _checkForBuyNow();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        //used for scrolling when keyboard pops up
        child: Container(
          color: Theme.of(context).cardColor,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Spacer(),
              Expanded(
                flex: 3,
                child: Image.asset(
                  "images/logo_restro.png",
                  // scale: 3,
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.bodyText1!,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.bodyText2!,
                    style: TextStyle(color: Colors.grey[900]),
                  ),
                ],
              ),
              Spacer(),
              Expanded(
                flex: 5,
                child: Image.asset(
                  "images/signin hero restro.png", //footer image
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: MobileInput(),
              ),
            ],
          ),
        ),
      ),
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
