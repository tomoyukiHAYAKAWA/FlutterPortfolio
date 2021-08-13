import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'phoneWidgets.dart';
import 'pcWidgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const locale = Locale("ja", "JP");
    return MaterialApp(
      title: 'my space',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "MPLUS1p-Medium",
      ),
      locale: locale,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        locale,
      ],
      home: MyHomePage(title: 'my space'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: (() {
          if (size.width < 800) {
            return phoneWidgets(size);
          } else {
            return PCWidgets();
          }
        })(),
      ),
    );
  }
}
