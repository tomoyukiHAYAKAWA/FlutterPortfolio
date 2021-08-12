import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:url_launcher/url_launcher.dart';

Widget pcWidgets(Size size) {
  return Container(
    width: size.width,
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _areaIcon("🚲"),
          _areaTitle("about me"),
          profileAreaFlont(),
          _areaIcon("💻"),
          _areaTitle("skils"),
          skilArea(),
          _areaIcon("🦒"),
          _areaTitle("timeline"),
          timelineCard(
            "〜2020年3月",
            "学生時代",
            "・高校では情報科を専攻し、高校2年から簡単なプログラミングを開始する\n・高校3年で独学でiOSアプリをリリース\n・大学でも個人開発を続ける\n・Life is Tech ! でiPhoneアプリ開発を中高生に教えるインターンをする",
          ),
          timelineCard("2020年4月〜2021年4月", "社会人1年目",
              "・株式会社アイスタイルに新卒入社\n・入社に伴って東京都に引っ越す\n・アプリ開発グループiOSチームに配属\n・最初のプロジェクトはログインスキップ対応\n・社内サイネージの開発のためVue.jsを初めて扱う"),
          timelineCard("2021年4月〜現在", "社会人2年目",
              "・徐々に一人でプロジェクトを任されるようになる\n・Flutter開発をしてみたくてDartに手を出してみる"),
          _areaIcon("🔗"),
          _areaTitle("links"),
          linksArea(),
          footerArea(),
        ],
      ),
    ),
  );
}

Widget profileAreaFlont() {
  return SizedBox(
    height: 300.0,
    width: 800.0,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin:
              EdgeInsets.only(left: 8.0, right: 8.0, top: 10.0, bottom: 0.0),
          padding:
              EdgeInsets.only(left: 8.0, right: 8.0, top: 10.0, bottom: 0.0),
          width: 280.0,
          height: 280.0,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage("self.png"))),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                    left: 8.0, right: 8.0, top: 0.0, bottom: 0.0),
                padding: EdgeInsets.only(
                    left: 12.0, right: 12.0, top: 0.0, bottom: 0.0),
                child: Text(
                  'iOS App Developer',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: 8.0, right: 8.0, top: 8.0, bottom: 0.0),
                padding: EdgeInsets.only(
                    left: 12.0, right: 12.0, top: 0.0, bottom: 0.0),
                child: Text(
                  'Tomoyuki Hayakawa',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: 8.0, right: 8.0, top: 8.0, bottom: 0.0),
                padding: EdgeInsets.only(
                    left: 12.0, right: 12.0, top: 0.0, bottom: 0.0),
                child: Text(
                  '1995年生まれ / 名古屋市出身 / 東京都在住',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: 8.0, right: 8.0, top: 8.0, bottom: 0.0),
                padding: EdgeInsets.only(
                    left: 12.0, right: 12.0, top: 0.0, bottom: 0.0),
                child: Text(
                  '初めまして早川智之です。学生時代からiOSアプリの個人開発をしていました。現在は都内の会社でiOSエンジニアをしています。最近Dartはじめました。サウナと自転車が好きです。好きな犬種はシベリアンハスキー、アラスカンマラミュート、チャウチャウ、柴犬。',
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget skilArea() {
  var list = [
    _cardGenerator("swift.png", "Swift", "・業務で使用中\n・経験年数4年くらい\n・1番たくたん書いてる"),
    _cardGenerator("rxswift.png", "RxSwift", "・業務で使用中\n・経験年数1年\n・便利で好き"),
    _cardGenerator("vue.png", "Vue", "・社内サイネージ開発で使用\n・経験半年くらい"),
    _cardGenerator("sauna.png", "サウナ", "・だいたい週1くらいで行く\n・経験年数1年半"),
  ];
  return Container(
    height: 360.0,
    child: SizedBox(
      width: 820.0,
      height: 360.0,
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

Widget _cardGenerator(
  String imageName,
  String skilText,
  String mainText,
) {
  return SizedBox(
    width: 240.0,
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      margin: EdgeInsets.all(12.0),
      child: Column(
        children: <Widget>[
          Container(
            width: 100.0,
            height: 100.0,
            margin: EdgeInsets.only(
                left: 12.0, right: 12.0, top: 12.0, bottom: 12.0),
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill, image: AssetImage(imageName))),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(
                left: 12.0, right: 12.0, top: 0.0, bottom: 12.0),
            child: Text(
              skilText,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin:
                EdgeInsets.only(left: 12.0, right: 12.0, top: 0.0, bottom: 0.0),
            child: Text(
              mainText,
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget timelineCard(String titleText, String subTitleText, String mainText) {
  return Container(
    width: 800.0,
    margin: EdgeInsets.only(left: 12.0, right: 12.0, top: 24.0, bottom: 24.0),
    child: Row(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(12.0),
          child: Icon(
            Icons.circle,
            color: Colors.blue,
          ),
        ),
        Expanded(
          child: SizedBox(
            width: 700.0,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                        left: 12.0, right: 12.0, top: 0.0, bottom: 0.0),
                    padding: EdgeInsets.only(
                        left: 12.0, right: 12.0, top: 12.0, bottom: 4.0),
                    child: Text(
                      titleText,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: Colors.grey),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 12.0, right: 12.0, top: 0.0, bottom: 0.0),
                    padding: EdgeInsets.only(
                        left: 12.0, right: 12.0, top: 0.0, bottom: 8.0),
                    child: Text(
                      subTitleText,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 12.0, right: 12.0, top: 0.0, bottom: 0.0),
                    padding: EdgeInsets.only(
                        left: 12.0, right: 12.0, top: 0.0, bottom: 8.0),
                    child: Text(
                      mainText,
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget linksArea() {
  return Container(
    width: 500.0,
    padding: EdgeInsets.only(bottom: 20.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _linkIconGenerator(
            "GitHubIcon.png", "https://github.com/tomoyukiHAYAKAWA"),
        _linkIconGenerator(
            "twitterIcon.png", "https://twitter.com/hayakawa_tomoe"),
        _linkIconGenerator(
            "facebookIcon.png", "https://www.facebook.com/hayakawatomoyuki"),
      ],
    ),
  );
}

Widget _linkIconGenerator(String imageName, String url) {
  return Container(
    alignment: Alignment.center,
    margin: EdgeInsets.only(left: 8.0, right: 8.0, top: 20.0, bottom: 0.0),
    padding: EdgeInsets.all(12.0),
    width: 100.0,
    height: 100.0,
    child: GestureDetector(
      onTap: () {
        _launchURL(url);
      },
      child: Image.asset(imageName),
    ),
  );
}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

Widget footerArea() {
  return Container(
    alignment: Alignment.center,
    color: Colors.blue,
    child: Text(
      "©️Tomoyuki Hayakawa",
      style: TextStyle(color: Colors.white),
    ),
  );
}

Widget _areaIcon(String icon) {
  return Container(
    padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 50.0, bottom: 2.0),
    child: Text(
      icon,
      style: TextStyle(fontSize: 36),
    ),
  );
}

Widget _areaTitle(String areaTitle) {
  return Container(
    margin: EdgeInsets.only(left: 8.0, right: 8.0, top: 0.0, bottom: 20.0),
    padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0, bottom: 2.0),
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: Colors.blue,
          width: 4.0,
        ),
      ),
    ),
    child: Text(
      areaTitle,
      style: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}