import 'package:flutter/material.dart';
import 'package:onlinehaber/sayfalar/covidhaberler/covid.dart';
import 'package:onlinehaber/sayfalar/haberler/bilim.dart';
import 'package:onlinehaber/sayfalar/haberler/business.dart';
import 'package:onlinehaber/sayfalar/haberler/genelhaberler.dart';
import 'package:onlinehaber/sayfalar/haberler/magazin.dart';
import 'package:onlinehaber/sayfalar/haberler/saglik.dart';
import 'package:onlinehaber/sayfalar/haberler/spor.dart';
import 'package:onlinehaber/sayfalar/haberler/teknoloji.dart';


class HamburgerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height/5,
            child: DrawerHeader(
              child: Center(
                child: Text(
                  'Haberler Başlıkları',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
              decoration: BoxDecoration(
                color: Color(0xFFFE0000),
              ),
            ),
          ),
          ListTile(
            trailing: Icon(Icons.arrow_forward),
            leading: Icon(Icons.healing),
            title: Text('Covid-19 Ülkelerin Son Durumu'),
            onTap: ()  {
               Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Covid19()));
            },
          ),
          ListTile(
            trailing: Icon(Icons.arrow_forward),
            leading: Icon(Icons.assessment),
            title: Text('Genel Haberler'),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => GenelHaber()));
            },
          ),
          ListTile(
            trailing: Icon(Icons.arrow_forward),
            leading: Icon(Icons.attach_money),
            title: Text('Ekonomi'),
            onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Business()));
            },
          ),
          ListTile(
            trailing: Icon(Icons.arrow_forward),
            leading: Icon(Icons.explicit),
            title: Text('Magazin'),
            onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Magazin()));
            },
          ),
          ListTile(
            trailing: Icon(Icons.arrow_forward),
            leading: Icon(Icons.security),
            title: Text('Sağlık'),
            onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Saglik()));
            },
          ),
          ListTile(
            trailing: Icon(Icons.arrow_forward),
            leading: Icon(Icons.spa),
            title: Text('Bilim'),
            onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Bilim()));
            },
          ),
          ListTile(
            trailing: Icon(Icons.arrow_forward),
            leading: Icon(Icons.account_balance),
            title: Text('Spor'),
            onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Spor()));
            },
          ),
          ListTile(
            trailing: Icon(Icons.arrow_forward),
            leading: Icon(Icons.track_changes),
            title: Text('Teknoloji'),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Teknoloji()));
            },
          ),
        ],
      ),
    );
  }
}
