import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:hungerz/Components/bottom_bar.dart';
import 'package:hungerz/Locale/locales.dart';
import 'package:hungerz/Routes/routes.dart';
import 'package:hungerz/Themes/colors.dart';

class OrderPlaced extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadedSlideAnimation(
        child: Column(
          children: <Widget>[
            Spacer(),
            Expanded(
              flex: 3,
              child: FadedScaleAnimation(
                child: Image.asset(
                  'images/order_placed.png',
                ),
                fadeDuration: Duration(milliseconds: 800),
              ),
            ),
            Spacer(),
            Text(
              AppLocalizations.of(context)!.placed!,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontSize: 23.3),
            ),
            Text(
              AppLocalizations.of(context)!.thanks!,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(color: kDisabledColor, fontSize: 18),
            ),
            Spacer(
                // flex: 2,
                ),
            BottomBar(
              text: AppLocalizations.of(context)!.orderText,
              onTap: () => Navigator.pushNamed(context, PageRoutes.orderPage),
            )
          ],
        ),
        beginOffset: Offset(0.0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
