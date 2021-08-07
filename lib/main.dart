import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: ListView(
                shrinkWrap: true,
                children: [
                  flipCard(),
                  skilArea(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget flipCard() {
  return FlipCard(
    front: profileAreaFlont(),
    back: profileAreaBack(),
    direction: FlipDirection.HORIZONTAL,
    flipOnTouch: true,
  );
}

Widget profileAreaFlont() {
  return SizedBox(
    height: 380.0,
    width: 500.0,
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(25.0),
        ),
      ),
      margin: EdgeInsets.all(24.0),
      child: Column(
        children: <Widget>[
          Container(
            margin:
                EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0, bottom: 0.0),
            padding: EdgeInsets.all(12.0),
            width: 200.0,
            height: 200.0,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.fill, image: AssetImage("self.png"))),
          ),
          Container(
            margin:
                EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0, bottom: 0.0),
            padding: EdgeInsets.all(12.0),
            child: Text(
              'Tomoyuki Hayakawa',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin:
                EdgeInsets.only(left: 8.0, right: 8.0, top: 0.0, bottom: 0.0),
            padding: EdgeInsets.all(12.0),
            child: Text(
              '1995年生まれ / 名古屋出身 / 東京都在住 / iOS App Developer',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget profileAreaBack() {
  return SizedBox(
    height: 380.0,
    width: 500.0,
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(25.0),
        ),
      ),
      margin: EdgeInsets.all(24.0),
      child: Column(
        children: <Widget>[
          Container(
            margin:
                EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0, bottom: 8.0),
            padding: EdgeInsets.all(12.0),
            child: Text(
              '名古屋市出身のエンジニアです。学生時代はiOSアプリの個人開発をしていました。現在は都内の会社でiOSエンジニアをしています。サウナと自転車が好きです。好きな犬種はシベリアンハスキー、アラスカンマラミュート、チャウチャウ、柴犬。カードフリップを実装してみたくて自己紹介を書いてみました。',
            ),
          ),
        ],
      ),
    ),
  );
}

Widget skilArea() {
  var list = [
    _generator("AAA"),
    _generator("BBB"),
    _generator("CCC"),
    _generator("DDD"),
  ];
  return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      // スクロールさせない
      primary: false,
      // physics: NeverScrollableScrollPhysics(),
      children: list);
}

Widget _generator(String skilText) {
  return SizedBox(
    width: 190.0,
    height: 190.0,
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(25.0),
        ),
      ),
      margin: EdgeInsets.all(24.0),
      child: Column(
        children: <Widget>[
          Text(
            skilText,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          )
        ],
      ),
    ),
  );
}
