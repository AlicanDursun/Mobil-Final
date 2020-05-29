import 'package:flutter/material.dart';
import 'package:onlinehaber/api/api_service.dart';
import 'package:onlinehaber/model/covidtek.dart';

class CovidDetay extends StatefulWidget {
  final String sehir;
  CovidDetay({this.sehir});
  @override
  _CovidDetayState createState() => _CovidDetayState();
}

class _CovidDetayState extends State<CovidDetay> {
  ApiService apiService;

  @override
  void initState() {
    super.initState();
    apiService = ApiService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.sehir),
        ),
        body: FutureBuilder(
          future: apiService.covidtek(widget.sehir),
          builder: (context, AsyncSnapshot<Covidtek> gelen) {
            if (gelen.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (gelen.connectionState == ConnectionState.done &&
                gelen.hasData) {
              Covidtek ulke = gelen.data;
              return benimChardim(ulke);
            } else {
              return Container(
                margin: EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    'Aranan Ülke "${widget.sehir}" Bulunamadı. Lütfen İngilizce isimlerini giriniz.',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              );
            }
          },
        ));
  }

  Widget benimChardim(Covidtek ulke) {
    return Container(
      child: MergeSemantics(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: ListView(
            children: <Widget>[
              Card(
                color: Colors.grey[100],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    FadeInImage.assetNetwork(
                        placeholder: "assets/images/loading.gif",
                        image: ulke.countryInfo.flag),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: RichText(
                          text: TextSpan(
                              style: TextStyle(color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(
                                    text: "Yeni Vaka Sayısı : ",
                                    style: TextStyle(color: Colors.blue)),
                                TextSpan(text: ulke.todayCases.toString()),
                              ]),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: RichText(
                          text: TextSpan(
                              style: TextStyle(color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(
                                    text: "Bugünkü Vefat Sayısı : ",
                                    style: TextStyle(color: Colors.blue)),
                                TextSpan(text: ulke.todayDeaths.toString()),
                              ]),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: RichText(
                          text: TextSpan(
                              style: TextStyle(color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(
                                    text: "Toplam Vaka Sayısı : ",
                                    style: TextStyle(color: Colors.blue)),
                                TextSpan(text:ulke.cases.toString()),
                              ]),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: RichText(
                          text: TextSpan(
                              style: TextStyle(color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(
                                    text: "Kalan Vaka Sayısı : ",
                                    style: TextStyle(color: Colors.blue)),
                                TextSpan(text: ulke.active.toString()),
                              ]),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: RichText(
                          text: TextSpan(
                              style: TextStyle(color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(
                                    text: "Toplam Vefat Sayısı : ",
                                    style: TextStyle(color: Colors.blue)),
                                TextSpan(text: ulke.deaths.toString()),
                              ]),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: RichText(
                          text: TextSpan(
                              style: TextStyle(color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(
                                    text: "Toplam İyileşen Sayısı : ",
                                    style: TextStyle(color: Colors.blue)),
                                TextSpan(text:  ulke.recovered.toString()),
                              ]),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /*
   * Card(
      color: Colors.blueGrey[100],
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: FadeInImage.assetNetwork(
                placeholder: "assets/images/loading.gif",
                fit: BoxFit.fitWidth,
                image: ulke.countryInfo.flag),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Text(
              ulke.todayCases.toString(),
              style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
   */
}
