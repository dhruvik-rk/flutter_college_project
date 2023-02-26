import 'dart:convert';

import 'package:apidemo/insertdata.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiCall extends StatefulWidget {
  const ApiCall({Key? key}) : super(key: key);

  @override
  State<ApiCall> createState() => _ApiCallState();
}

class _ApiCallState extends State<ApiCall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api Demo"),
        actions: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return InsertData(
                      map: null,
                    );
                  },
                ),
              ).then(
                (value) {
                  setState(() {});
                },
              );
            },
            child: Icon(Icons.add),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(left: 10, right: 10 , top: 20),
        child: FutureBuilder<http.Response>(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              dynamic jsonData = jsonDecode(snapshot.data!.body.toString());
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300,
                  childAspectRatio: 1,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: jsonData.length,
                itemBuilder: (context, index) {
                  return ProfileMaker(
                      jsonData[index]["name"],
                      jsonData[index]["price"],
                      jsonData[index]["distance"],
                      jsonData[index]["avatar"],
                      jsonData[index]);
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

  Future<void> deleteData(id) async {
    http.Response res = await http.delete(Uri.parse(
        'https://630dbce7b37c364eb70a47a8.mockapi.io/studentDetail/$id'));
  }

  Future<http.Response> getUserData() async {
    http.Response res = await http.get(
        Uri.parse('https://630dbce7b37c364eb70a47a8.mockapi.io/studentDetail'));
    print(res.body);
    return res;
  }

  Widget ProfileMaker(name, price, location, image, jsonData) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return InsertData(map: jsonData);
            },
          ),
        ).then(
          (value) {
            setState(() {});
          },
        );
      },
      child: Container(
        // color: Colors.black45,
        // margin: EdgeInsets.only(bottom: 30),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: InkWell(
                    onTap: () {
                      deleteData(jsonData['id']).then(
                        (value) {
                          setState(() {});
                        },
                      );
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: 21,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 160,
                    child: Text(
                      name,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {});
                    },
                    child: Icon(Icons.favorite),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Start from $price\$'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 17,
                      ),
                      Text(location),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
