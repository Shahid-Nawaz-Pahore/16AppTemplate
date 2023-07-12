// import 'package:buy_this_app/buy_this_app.dart';
import 'package:flutter/material.dart';
import 'package:hungerz/Chat/UI/animated_bottom_bar.dart';
import 'package:hungerz/Config/app_config.dart';
import 'package:hungerz/HomeOrderAccount/Account/UI/account_page.dart';
import 'package:hungerz/HomeOrderAccount/Home/UI/home.dart';
import 'package:hungerz/HomeOrderAccount/Order/UI/order_page.dart';
import 'package:hungerz/Locale/locales.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeOrderAccount extends StatefulWidget {
  final int index;
  HomeOrderAccount([this.index = 0]);
  @override
  _HomeOrderAccountState createState() => _HomeOrderAccountState();
}

class _HomeOrderAccountState extends State<HomeOrderAccount> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.index;
    _checkForBuyNow();
  }

  // void onTapped(int index) {
  //   setState(() {
  //     _currentIndex = index;
  //   });
  // }

  static String bottomIconHome = 'images/footermenu/ic_home.png';

  static String bottomIconOrder = 'images/footermenu/ic_orders.png';

  static String bottomIconAccount = 'images/footermenu/ic_profile.png';

  @override
  Widget build(BuildContext context) {
    var appLocalization = AppLocalizations.of(context)!;
    final List<BarItem> barItems = [
      BarItem(
        text: appLocalization.homeText,
        image: bottomIconHome,
      ),
      BarItem(
        text: "Orders",
        image: bottomIconOrder,
      ),
      BarItem(
        text: "Account",
        image: bottomIconAccount,
      ),
    ];

    final List<Widget> _children = [
      HomePage(),
      OrderPage(),
      AccountPage(),
    ];
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: AnimatedBottomBar(
          barItems: barItems,
          onBarTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          }),
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
