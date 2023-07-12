import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:hungerz/HomeOrderAccount/Account/UI/ListItems/settings_page.dart';
import 'package:hungerz/Locale/locales.dart';
import 'package:hungerz/Routes/routes.dart';
import 'package:hungerz/language_cubit.dart';
import 'package:hungerz/theme_cubit.dart';

import 'map_utils.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(Phoenix(child: Hungerz()));
  MapUtils.getMarkerPic();
}

class Hungerz extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<LanguageCubit>(
            create: (context) => LanguageCubit()..getCurrentLanguage(),
          ),
          BlocProvider<ThemeCubit>(
            create: (context) => ThemeCubit()..getCurrentTheme(),
          ),
        ],
        child: BlocBuilder<ThemeCubit, ThemeData>(
          builder: (_, theme) => BlocBuilder<LanguageCubit, Locale>(
            builder: (_, locale) => MaterialApp(
              localizationsDelegates: [
                const AppLocalizationsDelegate(),
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: AppLocalizations.getSupportedLocales(),
              debugShowCheckedModeBanner: false,
              locale: locale,
              theme: theme,
              home: Settings(),
              routes: PageRoutes().routes(),
            ),
          ),
        ),
      );
}
