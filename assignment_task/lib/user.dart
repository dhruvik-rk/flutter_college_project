import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class UserPage extends StatefulWidget {
  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  double rating = 0;
  List<Map<String, dynamic>> data = [
    {
      "image": 'https://images.unsplash.com/photo-1578390432942-d323db577792?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bWVuJTIwZmFzaGlvbiUyMGJhcmJlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
      "name": "HTML and CSS",
      'subTitle': "Yesterday"
    },
    {
      "image": 'https://images.unsplash.com/photo-1548209394-ccb36b5952d7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fG1lbiUyMGZhc2hpb24lMjBiYXJiZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
      "name": "HTML and CSS",
      'subTitle': "Yesterday"
    },
    {
      "image": 'https://images.unsplash.com/photo-1634480789085-33416565117d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzB8fG1lbiUyMGZhc2hpb24lMjBiYXJiZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
      "name": "HTML and CSS",
      'subTitle': "Yesterday"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
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
                            'Reviews',
                            style: TextStyle(
                                fontSize: 50, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '45 persons were here',
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
                      child: Icon(Icons.arrow_back_ios),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 20),
                      child: Icon(Icons.edit),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          padding: EdgeInsets.only(
                              top: 10, right: 30, bottom: 50, left: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                title: Text(data[index]['name']),
                                leading: Container(
                                  width: 40,
                                  height: 40,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      data[index]['image'],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                subtitle: Container(
                                  padding: EdgeInsets.only(top: 8),
                                  child: Text(
                                    data[index]['subTitle'],
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    top: 10, right: 20, bottom: 10, left: 20),
                                child: Text(
                                  textAlign: TextAlign.justify,
                                  "I was A loking For A good hairstylist in jamber for four years, finnally i found daneil he is up to date with whats in style and knows how to cut your haorsbase don ots thickness",
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
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//
// Widget listview(
//     String title,
//     String url,
//     String subtitle,
//     String tratext,
//     ) {
//   return Container(
//     padding: EdgeInsets.all(10.0),
//     margin: EdgeInsets.only(right: 15.0, left: 15.0, bottom: 10.0, top: 10.0),
//     // color: Colors.green,
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(40.0),
//       color: Colors.grey.shade200,
//     ),
//     child: ListTile(
//       leading: ClipRRect(
//         borderRadius: BorderRadius.circular(20.0),
//         child: Image.network(url),
//       ),
//       title: Text(
//         title,
//         style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//             fontSize: 20.0,
//             fontFamily: "Mulish"),
//       ),
//       subtitle: Text(
//         subtitle,
//         style: TextStyle(
//           color: Colors.grey,
//           fontSize: 11.0,
//           fontFamily: "Mulish",
//         ),
//       ),
//       trailing: Column(
//         children: [
//           Text(
//             tratext,
//             style: TextStyle(
//                 color: Colors.grey,
//                 fontSize: 7.0,
//                 fontWeight: FontWeight.bold,
//                 fontFamily: "Mulish"),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Container(
//             padding: EdgeInsets.all(2.0),
//             decoration: BoxDecoration(
//               color: Colors.black,
//               borderRadius: BorderRadius.circular(20.0),
//             ),
//             child: Icon(
//               Icons.h_mobiledata,
//               color: Colors.white,
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
