import 'package:flutter/material.dart';
import 'package:mohanun_goyang/provider/page_notifier.dart';
import 'package:mohanun_goyang/screen/main_screen.dart';
import 'package:mohanun_goyang/screen/login_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => PageNotifier())],
      child: MaterialApp(
        title: 'MohanunGoyang',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.white),
        home: Consumer<PageNotifier>(
          builder: (context, pageNotifier, child) {
            return Navigator(
              pages: [
                MaterialPage(
                    key: ValueKey(MyHomePage.pageName),
                    child: const MyHomePage(title: 'mohanun_goyayng')),
                if (pageNotifier.currentPage == AuthScreen.pageName)
                  AuthScreen(),
              ],
              onPopPage: (route, result) {
                if (!route.didPop(result)) {
                  return false;
                }
                return true;
              },
            );
          },
        ),
      ),
    );
  }
}
