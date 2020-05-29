import 'package:flutter/material.dart';
import 'package:onlinehaber/api/api_service.dart';
import 'package:onlinehaber/model/models.dart';
import 'package:onlinehaber/sayfalar/detaysayfalari/detay.dart';

import 'package:onlinehaber/widgets/hamburger.dart';

class Teknoloji extends StatefulWidget {
  @override
  _TeknolojiState createState() => _TeknolojiState();
}

class _TeknolojiState extends State<Teknoloji> {
  ApiService apiService;
  String kategori = "technology";

  @override
  void initState() {
    super.initState();
    apiService = ApiService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HamburgerMenu(),
      appBar: AppBar(
        title: Text("Teknoloji Haberleri"),
      ),
      body: FutureBuilder(
        future: apiService.kategorikHaber(kategori),
        builder: (context, AsyncSnapshot<Haber> gelenHaber) {
          if (gelenHaber.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (gelenHaber.connectionState == ConnectionState.done) {
            return GridView.count(
              crossAxisCount: 1,
              children: gelenHaber.data.articles.map((haber) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Detay(
                              haber: haber,
                            )));
                  },
                  child: Hero(
                      tag: haber.urlToImage != null
                          ? haber.urlToImage
                          : "Resim Yok",
                      child: Card(
                        margin: EdgeInsets.all(10.0),
                        elevation: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100))),
                              
                                child: FadeInImage.assetNetwork(
                                    placeholder: "assets/images/loading.gif",
                                    fit: BoxFit.fitWidth,
                                    image: haber.urlToImage != null
                                        ? haber.urlToImage
                                        : "Resim Yok"),
                              
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.all(10),
                                child: Text(
                                  haber.title,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                );
              }).toList(),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
