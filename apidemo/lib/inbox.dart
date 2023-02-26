import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class InboxPage extends StatefulWidget {
  const InboxPage({Key? key}) : super(key: key);

  @override
  State<InboxPage> createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(45),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Inbox',
                        style: TextStyle(
                            fontSize: 50, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'You have 2 unread messegs',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Icon(Icons.search),
                ),
                Container(
                  padding: EdgeInsets.only(right: 20),
                  child: Icon(Icons.more_vert),
                ),
              ],
            ),
          ),
          Container(
            height: 400,
            child: FutureBuilder<http.Response>(
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  dynamic jsonData = jsonDecode(snapshot.data!.body.toString());
                  return ListView.builder(
                    itemCount: jsonData.length,
                    itemBuilder: (context, index) {
                      return listview(  jsonData[index]["name"], jsonData[index]["avatar"], jsonData[index]["city"], "3 min");
                    },
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
              future: getData(),
            ),
          ),
        ],
      ),
    );
  }

  Future<http.Response> getData() async {
    print("Hello");
    http.Response res = await http.get(
        Uri.parse('https://630dbce7b37c364eb70a47a8.mockapi.io/studentDetail'));
    print(res.body);
    print("hello");

    return res;
  }

  Widget listview(title, url, subtitle, tratext) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.only(right: 15.0, left: 15.0, bottom: 10.0, top: 10.0),
      // color: Colors.green,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.0),
        color: Colors.grey.shade200,
      ),
      child: ListTile(
        leading: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              url,
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              fontFamily: "Mulish"),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 11.0,
            fontFamily: "Mulish",
          ),
        ),
        trailing: Column(
          children: [
            Text(
              tratext,
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 7.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Mulish"),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 30,
              height: 30,
              padding: EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Center(
                child: Text(
                  "2",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
