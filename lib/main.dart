import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'news/news.dart';
import 'package:news_app/simple_bloc_observer.dart';

void main() {
  EquatableConfig.stringify = kDebugMode;
  Bloc.observer = SimpleBlocObserver();
  runApp(MultiRepositoryProvider(
    providers: [
      RepositoryProvider(
        create: (context) => NewsRepository(),
      ),
    ],
    child: EasyLocalization(
      path: "assets/langs",
      useOnlyLangCode: true,
      supportedLocales: [
        Locale('en', 'US'),
      ],
      child: MaterialApp(
        title: 'News App',
        home: App(),
        theme: ThemeData(
          primaryColor: Common.getColorFromHex(ColorValue.Home_Color_Green),
          accentColor: Common.getColorFromHex(ColorValue.Home_Color_Green),
          cursorColor: Common.getColorFromHex(ColorValue.Home_Color_Green),
        ),
      ),
    ),
    //),
  ));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NewsPage();
  }
}

