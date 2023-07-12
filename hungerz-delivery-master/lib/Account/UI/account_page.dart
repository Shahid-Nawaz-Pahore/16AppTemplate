import 'dart:async';

// import 'package:buy_this_app/buy_this_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hungerz_delivery/Components/list_tile.dart';
import 'package:hungerz_delivery/Locale/locales.dart';
import 'package:hungerz_delivery/OrderMapBloc/order_map_bloc.dart';
import 'package:hungerz_delivery/OrderMapBloc/order_map_state.dart';
import 'package:hungerz_delivery/Routes/routes.dart';
import 'package:hungerz_delivery/Themes/colors.dart';
import 'package:hungerz_delivery/map_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Config/app_config.dart';
import '../../theme_cubit.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  String? number;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    late ThemeCubit _themeCubit;
    _themeCubit = BlocProvider.of<ThemeCubit>(context);
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            child: UserDetails(),
            height: 200.0,
          ),
          Divider(
            color: Theme.of(context).cardColor,
            thickness: 5.0,
          ),
          BuildListTile(
              image: 'images/account/ic_menu_home.png',
              text: AppLocalizations.of(context)!.homeText,
              onTap: () =>
                  Navigator.popAndPushNamed(context, PageRoutes.accountPage)),
          BuildListTile(
              image: 'images/account/ic_menu_insight.png',
              text: AppLocalizations.of(context)!.insight,
              onTap: () =>
                  Navigator.popAndPushNamed(context, PageRoutes.insightPage)),
          BuildListTile(
            image: 'images/account/ic_menu_wallet.png',
            text: AppLocalizations.of(context)!.wallet,
            onTap: () =>
                Navigator.popAndPushNamed(context, PageRoutes.walletPage),
          ),
          BuildListTile(
              image: 'images/account/ic_menu_tncact.png',
              text: AppLocalizations.of(context)!.tnc,
              onTap: () =>
                  Navigator.popAndPushNamed(context, PageRoutes.tncPage)),
          BuildListTile(
              image: 'images/account/ic_menu_supportact.png',
              text: AppLocalizations.of(context)!.support,
              onTap: () => Navigator.popAndPushNamed(
                  context, PageRoutes.supportPage,
                  arguments: number)),
          BuildListTile(
            image: 'images/account/ic_menu_setting.png',
            text: AppLocalizations.of(context)!.settings,
            onTap: () => Navigator.popAndPushNamed(context, PageRoutes.setting),
          ),
          LogoutTile(),
          // if (AppConfig.isDemoMode)
          //   BuyThisApp.button(
          //     AppConfig.appName,
          //     'https://dashboard.vtlabs.dev/projects/envato-referral-buy-link?project_slug=hungerz_flutter',
          //   ),
          // if (AppConfig.isDemoMode)
          //   Divider(
          //     color: Theme.of(context).cardColor,
          //     thickness: 5.0,
          //   ),
          // if (AppConfig.isDemoMode)
          //   _themeCubit.isDark
          //         ? BuyThisApp.developerRowOpusDark(
          //             Colors.transparent, Theme.of(context).primaryColorLight)
          //         : BuyThisApp.developerRowOpus(
          //             Colors.transparent, Theme.of(context).secondaryHeaderColor),
        ],
      ),
    );
  }
}

class DrawerItem {
  String title;
  String image;

  DrawerItem(this.title, this.image);
}

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrderMapBloc>(
      create: (context) => OrderMapBloc()..loadMap(),
      child: AccountBody(),
    );
  }
}

class AccountBody extends StatefulWidget {
  @override
  _AccountBodyState createState() => _AccountBodyState();
}

class _AccountBodyState extends State<AccountBody> {
  bool isoffline = false;
  Completer<GoogleMapController> _mapController = Completer();
  GoogleMapController? mapStyleController;
  Set<Marker> _markers = {};

