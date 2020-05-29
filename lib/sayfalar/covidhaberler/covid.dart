import 'package:flutter/material.dart';
import 'package:onlinehaber/api/api_service.dart';
import 'package:onlinehaber/model/covidmodel.dart';
import 'package:onlinehaber/sayfalar/detaysayfalari/coviddetay.dart';
import 'package:onlinehaber/widgets/hamburger.dart';
import 'package:onlinehaber/widgets/search.dart';

class Covid19 extends StatefulWidget {
  @override
  _Covid19State createState() => _Covid19State();
}

class _Covid19State extends State<Covid19> {
  ApiService apiService;
  String secilensehir;
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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              secilensehir = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchSehir()));
              if (secilensehir != "" && secilensehir != null) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CovidDetay(
                          sehir: secilensehir,
                        )));
              } else {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Covid19()));
              }
            },
          )
        ],
        title: Text("Covid-19 Ülkelerde Durumlar"),
      ),
      body: FutureBuilder(
        future: apiService.covid(),
        builder: (context, AsyncSnapshot<List<Covid>> gelen) {
          if (gelen.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (gelen.connectionState == ConnectionState.done) {
            List<Covid> ulkeler = gelen.data;
            return _benimExpansionTile(ulkeler);
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget _benimExpansionTile(List<Covid> ulkeler) {
    return ListView.builder(
      itemCount: ulkeler.length,
      itemBuilder: (context, index) {
        Covid covid = ulkeler[index];
        return ExpansionTile(
          title: Text(covid.country),
          leading: Container(
            height: 20,
            child: FadeInImage.assetNetwork(
                placeholder: "assets/images/loading.gif",
                image: covid.countryInfo.flag),
          ),
          children: <Widget>[
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              padding: EdgeInsets.all(20.0),
              crossAxisSpacing: (10.0),
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 4),
              children: <Widget>[
                RichText(
                  text: TextSpan(
                      style: TextStyle(color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                            text: "Yeni Vaka Sayısı : ",
                            style: TextStyle(color: Colors.blue)),
                        TextSpan(text: covid.todayCases.toString()),
                      ]),
                ),
                RichText(
                  text: TextSpan(
                      style: TextStyle(color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                            text: "Toplam Vaka Sayısı : ",
                            style: TextStyle(color: Colors.blue)),
                        TextSpan(text: covid.cases.toString()),
                      ]),
                ),
                RichText(
                  text: TextSpan(
                      style: TextStyle(color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                            text: "Bugünkü Vefat Sayısı : ",
                            style: TextStyle(color: Colors.blue)),
                        TextSpan(text: covid.todayDeaths.toString()),
                      ]),
                ),
                RichText(
                  text: TextSpan(
                      style: TextStyle(color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                            text: "Kalan Vaka Sayısı : ",
                            style: TextStyle(color: Colors.blue)),
                        TextSpan(text: covid.active.toString()),
                      ]),
                ),
                RichText(
                  text: TextSpan(
                      style: TextStyle(color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                            text: "Toplam Vefat Sayısı : ",
                            style: TextStyle(color: Colors.blue)),
                        TextSpan(text: covid.deaths.toString()),
                      ]),
                ),
                RichText(
                  text: TextSpan(
                      style: TextStyle(color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                            text: "Toplam İyileşen Sayısı : ",
                            style: TextStyle(color: Colors.blue)),
                        TextSpan(text: covid.recovered.toString()),
                      ]),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
