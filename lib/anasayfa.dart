import 'package:flutter/material.dart';
import 'package:nice_button/nice_button.dart';
import 'package:onlinehaber/sayfalar/covidhaberler/covid.dart';
import 'package:onlinehaber/sayfalar/haberler/bilim.dart';
import 'package:onlinehaber/sayfalar/haberler/genelhaberler.dart';
import 'package:onlinehaber/sayfalar/haberler/magazin.dart';
import 'package:onlinehaber/sayfalar/haberler/saglik.dart';
import 'package:onlinehaber/sayfalar/haberler/spor.dart';
import 'package:onlinehaber/sayfalar/haberler/teknoloji.dart';
import 'sayfalar/haberler/business.dart';

class Anasayfa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("TR Haber"),
        ),
        body: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 40,
                      right: MediaQuery.of(context).size.height / 25),
                  child: Center(
                    child: NiceButton(
                      elevation: 20.0,
                      radius: 40,
                      padding: const EdgeInsets.all(15),
                      text: "Genel Haberler",
                      background: Color(0xFF730000),
                      icon: Icons.assessment,
                      gradientColors: [Color(0xFFFF0000), Color(0xFF730000)],
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GenelHaber()));
                      },
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 50,
                      left: MediaQuery.of(context).size.height / 25),
                  child: NiceButton(
                    elevation: 20.0,
                    radius: 40,
                    padding: const EdgeInsets.all(15),
                    text: "Covid-19",
                    background: Color(0xFF005857),
                    icon: Icons.healing,
                    gradientColors: [Color(0xFF00A6A3), Color(0xFF005857)],
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Covid19()));
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 50,
                      right: MediaQuery.of(context).size.height / 25),
                  child: NiceButton(
                    elevation: 20.0,
                    radius: 40,
                    padding: const EdgeInsets.all(15),
                    text: "Sağlık",
                    background: Color(0xFFAE1536),
                    icon: Icons.security,
                    gradientColors: [Color(0xFFEC5664), Color(0xFFAE1536)],
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Saglik()));
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 50,
                      left: MediaQuery.of(context).size.height / 25),
                  child: NiceButton(
                    elevation: 20.0,
                    radius: 40,
                    padding: const EdgeInsets.all(15),
                    text: "Bilim",
                    background: Color(0xFF205800),
                    icon: Icons.spa,
                    gradientColors: [Color(0xFF71A537), Color(0xFF205800)],
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Bilim()));
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 50,
                      right: MediaQuery.of(context).size.height / 25),
                  child: NiceButton(
                    elevation: 20.0,
                    radius: 40,
                    padding: const EdgeInsets.all(15),
                    text: "Teknoloji",
                    background: Color(0xFFE62D00),
                    icon: Icons.track_changes,
                    gradientColors: [Color(0xFFE67E65), Color(0xFFE62D00)],
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Teknoloji()));
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 50,
                      left: MediaQuery.of(context).size.height / 25),
                  child: NiceButton(
                    elevation: 20.0,
                    radius: 40,
                    padding: const EdgeInsets.all(15),
                    text: "Magazin",
                    background: Color(0xFF967BDD),
                    icon: Icons.explicit,
                    gradientColors: [Color(0xFFE5C8FF), Color(0xFF967BDD)],
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Magazin()));
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 50,
                      right: MediaQuery.of(context).size.height / 25),
                  child: NiceButton(
                    elevation: 20.0,
                    radius: 40,
                    padding: const EdgeInsets.all(15),
                    text: "Ekonomi",
                    background: Color(0xFF154B24),
                    icon: Icons.attach_money,
                    gradientColors: [Color(0xFF8EA781), Color(0xFF154B24)],
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Business()));
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 50,
                      left: MediaQuery.of(context).size.height / 25),
                  child: NiceButton(
                    elevation: 20.0,
                    radius: 40,
                    padding: const EdgeInsets.all(15),
                    text: "Spor",
                    background: Color(0xFF633E00),
                    icon: Icons.account_balance,
                    gradientColors: [Color(0xFFF7BB42), Color(0xFF633E00)],
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Spor()));
                    },
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
