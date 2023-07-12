import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:hungerz_feedback/Components/colorButton.dart';
import 'package:hungerz_feedback/Components/reviewScale.dart';
import 'package:hungerz_feedback/Locale/locales.dart';
import 'package:hungerz_feedback/pages/submitReview.dart';

class QuestionPage extends StatefulWidget {
  final String? question;
  QuestionPage(this.question);
  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      body: FadedSlideAnimation(
        Container(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              RichText(
                text: TextSpan(
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        letterSpacing: 2, fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'HUNGERZ',
                          style: TextStyle(color: Colors.black)),
                      TextSpan(
                          text: 'REVIEW',
                          style:
                              TextStyle(color: Theme.of(context).primaryColor)),
                    ]),
              ),
              Spacer(),
              FadedScaleAnimation(
                Text(
                  widget.question!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(letterSpacing: 0.5, fontSize: 20),
                ),
                durationInMilliseconds: 600,
              ),
              Spacer(),
              Center(child: ReviewScale()),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    locale.cancel!,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 15,
                        letterSpacing: 2,
                        color: Theme.of(context).primaryColor),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SubmitReview()));
                      },
                      child: FadedScaleAnimation(
                        ColorButton("NEXT"),
                        durationInMilliseconds: 600,
                      ))
                ],
              ),
              Spacer()
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
