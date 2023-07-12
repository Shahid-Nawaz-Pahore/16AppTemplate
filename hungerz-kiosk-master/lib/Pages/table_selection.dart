import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Locale/locales.dart';
import '../Routes/routes.dart';
import '../Theme/colors.dart';

class TableSelectionPage extends StatefulWidget {
  @override
  _TableSelectionPageState createState() => _TableSelectionPageState();
}

class TableDetail {
  Color color;
  String time;
  String? items;

  TableDetail(this.color, this.time, this.items);
}

class _TableSelectionPageState extends State<TableSelectionPage> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    List<TableDetail> ordersList = [
      TableDetail(newOrderColor, '1:33', locale.ordered! + '5' + locale.items!),
      TableDetail(Theme.of(context).primaryColor, '4:35',
          locale.ordered! + '4' + locale.items!),
      TableDetail(
          Theme.of(context).scaffoldBackgroundColor, '', locale.noOrder),
      TableDetail(newOrderColor, '4:33', locale.ordered! + '2' + locale.items!),
      TableDetail(newOrderColor, '1:33', locale.ordered! + '5' + locale.items!),
      TableDetail(
          Theme.of(context).scaffoldBackgroundColor, '', locale.noOrder),
      TableDetail(
          Theme.of(context).scaffoldBackgroundColor, '', locale.noOrder),
      TableDetail(
          Theme.of(context).scaffoldBackgroundColor, '', locale.noOrder),
      TableDetail(
          Theme.of(context).scaffoldBackgroundColor, '', locale.noOrder),
      TableDetail(
          Theme.of(context).scaffoldBackgroundColor, '', locale.noOrder),
      TableDetail(newOrderColor, '1:33', locale.ordered! + '5' + locale.items!),
      TableDetail(Theme.of(context).primaryColor, '4:35',
          locale.ordered! + '4' + locale.items!),
      TableDetail(newOrderColor, '1:33', locale.ordered! + '5' + locale.items!),
      TableDetail(buttonColor, '1:33', locale.ordered! + '5' + locale.items!),
      TableDetail(newOrderColor, '1:33', locale.ordered! + '5' + locale.items!),
      TableDetail(
          Theme.of(context).scaffoldBackgroundColor, '', locale.noOrder),
      TableDetail(
          Theme.of(context).scaffoldBackgroundColor, '', locale.noOrder),
      TableDetail(
          Theme.of(context).scaffoldBackgroundColor, '', locale.noOrder),
      TableDetail(
          Theme.of(context).scaffoldBackgroundColor, '', locale.noOrder),
      TableDetail(
          Theme.of(context).scaffoldBackgroundColor, '', locale.noOrder),
    ];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: RichText(
            text: TextSpan(children: <TextSpan>[
          TextSpan(
              text: 'HUNGERZ',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(letterSpacing: 1, fontWeight: FontWeight.bold)),
          TextSpan(
              text: 'RESTRO',
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: Theme.of(context).primaryColor,
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold)),
        ])),
        actions: [],
      ),
      body: FadedSlideAnimation(
        Container(
          color: Theme.of(context).backgroundColor,
          child: GridView.builder(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              itemCount: ordersList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () =>
                      Navigator.pushNamed(context, PageRoutes.homePage),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                    height: 80,
                    decoration: BoxDecoration(
                        color: ordersList[index].color,
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              locale.table! + ' ' + '${index + 1}',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(
                                      color: ordersList[index].color ==
                                              Theme.of(context)
                                                  .scaffoldBackgroundColor
                                          ? blackColor
                                          : Theme.of(context)
                                              .scaffoldBackgroundColor,
                                      fontSize: 17),
                            ),
                            Spacer(),
                            Text(
                              ordersList[index].time,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                      fontSize: 17,
                                      color: ordersList[index].color ==
                                              Theme.of(context)
                                                  .scaffoldBackgroundColor
                                          ? blackColor
                                          : Theme.of(context)
                                              .scaffoldBackgroundColor),
                            )
                          ],
                        ),
                        Spacer(),
                        // ListTile(
                        //   onTap: (){},
                        //   contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                        //   title: Text('Table 1'), trailing: Text('1:33'),),
                        Text(
                          ordersList[index].items!,
                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              fontSize: 15,
                              color: ordersList[index].color ==
                                      Theme.of(context).scaffoldBackgroundColor
                                  ? Color(0xff777777)
                                  : Theme.of(context).scaffoldBackgroundColor),
                        )
                      ],
                    ),
                  ),
                );
              }),
        ),
        beginOffset: Offset(0.0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
