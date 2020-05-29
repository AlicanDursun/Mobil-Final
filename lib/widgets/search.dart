import 'package:flutter/material.dart';

class SearchSehir extends StatefulWidget {
  @override
  _SearchSehirState createState() => _SearchSehirState();
}

class _SearchSehirState extends State<SearchSehir> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ülke Ara"),
      ),
      body: Form(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _textController,
                  decoration: InputDecoration(
                      labelText: "Ülke",
                      hintText: "Ülke Ara",
                      border: OutlineInputBorder()),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.pop(context, _textController.text);
              },
            )
          ],
        ),
      ),
    );
  }
}
