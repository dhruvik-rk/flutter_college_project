import 'dart:convert';

import 'package:apidemo/reviewedit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;

class ReviewPage extends StatefulWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  double rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(45),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Reviews',
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '45 persons were here',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Icon(Icons.arrow_back_ios),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 20),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                          return ReviewEdit(map: null);
                        },),).then((value) {
                          setState(() {

                          });
                        },);
                      },
                      child: Icon(Icons.add),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 450,
              child: FutureBuilder<http.Response>(
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    dynamic jsonData = jsonDecode(snapshot.data!.body.toString());
                    return ListView.builder(
                      itemCount: jsonData.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.only(
                              top: 10, right: 30, bottom: 50, left: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                title: Text(jsonData[index]['name']),
                                leading: Container(
                                  width: 40,
                                  height: 40,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      jsonData[index]['avatar'],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                subtitle: Container(
                                  padding: EdgeInsets.only(top: 8),
                                  child: Text("yesterday"),
                                ),
                                trailing: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return ReviewEdit(
                                            map: jsonData[index],
                                          );
                                        },
                                      ),
                                    ).then(
                                      (value) {
                                        setState(() {});
                                      },
                                    );
                                  },
                                  child: Icon(Icons.edit),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    top: 10, right: 20, bottom: 10, left: 20),
                                child: Text(
                                  textAlign: TextAlign.justify,
                                  jsonData[index]["discription"].toString(),
                                  style: TextStyle(height: 1.5),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: RatingBar.builder(
                                  initialRating: 0,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemSize: 25,
                                  itemCount: 5,
                                  itemPadding: EdgeInsets.only(right: 5),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.black,
                                  ),
                                  onRatingUpdate: (value) {
                                    setState(() {
                                      rating = value;
                                      print(value);
                                    });
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 24.7),
                                child: Text('$rating out of 5'),
                              ),
                            ],
                          ),
                        );
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
}
