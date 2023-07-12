import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hungerz_delivery/Account/UI/account_page.dart';
import 'package:hungerz_delivery/Components/bottom_bar.dart';
import 'package:hungerz_delivery/Locale/locales.dart';
import 'package:hungerz_delivery/OrderMap/UI/slide_up_panel.dart';
import 'package:hungerz_delivery/OrderMapBloc/order_map_bloc.dart';
import 'package:hungerz_delivery/OrderMapBloc/order_map_state.dart';
import 'package:hungerz_delivery/Routes/routes.dart';
import 'package:hungerz_delivery/Themes/colors.dart';
import 'package:hungerz_delivery/map_utils.dart';

class NewDeliveryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrderMapBloc>(
      create: (context) => OrderMapBloc()..loadMap(),
      child: NewDeliveryBody(),
    );
  }
}

class NewDeliveryBody extends StatefulWidget {
  @override
  _NewDeliveryBodyState createState() => _NewDeliveryBodyState();
}

class _NewDeliveryBodyState extends State<NewDeliveryBody> {
  Completer<GoogleMapController> _mapController = Completer();
  GoogleMapController? mapStyleController;
  Set<Marker> _markers = {};

  @override
  void initState() {
    rootBundle.loadString('images/map_style.txt').then((string) {
      mapStyle = string;
    });
    super.initState();
  }

  bool isPicked = false;
  bool isAccepted = false;
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    List<String?> itemName = [
      AppLocalizations.of(context)!.sandwich,
      AppLocalizations.of(context)!.chicken,
      AppLocalizations.of(context)!.juice,
    ];
    return Scaffold(
      drawer: Account(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: AppBar(
            title: Text(AppLocalizations.of(context)!.newDeliveryTask!,
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontWeight: FontWeight.w500)),
            actions: <Widget>[
              isAccepted
                  ? Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                      child: TextButton.icon(
                        icon: Icon(
                          isOpen ? Icons.close : Icons.shopping_basket,
                          color: kMainColor,
                          size: 13.0,
                        ),
                        label: Text(
                            isOpen
                                ? AppLocalizations.of(context)!.close!
                                : AppLocalizations.of(context)!.orderInfo!,
                            style:
                                Theme.of(context).textTheme.caption!.copyWith(
                                      fontSize: 11.7,
                                      fontWeight: FontWeight.bold,
                                      color: kMainColor,
                                    )),
                        onPressed: () {
                          setState(() {
                            if (isOpen)
                              isOpen = false;
                            else
                              isOpen = true;
                          });
                        },
                      ),
                    )
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: <Widget>[
              Expanded(
                child: BlocBuilder<OrderMapBloc, OrderMapState>(
                    builder: (context, state) {
                  print('polyyyy' + state.polylines.toString());
                  return GoogleMap(
                    polylines: state.polylines,
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
                            icon: markerss.first,
                          ),
                        );
                        _markers.add(
                          Marker(
                            markerId: MarkerId('mark2'),
                            position:
                                LatLng(37.42496133180663, -122.081743655960),
                            icon: markerss[0],
                          ),
                        );
                        // _markers.add(
                        //   Marker(
                        //     markerId: MarkerId('mark3'),
                        //     position:
                        //         LatLng(37.42196183580660, -122.089743655967),
                        //     icon: markerss[2],
                        //   ),
                        // );
                      });
                    },
                  );
                }),
              ),
              Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    height: 50.0,
                    color: Theme.of(context).cardColor,
                    child: Row(
                      children: [
                        Image.asset(
                          'images/ride.png',
                          color: kMainColor,
                          scale: 1.8,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            '16.5 km ',
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(
                                    fontSize: 11.7,
                                    letterSpacing: 0.06,
                                    color:
                                        Theme.of(context).secondaryHeaderColor,
                                    fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          '(10 min)',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  fontSize: 11.7,
                                  letterSpacing: 0.06,
                                  color: Color(0xffc1c1c1)),
                        ),
                        Spacer(),
                        isAccepted
                            ? TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor:
                                      Theme.of(context).scaffoldBackgroundColor,
                                ),
                                onPressed: () {
                                  /*...*/
                                },
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.navigation,
                                      color: kMainColor,
                                      size: 14.0,
                                    ),
                                    SizedBox(
                                      width: 8.0,
                                    ),
                                    Text(
                                      AppLocalizations.of(context)!.direction!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .copyWith(
                                              color: kMainColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 11.7,
                                              letterSpacing: 0.06),
                                    ),
                                  ],
                                ),
                              )
                            : SizedBox.shrink(),
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(
                              left: 28.0, bottom: 6.0, top: 6.0, right: 10.0),
                          child: Icon(
                            Icons.location_on,
                            size: 14.0,
                            color: kMainColor,
                          )),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              AppLocalizations.of(context)!.store!,
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(
                                      letterSpacing: 0.05,
                                      fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              '1024, Hemiltone Street, USA',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(
                                      fontSize: 11.0, letterSpacing: 0.05),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      // Spacer(),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.0),
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Row(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(
                                  Icons.message,
                                  color: kMainColor,
                                  size: 14.0,
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, PageRoutes.chatPageRestaurant);
                                },
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.phone,
                                  color: kMainColor,
                                  size: 14.0,
                                ),
                                onPressed: () {
                                  /*...........*/
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(
                              left: 28.0, bottom: 12.0, top: 12.0, right: 10.0),
                          child: Icon(
                            Icons.navigation,
                            size: 14.0,
                            color: kMainColor,
                          )),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Sam Smith',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(
                                      letterSpacing: 0.05,
                                      fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              'D-32, Deniel Street, USA',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(
                                      fontSize: 11.0, letterSpacing: 0.05),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.0),
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Row(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(
                                  Icons.message,
                                  color: kMainColor,
                                  size: 14.0,
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, PageRoutes.chatPageUser);
                                },
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.phone,
                                  color: kMainColor,
                                  size: 14.0,
                                ),
                                onPressed: () {
                                  /*...........*/
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  isPicked
                      ? BottomBar(
                          text: AppLocalizations.of(context)!.markDelivered,
                          onTap: () => Navigator.popAndPushNamed(
                              context, PageRoutes.deliverySuccessful))
                      : isAccepted
                          ? BottomBar(
                              text: AppLocalizations.of(context)!.markPicked,
                              onTap: () {
                                setState(() {
                                  isPicked = true;
                                });
                              })
                          : BottomBar(
                              text: AppLocalizations.of(context)!.accept,
                              onTap: () {
                                setState(() {
                                  isAccepted = true;
                                });
                              }),
                ],
              )
            ],
          ),
          isOpen ? OrderInfoContainer(itemName) : SizedBox.shrink(),
        ],
      ),
    );
  }
}
