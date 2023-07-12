import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:hungerz/HomeOrderAccount/Home/Models/category.dart';
import 'package:hungerz/HomeOrderAccount/Home/UI/Stores/stores.dart';
import 'package:hungerz/Pages/items.dart';
import 'package:hungerz/Locale/locales.dart';
import 'package:hungerz/Routes/routes.dart';
import 'package:hungerz/Themes/colors.dart';

import 'booking_row.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Home();
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final banner = [
      'images/Banners/Banner 2.png',
      'images/Banners/Banner 1.png',
    ];
    final List<Category> categories = [
      Category('images/Categories/ic_fastfood.png',
          AppLocalizations.of(context)!.fast),
      Category('images/Categories/ic_Seafood.png',
          AppLocalizations.of(context)!.sea),
      Category('images/Categories/ic_chinese.png',
          AppLocalizations.of(context)!.chinese),
      Category('images/Categories/ic_dessert.png',
          AppLocalizations.of(context)!.desert),
    ];
    String value = "New York, USA";

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: FadedScaleAnimation(
            child: Icon(Icons.location_on, color: kMainColor),
            fadeDuration: Duration(milliseconds: 200),
          ),
        ),
        title: Container(
          child: Row(
            children: [
              Text(
                value,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontSize: 15, color: Colors.grey[500]),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, PageRoutes.locationPage);
                },
                icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey[500]),
              )
            ],
          ),
        ),
        // DropdownButton(
        //   value: value,
        //   icon: Icon(Icons.keyboard_arrow_down, color: Colors.blueGrey),
        //   iconSize: 24.0,
        //   elevation: 16,
        //   style: Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 15),
        //   underline: Container(height: 0),
        //   onChanged: (String newValue) {
        //     setState(() {
        //       value = newValue;
        //     });
        //     if (value == appLocalization.setLocation)
        //       Navigator.pushNamed(context, PageRoutes.locationPage);
        //   },
        //   items: <String>[
        //     "New York, USA",
        //     appLocalization.office,
        //     appLocalization.other,
        //     appLocalization.setLocation
        //   ].map<DropdownMenuItem<String>>((address) {
        //     return DropdownMenuItem<String>(
        //       value: address,
        //       child: Text(
        //         address,
        //         overflow: TextOverflow.ellipsis,
        //       ),
        //     );
        //   }).toList(),
        // ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 6.0),
            child: FadedScaleAnimation(
              child: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  /*.......*/
                },
              ),
              fadeDuration: Duration(milliseconds: 200),
            ),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              AppLocalizations.of(context)!.homeText1!,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Container(
            height: 83.3,
            margin: EdgeInsets.only(left: 10),
            child: ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                StoresPage(categories[index].title))),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Container(
                        height: 83.3,
                        width: 83.3,
                        color: Theme.of(context).cardColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FadedScaleAnimation(
                              child: Image.asset(
                                categories[index].image,
                                height: 37.3,
                                width: 41.3,
                              ),
                              fadeDuration: Duration(milliseconds: 200),
                            ),
                            SizedBox(
                              height: 16.0,
                            ),
                            Text(
                              categories[index].title!,
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.0),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.homeText2!,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Spacer(),
                InkWell(
                  onTap: () => Navigator.pushNamed(context, PageRoutes.offer),
                  child: Text(
                    AppLocalizations.of(context)!.seeAll!,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: kMainColor),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 136,
            child: ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: banner.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: FadedScaleAnimation(
                      child: Image.asset(banner[index]),
                      fadeDuration: Duration(milliseconds: 200),
                    ),
                  );
                }),
          ),
          SizedBox(
            height: 18,
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: BookingRow(),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, bottom: 15, right: 20),
            child: Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.nearyou!,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StoresPage("Near You"),
                        ));
                  },
                  child: Text(
                    AppLocalizations.of(context)!.seeAll!,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: kMainColor),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 160,
            margin: EdgeInsets.only(left: 20),
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              childAspectRatio: 0.36,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [
                FadedScaleAnimation(
                  child: quickGrid(context, "images/Restaurants/Layer 1.png"),
                  fadeDuration: Duration(milliseconds: 200),
                ),
                FadedScaleAnimation(
                  child: quickGrid(context, "images/Restaurants/Layer 2.png"),
                  fadeDuration: Duration(milliseconds: 200),
                ),
                FadedScaleAnimation(
                  child: quickGrid(context, "images/Restaurants/Layer 3.png"),
                  fadeDuration: Duration(milliseconds: 200),
                ),
                FadedScaleAnimation(
                  child: quickGrid(context, "images/Restaurants/layer4.png"),
                  fadeDuration: Duration(milliseconds: 200),
                ),
                FadedScaleAnimation(
                  child: quickGrid(context, "images/Restaurants/layer5.png"),
                  fadeDuration: Duration(milliseconds: 200),
                ),
                FadedScaleAnimation(
                  child: quickGrid(context, "images/Restaurants/layer6.png"),
                  fadeDuration: Duration(milliseconds: 200),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, bottom: 15),
            child: Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.best!,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StoresPage("Best Rated"),
                        ));
                  },
                  child: Text(
                    AppLocalizations.of(context)!.seeAll!,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: kMainColor),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 160,
            margin: EdgeInsets.only(left: 20),
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              childAspectRatio: 0.36,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [
                FadedScaleAnimation(
                  child: quickGrid(context, "images/Restaurants/Layer 1.png"),
                  fadeDuration: Duration(milliseconds: 200),
                ),
                FadedScaleAnimation(
                  child: quickGrid(context, "images/Restaurants/Layer 3.png"),
                  fadeDuration: Duration(milliseconds: 200),
                ),
                FadedScaleAnimation(
                  child: quickGrid(context, "images/Restaurants/Layer 2.png"),
                  fadeDuration: Duration(milliseconds: 200),
                ),
                FadedScaleAnimation(
                  child: quickGrid(context, "images/Restaurants/layer4.png"),
                  fadeDuration: Duration(milliseconds: 200),
                ),
                FadedScaleAnimation(
                  child: quickGrid(context, "images/Restaurants/layer5.png"),
                  fadeDuration: Duration(milliseconds: 200),
                ),
                FadedScaleAnimation(
                  child: quickGrid(context, "images/Restaurants/layer6.png"),
                  fadeDuration: Duration(milliseconds: 200),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget quickGrid(BuildContext context, String image) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  ItemsPage(AppLocalizations.of(context)!.store),
            ));
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image(
            image: AssetImage(image),
            height: 62.5,
          ),
          SizedBox(width: 13.3),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(AppLocalizations.of(context)!.store!,
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      color: Theme.of(context).secondaryHeaderColor,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 8.0),
              Text(AppLocalizations.of(context)!.type!,
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(color: kLightTextColor, fontSize: 10.0)),
              SizedBox(height: 10.3),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    Icons.location_on,
                    color: kIconColor,
                    size: 13,
                  ),
                  SizedBox(width: 10.0),
                  Text('5.0 km ',
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(color: kLightTextColor, fontSize: 10.0)),
                  Text('| ',
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(color: kMainColor, fontSize: 10.0)),
                  Text(AppLocalizations.of(context)!.storeAddress!,
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(color: kLightTextColor, fontSize: 10.0)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
