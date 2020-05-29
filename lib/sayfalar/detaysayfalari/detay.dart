import 'package:flutter/material.dart';
import 'package:onlinehaber/model/models.dart';
import 'package:url_launcher/url_launcher.dart';

class Detay extends StatefulWidget {
  final Article haber;
  Detay({this.haber});
  @override
  _DetayState createState() => _DetayState();
}

class _DetayState extends State<Detay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Haber Detayı"),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return dikeyBody(context);
          } else {
            return null;
          }
        },
      ),
    );
  }

  Widget dikeyBody(BuildContext context) {
    return InkWell(
      child: Hero(
        tag: widget.haber.title,
        child: Card(
          margin: EdgeInsets.all(10.0),
          elevation: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    widget.haber.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                  ),
                  child: FadeInImage.assetNetwork(
                    placeholder: "assets/images/loading.gif",
                    fit: BoxFit.fitWidth,
                    image: widget.haber.urlToImage != null
                        ? widget.haber.urlToImage
                        : "Resim Yok",
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Text(
                      widget.haber.description,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                GestureDetector(
                    child: Text("Haberin Devamı",
                        style: TextStyle(
                            fontSize: 20,
                            decoration: TextDecoration.underline,
                            color: Colors.blue)),
                    onTap: () async {
                      String url = widget.haber.url;
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw "Sayfa Açılamıyor";
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
