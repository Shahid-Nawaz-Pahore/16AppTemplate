import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:hungerz_delivery/Locale/locales.dart';
import 'package:hungerz_delivery/Routes/routes.dart';
import 'package:hungerz_delivery/language_cubit.dart';
import 'package:hungerz_delivery/theme_cubit.dart';

import 'Account/UI/ListItems/settings_page.dart';
import 'map_utils.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MapUtils.getMarkerPic();
  runApp(Phoenix(child: HungerzDelivery()));
}

class HungerzDelivery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
       providers: [
          BlocProvider<LanguageCubit>(
            create: (context) => LanguageCubit()..getCurrentLanguage(),
          ),
          BlocProvider<ThemeCubit>(
            create: (context) => ThemeCubit()..getCurrentTheme(),
          ),
        ],
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (_, theme) {
          return BlocBuilder<LanguageCubit, Locale>(
            builder: (_, locale) {
              return MaterialApp(
                localizationsDelegates: [
                  const AppLocalizationsDelegate(),
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                supportedLocales: AppLocalizations.getSupportedLocales(),
                locale: locale,
                theme: theme,
                home: Settings(),
                routes: PageRoutes().routes(),
              );
            },
          );
        },
      ),
    );
  }
}
