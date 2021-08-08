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
    final Size _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          width: _size.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _areaTitle("about me"),
                flipCard(),
                _areaTitle("skils"),
                skilArea(),
                _areaTitle("timeline"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget flipCard() {
  return Container(
    height: 380.0,
    margin: EdgeInsets.only(left: 8.0, right: 8.0, top: 0.0, bottom: 0.0),
    child: FlipCard(
      front: profileAreaFlont(),
      back: profileAreaBack(),
      direction: FlipDirection.HORIZONTAL,
      flipOnTouch: true,
    ),
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
      child: Column(
        children: <Widget>[
          Container(
            margin:
                EdgeInsets.only(left: 8.0, right: 8.0, top: 20.0, bottom: 0.0),
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
    _cardGenerator("AAA"),
    _cardGenerator("BBB"),
    _cardGenerator("CCC"),
    _cardGenerator("DDD"),
  ];
  return Container(
    height: 300.0,
    child: SizedBox(
      width: 500.0,
      height: 300.0,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(24.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: list.length,
          itemBuilder: (context, index) {
            return list[index];
          },
        ),
      ),
    ),
  );
}

Widget _cardGenerator(String skilText) {
  return SizedBox(
    width: 190.0,
    height: 240.0,
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(25.0),
        ),
      ),
      margin: EdgeInsets.all(12.0),
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

Widget _areaTitle(String areaTitle) {
  return Container(
    height: 120.0,
    margin: EdgeInsets.only(left: 8.0, right: 8.0, top: 0.0, bottom: 0.0),
    padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 50.0, bottom: 0.0),
    child: Text(
      areaTitle,
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    ),
  );
}
