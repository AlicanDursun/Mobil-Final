import 'package:flutter/material.dart';

class Hakkimda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hakkımızda"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Text(
              "Mobil Programlama Dersi",
              style: TextStyle(fontSize: 20.0, color: Colors.blue),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 10),
          Container(
            child: RichText(
              text: TextSpan(
                  style: TextStyle(color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                        text: "Hazırlayan : ",
                        style: TextStyle(color: Colors.blue)),
                    TextSpan(text: "Alican Dursun"),
                  ]),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            child: RichText(
              text: TextSpan(
                  style: TextStyle(color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                        text: "Numarası : ",
                        style: TextStyle(color: Colors.blue)),
                    TextSpan(text: "1811404058"),
                  ]),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            child: RichText(
              text: TextSpan(
                  style: TextStyle(color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                        text: "İletişim : ",
                        style: TextStyle(color: Colors.blue)),
                    TextSpan(text: "alicangdursun@gmail.com"),
                  ]),
            ),
          )
        ],
      )),
    );
  }
}
