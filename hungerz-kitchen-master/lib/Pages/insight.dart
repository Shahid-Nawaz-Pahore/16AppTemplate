import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:charts_flutter/flutter.dart' as charts;
import 'package:hungerz_kitchen/Components/custom_circular_button.dart';
import 'package:hungerz_kitchen/Locale/locales.dart';
import 'package:hungerz_kitchen/Theme/colors.dart';

class InsightPage extends StatefulWidget {
  @override
  _InsightPageState createState() => _InsightPageState();
}

class _InsightPageState extends State<InsightPage> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              FadedScaleAnimation(
                RichText(
                    text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: 'HUNGERZ',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(letterSpacing: 1)),
                  TextSpan(
                      text: 'RESTRO',
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Theme.of(context).primaryColor,
                          letterSpacing: 1)),
                ])),
                durationInMilliseconds: 400,
              ),
              Spacer(),
              TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                isScrollable: true,
                indicatorColor: Theme.of(context).primaryColor,
                indicatorWeight: 4,
                tabs: [
                  Tab(
                    text: locale.today,
                  ),
                  Tab(
                    text: locale.week,
                  ),
                  Tab(
                    text: locale.month,
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: CustomButton(
                  padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4),
                  leading: Icon(
                    Icons.arrow_back,
                    size: 16,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  title: Text(
                    locale.backToOrder!.padLeft(14),
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  onTap: () => Navigator.pop(context)),
            )
          ],
        ),
        body: Container(
          color: Theme.of(context).backgroundColor,
          child: TabBarView(children: [
            FadedSlideAnimation(
              TodayTab(0),
              beginOffset: Offset(0.0, 0.3),
              endOffset: Offset(0, 0),
              slideCurve: Curves.linearToEaseOut,
            ),
            FadedSlideAnimation(
              TodayTab(1),
              beginOffset: Offset(0.0, 0.3),
              endOffset: Offset(0, 0),
              slideCurve: Curves.linearToEaseOut,
            ),
            FadedSlideAnimation(
              TodayTab(2),
              beginOffset: Offset(0.0, 0.3),
              endOffset: Offset(0, 0),
              slideCurve: Curves.linearToEaseOut,
            ),
          ]),
        ),
      ),
    );
  }
}

class FoodItem {
  String name;
  String image;
  FoodItem(this.name, this.image);
}

