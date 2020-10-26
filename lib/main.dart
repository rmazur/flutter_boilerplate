import 'package:boilerplate/globalStateManagement/language.dart';
import 'package:boilerplate/globalStateManagement/requestsTest.dart';
import 'package:boilerplate/globalStateManagement/themeManagement.dart';
import 'package:boilerplate/globalStateManagement/increment.dart';
import 'package:boilerplate/globalStateManagement/localStorage.dart';
import 'package:boilerplate/ui/themes.dart';
import 'package:boilerplate/utils/routes.dart';
import 'package:boilerplate/utils/MyLocalizations.dart';
import 'package:boilerplate/utils/MyLocalizationsDelegate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final changeLanguageNotifier = useProvider(changeLanguageNotifProv);
    final changeThemeNotifier = useProvider(changeThemeNotifProv);

    return MaterialApp(
      locale: changeLanguageNotifier.language,
      supportedLocales: [
        const Locale('en', ''),
        const Locale('es', ''),
      ],
      localizationsDelegates: [
        const MyLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      localeResolutionCallback:
          (Locale locale, Iterable<Locale> supportedLocales) {
        for (Locale supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode ||
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      title: 'Flutter Boilerplate Demo',
      routes: Routes.routes,
      theme: changeThemeNotifier.currentTheme,
      home: MyHomePage(title: 'Flutter Boilerplate'),
    );
  }
}

class MyHomePage extends HookWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    final incrementState = useProvider(increment);
    final changeLanguageNotifier = useProvider(changeLanguageNotifProv);
    final changeThemeNotifier = useProvider(changeThemeNotifProv);
    final requestNotifier = useProvider(requestNotifProv);
    final localStoreNotifier = useProvider(localStoreNotifProv);

    String author = requestNotifier.data['slideshow'] != null
        ? requestNotifier.data['slideshow']['author']
        : 'empty';

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.login);
              },
              child: Text('Login'),
            ),
            SizedBox(height: 20),
            RaisedButton(
              onPressed: () {
                incrementState.state++;
              },
              child: Text('Increment Using StateProvider (Riverpod)'),
            ),
            Text('Value:' + incrementState.state.toString(),
                style: secondaryTheme.textTheme.headline2),
            SizedBox(height: 20),
            Text(MyLocalizations.of(context).trans("hello_world")),
            RaisedButton(
              onPressed: () {
                changeLanguageNotifier.changeLanguage();
              },
              child: Text('Toggle Language'),
            ),
            SizedBox(height: 20),
            RaisedButton(
              onPressed: () {
                changeThemeNotifier.toggleTheme();
              },
              child: Text('Toggle Theme'),
            ),
            SizedBox(height: 20),
            RaisedButton(
              onPressed: () {
                requestNotifier.fetchData();
              },
              child: Text('Make Request'),
            ),
            Text('$author'),
            SizedBox(height: 20),
            RaisedButton(
              onPressed: () {
                localStoreNotifier.getlocalAuthor();
              },
              child: Text('get Local'),
            ),
            RaisedButton(
              onPressed: () {
                localStoreNotifier.setlocalAuthor('Bob');
              },
              child: Text('SET Local'),
            ),
            Text(
                'Local Storage text: ' + localStoreNotifier.localStorageAuthor),
          ],
        ),
      ),
    );
  }
}
