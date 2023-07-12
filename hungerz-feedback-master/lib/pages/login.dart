import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:hungerz_feedback/Components/colorButton.dart';
import 'package:hungerz_feedback/Components/textfield.dart';
import 'package:hungerz_feedback/Locale/locales.dart';
import 'package:hungerz_feedback/pages/verification.dart';

class LoginUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      body: FadedSlideAnimation(
        SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                SizedBox(
                  height: 70,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      locale.enterRegistered!,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 16,
                          color: Colors.blueGrey.shade700,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      locale.phoneNumberToStart!,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 16,
                          color: Colors.blueGrey.shade700,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    Icon(
                      Icons.phone_android,
                      color: Theme.of(context).primaryColor,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(locale.phoneNumber!,
                        style: TextStyle(color: Colors.grey[600]))
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(left: 35),
                  child: Column(
                    children: [
                      EntryField("+1 984 596 4521"),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            locale.wellSendCode!,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Verification()));
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 35),
                    child: Row(
                      children: [
                        ColorButton(locale.continueText),
                      ],
                    ),
                  ),
                ),
                Spacer()
              ],
            ),
          ),
        ),
        beginOffset: Offset(0.0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