  @override
  void initState() {
    rootBundle.loadString('images/map_style.txt').then((string) {
      mapStyle = string;
    });
    super.initState();
    _checkForBuyNow();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: AppBar(
            iconTheme: IconThemeData(color: kMainColor),
            title: Text(
                isoffline
                    ? AppLocalizations.of(context)!.offlineText!
                    : AppLocalizations.of(context)!.onlineText!,
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontWeight: FontWeight.w500)),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: isoffline
                    ? TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: kMainColor,
                        ),
                        onPressed: () {
                          setState(() {
                            isoffline = false;
                          });

                          //Navigator.popAndPushNamed(context, PageRoutes.accountPage);
                        },
                        child: Text(
                          AppLocalizations.of(context)!.goOnline!,
                          style: Theme.of(context).textTheme.caption!.copyWith(
                              color: kWhiteColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 11.7,
                              letterSpacing: 0.06),
                        ),
                      )
                    : TextButton(
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Color(0xffff3939))),
                          backgroundColor: Color(0xffff3939),
                        ),
                        onPressed: () {
                          setState(() {
                            isoffline = true;
                          });

                          // Navigator.popAndPushNamed(context, PageRoutes.offlinePage);
                        },
                        child: Text(
                          AppLocalizations.of(context)!.goOffline!,
                          style: Theme.of(context).textTheme.caption!.copyWith(
                              color: kWhiteColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 11.7,
                              letterSpacing: 0.06),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
      drawer: Account(),
      body: isoffline
          ? Stack(
              children: <Widget>[
                BlocBuilder<OrderMapBloc, OrderMapState>(
                    builder: (context, state) {
                  print('polyyyy' + state.polylines.toString());
                  return GoogleMap(
                    // polylines: state.polylines,
                    mapType: MapType.normal,
                    initialCameraPosition: kGooglePlex,
                    markers: _markers,
                    onMapCreated: (GoogleMapController controller) async {
                      _mapController.complete(controller);
                      mapStyleController = controller;
                      mapStyleController!.setMapStyle(mapStyle);
                      setState(() {
                        _markers.add(
                          Marker(
                            markerId: MarkerId('mark1'),
                            position:
                                LatLng(37.42796133580664, -122.085749655962),
                            icon: markerss[1],
                          ),
                        );
                      });
                    },
                  );
                }),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    margin: EdgeInsets.all(20.0),
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              '64',
                              style: Theme.of(context).textTheme.headline4,
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              AppLocalizations.of(context)!.orders!,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff6a6c74)),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              '68 km',
                              style: Theme.of(context).textTheme.headline4,
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              AppLocalizations.of(context)!.ride!,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff6a6c74)),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              '\$302.50',
                              style: Theme.of(context).textTheme.headline4,
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              AppLocalizations.of(context)!.earnings!,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff6a6c74)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          : BlocBuilder<OrderMapBloc, OrderMapState>(builder: (context, state) {
              print('polyyyy' + state.polylines.toString());
              return GoogleMap(
                // polylines: state.polylines,
                mapType: MapType.normal,
                initialCameraPosition: kGooglePlex,
                markers: _markers,
                onMapCreated: (GoogleMapController controller) async {
                  _mapController.complete(controller);
                  mapStyleController = controller;
                  mapStyleController!.setMapStyle(mapStyle);
                  setState(() {
                    _markers.add(
                      Marker(
                        markerId: MarkerId('mark1'),
                        position:
                        LatLng(37.42796133580664, -122.085749655962),
                        icon: markerss[1],
                      ),
                    );
                  });
                },
              );
            }),
      floatingActionButton: isoffline
          ? null
          : FloatingActionButton(
              backgroundColor: kMainColor,
              child: Icon(Icons.list),
              onPressed: () =>
                  Navigator.pushNamed(context, PageRoutes.newDeliveryPage),
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

class LogoutTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BuildListTile(
      image: 'images/account/ic_menu_logoutact.png',
      text: AppLocalizations.of(context)!.logout,
      onTap: () {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(AppLocalizations.of(context)!.loggingOut!),
                content: Text(AppLocalizations.of(context)!.areYouSure!),
                actions: <Widget>[
                  TextButton(
                    child: Text(
                      AppLocalizations.of(context)!.no!,
                      style: TextStyle(
                        color: kMainColor,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: kTransparentColor)),
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: kTransparentColor)),
                      ),
                      child: Text(
                        AppLocalizations.of(context)!.yes!,
                        style: TextStyle(
                          color: kMainColor,
                        ),
                      ),
                      onPressed: () {
                        Phoenix.rebirth(context);
                      })
                ],
              );
            });
      },
    );
  }
}

class UserDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              radius: 32.0,
              backgroundImage: AssetImage('images/profile.jpg'),
            ),
            SizedBox(
              width: 20.0,
            ),
            InkWell(
              onTap: () => Navigator.pushNamed(context, PageRoutes.editProfile),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('\n' + 'George Anderson',
                      style: Theme.of(context).textTheme.bodyText1),
                  Text('\n' + '+1 987 654 3210',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(color: Color(0xff9a9a9a))),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text('deliveryman@email.com',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(color: Color(0xff9a9a9a))),
                ],
              ),
            ),
          ],
        ));
  }
}
