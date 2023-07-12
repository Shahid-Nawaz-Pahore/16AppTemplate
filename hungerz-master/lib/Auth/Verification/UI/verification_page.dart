import 'dart:async';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:hungerz/Components/bottom_bar.dart';
import 'package:hungerz/Components/textfield.dart';
import 'package:hungerz/Locale/locales.dart';

//Verification page that sends otp to the phone number entered on phone number page
class VerificationPage extends StatelessWidget {
  final VoidCallback onVerificationDone;

  VerificationPage(this.onVerificationDone);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          AppLocalizations.of(context)!.verification!,
          style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 18),
        ),
      ),
      body: FadedSlideAnimation(
        child: OtpVerify(onVerificationDone),
        beginOffset: Offset(0.0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}

//otp verification class
class OtpVerify extends StatefulWidget {
  final VoidCallback onVerificationDone;

  OtpVerify(this.onVerificationDone);

  @override
  _OtpVerifyState createState() => _OtpVerifyState();
}

class _OtpVerifyState extends State<OtpVerify> {
  final TextEditingController _controller = TextEditingController();

  // VerificationBloc _verificationBloc;
  bool isDialogShowing = false;
  int _counter = 20;
  late Timer _timer;

  _startTimer() {
    //shows timer
    _counter = 20; //time counter

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _counter > 0 ? _counter-- : _timer.cancel();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    verifyPhoneNumber();
  }

  void verifyPhoneNumber() {
    //verify phone number method using otp
    _startTimer();
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height -
                AppBar().preferredSize.height -
                80,
            margin: EdgeInsets.only(bottom: 150),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Divider(
                  color: Theme.of(context).cardColor,
                  thickness: 8.0,
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    AppLocalizations.of(context)!.enterVerification!,
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontSize: 22,
                        color: Theme.of(context).secondaryHeaderColor),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  // child: EntryField(
                  //  // controller: _controller,
                  //   readOnly: false,
                  //   label: AppLocalizations.of(context).verificationCode,
                  //   maxLength: 6,
                  //   keyboardType: TextInputType.number,
                  //   initialValue: '123456',
                  // ),
                  child: EntryField(
                      AppLocalizations.of(context)!.verificationCode,
                      '5 7 9 6 4 4'),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        '00:$_counter min',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                    TextButton(
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(side: BorderSide.none),
                          padding: EdgeInsets.all(24.0),
                        ),
                        child: FadedScaleAnimation(
                          child: Text(
                            AppLocalizations.of(context)!.resend!,
                            style: TextStyle(
                              fontSize: 16.7,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          fadeDuration: Duration(milliseconds: 800),
                        ),
                        onPressed: _counter < 1
                            ? () {
                                verifyPhoneNumber();
                              }
                            : null),
                  ],
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: BottomBar(
              text: AppLocalizations.of(context)!.continueText,
              onTap: () {
                widget.onVerificationDone();
              }),
        ),
      ],
    );
  }
}
