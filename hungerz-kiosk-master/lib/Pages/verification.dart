import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:hungerz_kiosk/Components/textfield.dart';
import 'package:hungerz_kiosk/Pages/landingPage.dart';
import 'package:hungerz_kiosk/Locale/locales.dart';

class Verification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("0:20 min",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 20, color: Colors.grey[800])),
          ),
        ],
      ),
      body: FadedSlideAnimation(
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height -
                    AppBar().preferredSize.height -
                    MediaQuery.of(context).padding.top -
                    90,
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 20,
                          child: IconButton(
                              padding: EdgeInsets.zero,
                              icon: Icon(Icons.chevron_left),
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          locale.enterVerificationCode!,
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 16,
                              color: Colors.blueGrey.shade700,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          locale.sentOnNumber!,
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 16,
                              color: Colors.blueGrey.shade700,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(locale.enterVerificationCode!,
                                style: TextStyle(
                                  color: Colors.grey[600],
                                )),
                          ],
                        ),
                        EntryField("5 7 8 4 1 0")
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LandingPage(),
                      ));
                },
                child: Container(
                  alignment: Alignment.bottomCenter,
                  height: 90,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(10)),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Theme.of(context).primaryColor,
                        Colors.white,
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 25),
                    child: Text(
                      locale.submit!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 20),
                    ),
                  ),
                ),
              )
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
