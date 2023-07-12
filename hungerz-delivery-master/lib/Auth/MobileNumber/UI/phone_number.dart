import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungerz_delivery/Auth/MobileNumber/UI/mobile_input.dart';
import 'package:hungerz_delivery/Locale/locales.dart';

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
              Image.asset(
                "images/logo_del.png",
                scale: 4, //delivoo logo
              ),
              SizedBox(
                height: 40,
              ),
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
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
              Spacer(),
              Image.asset("images/login_delivery.png"),
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
}
