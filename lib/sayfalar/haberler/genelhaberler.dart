import 'package:flutter/material.dart';
import 'package:onlinehaber/api/api_service.dart';
import 'package:onlinehaber/model/models.dart';
import 'package:onlinehaber/sayfalar/detaysayfalari/detay.dart';
import 'package:onlinehaber/widgets/hamburger.dart';

class GenelHaber extends StatefulWidget {
  @override
  _GenelHaberState createState() => _GenelHaberState();
}

class _GenelHaberState extends State<GenelHaber> {
  ApiService apiService;

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
        title: Text("Genel Haberler"),
      ),
      body: FutureBuilder(
        future: apiService.genelHaber(),
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
                      elevation: 4,
                      margin: EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                            ),
                            child: FadeInImage.assetNetwork(
                              placeholder: "assets/images/loading.gif",
                              fit: BoxFit.fitWidth,
                              image: haber.urlToImage != null
                                  ? haber.urlToImage
                                  : "Resim Yok",
                            ),
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
                    ),
                  ),
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