class TodayTab extends StatelessWidget {
  final int num;
  TodayTab(this.num);
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    var data = [
      ClicksPerYear('12 ' + locale.jan!, 12),
      ClicksPerYear('13 ' + locale.jan!, 42),
      ClicksPerYear('14 ' + locale.jan!, 35),
      ClicksPerYear('15 ' + locale.jan!, 30),
      ClicksPerYear('16 ' + locale.jan!, 37),
      ClicksPerYear('17 ' + locale.jan!, 31),
      ClicksPerYear('18 ' + locale.jan!, 38),
    ];
    // var series = [
    //   new charts.Series(
    //     id: 'Clicks',
    //     domainFn: (ClicksPerYear clickData, _) => clickData.year,
    //     measureFn: (ClicksPerYear clickData, _) => clickData.clicks,
    //     seriesColor: charts.Color(r: 250, g: 170, b: 41, a: 250),
    //     data: data,
    //   ),
    // ];
    // var chart = new charts.BarChart(
    //   series,
    //   animate: true,
    // );
    List<FoodItem> foodItems1 = [
      FoodItem('Shrips Rice', 'Assets/food7.jpg'),
      FoodItem('Cheese Bread', 'Assets/food3.jpg'),
      FoodItem('Veg Sandwich', 'Assets/food1.jpg'),
      FoodItem('Shrips Rice', 'Assets/food2.jpg'),
      FoodItem('Veg Cheese Sandwich', 'Assets/food4.jpg'),
      FoodItem('Veg Mix Pizza', 'Assets/food5.jpg'),
      FoodItem('Veg Sandwich', 'Assets/food6.jpg'),
      FoodItem('Chicken', 'Assets/food8.jpg'),
    ];
    List<FoodItem> foodItems2 = [
      FoodItem('Veg Cheese Sandwich', 'Assets/food4.jpg'),
      FoodItem('Veg Mix Pizza', 'Assets/food5.jpg'),
      FoodItem('Veg Sandwich', 'Assets/food6.jpg'),
      FoodItem('Shrips Rice', 'Assets/food7.jpg'),
      FoodItem('Chicken', 'Assets/food8.jpg'),
      FoodItem('Veg Sandwich', 'Assets/food1.jpg'),
      FoodItem('Shrips Rice', 'Assets/food2.jpg'),
      FoodItem('Cheese Bread', 'Assets/food3.jpg'),
    ];
    List<FoodItem> foodItems3 = [
      FoodItem('Chicken', 'Assets/food8.jpg'),
      FoodItem('Veg Sandwich', 'Assets/food1.jpg'),
      FoodItem('Veg Cheese Sandwich', 'Assets/food4.jpg'),
      FoodItem('Veg Mix Pizza', 'Assets/food5.jpg'),
      FoodItem('Shrips Rice', 'Assets/food2.jpg'),
      FoodItem('Cheese Bread', 'Assets/food3.jpg'),
      FoodItem('Veg Sandwich', 'Assets/food6.jpg'),
      FoodItem('Shrips Rice', 'Assets/food7.jpg'),
    ];
    List imgs = [foodItems1, foodItems3, foodItems2];
    return FadedScaleAnimation(
      ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: buildDetailsContainer(
                    context,
                    Image.asset('Assets/Icons/icon_orders.png', scale: 4),
                    locale.totalOrders!,
                    '128'),
              ),
              Expanded(
                child: buildDetailsContainer(
                    context,
                    Image.asset('Assets/Icons/icon_item.png', scale: 4),
                    locale.totalItems!,
                    '698'),
              ),
              Expanded(
                child: buildDetailsContainer(
                    context,
                    Image.asset(
                      'Assets/Icons/icon_cooktime.png',
                      scale: 4,
                    ),
                    locale.timeCooked!,
                    '7:15'),
              ),
              Expanded(
                child: buildDetailsContainer(
                    context,
                    Image.asset('Assets/Icons/icon_orders.png', scale: 4),
                    locale.totalOrders!,
                    '128'),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              locale.mostPopularItems!,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: blackColor),
            ),
          ),
          SizedBox(
            height: 210,
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 10),
                scrollDirection: Axis.horizontal,
                itemCount: foodItems1.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        height: 170,
                        width: 170,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                image: AssetImage(imgs[num][index].image))),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        imgs[num][index].name,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(fontSize: 13),
                      )
                    ],
                  );
                }),
          ),
          // Padding(
          //   padding: EdgeInsets.all(32.0),
          //   child: SizedBox(
          //     height: 200.0,
          //     child: chart,
          //   ),
          // ),
        ],
      ),
      durationInMilliseconds: 400,
    );
  }

  Container buildDetailsContainer(
      BuildContext context, Image icon, String heading, String text) {
    return Container(
      // height: 90,
      width: MediaQuery.of(context).size.width / 5,
      margin: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 120,
                vertical: 4),
            child: icon,
          ),
          FadedScaleAnimation(
            RichText(
                text: TextSpan(children: <TextSpan>[
              TextSpan(
                text: heading.toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontSize: 12, color: strikeThroughColor),
              ),
              TextSpan(
                  text: '\n' + text,
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(height: 1.1, color: blackColor)),
            ])),
            durationInMilliseconds: 800,
          )
        ],
      ),
    );
  }
}

class ClicksPerYear {
  final String year;
  final int clicks;

  ClicksPerYear(this.year, this.clicks);
}
