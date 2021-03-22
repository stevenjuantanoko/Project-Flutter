import 'dart:convert';

import 'package:flutter/material.dart';

import 'Header.dart';
import 'InputWrapper.dart';
import 'package:http/http.dart' as http;

mixin MainPage implements StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List users = [];
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  fetchUsers() async {
    var url = Uri.parse("https://reqres.in/api/users");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var items = json.decode(response.body)['data'];
      setState(() {
        users = items;
      });
    } else {
      setState(() {
        users = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Users"),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    List items = ["1", "2"];
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return getCard(index);
        });
  }

  Widget getCard(index) {
    var name = index['first_name'] + " " + index['last_name'];
    var email = index['email'];
    var image = index['avatar'];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          title: Row(
            children: <Widget>[
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(60 / 2),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(image.toString()))),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name.toString(),
                    style: TextStyle(fontSize: 17),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    email.toString(),
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
