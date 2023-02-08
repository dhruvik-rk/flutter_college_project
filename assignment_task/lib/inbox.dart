import 'package:flutter/material.dart';

class InboxPage extends StatefulWidget {
  @override
  State<InboxPage> createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              //inbox layer
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
              //search layer
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
              SizedBox(
                height: 15,
              ),
              // Expanded(child: Container(color: Colors.lightGreen,)),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  width: 490,
                  height: 450,
                  // color: Colors.amber,
                  child: ListView(
                    children: [
                      listview(
                        "Daniel William",
                        "https://images.unsplash.com/photo-1578390432942-d323db577792?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bWVuJTIwZmFzaGlvbiUyMGJhcmJlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
                        "Let me come now if you...",
                        "3 min ago",
                      ),
                      listview(
                        "Augs Barber",
                        "https://images.unsplash.com/photo-1548209394-ccb36b5952d7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fG1lbiUyMGZhc2hpb24lMjBiYXJiZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
                        "yeah, i can halp you",
                        "09:05 Am",
                      ),
                      listview(
                        "Amdrew Raymond",
                        "https://images.unsplash.com/photo-1634480789085-33416565117d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzB8fG1lbiUyMGZhc2hpb24lMjBiYXJiZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
                        "Thank you Very much",
                        "Yesterday",
                      ),
                      listview(
                        "Peter Porter",
                        "https://plus.unsplash.com/premium_photo-1661583675536-286237c68e11?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDl8fG1lbiUyMGZhc2hpb24lMjBiYXJiZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
                        "Recomented thanks",
                        "Aug 10",
                      ),
                      listview(
                        "Daniel William",
                        "https://images.unsplash.com/photo-1578390432942-d323db577792?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bWVuJTIwZmFzaGlvbiUyMGJhcmJlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
                        "Let me come now if you...",
                        "3 min ago",
                      ),
                      listview(
                        "Augs barber",
                        "https://images.unsplash.com/photo-1548209394-ccb36b5952d7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fG1lbiUyMGZhc2hpb24lMjBiYXJiZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
                        "yeah, i can halp you",
                        "09:05 Am",
                      ),
                      listview(
                        "Amdrew Raymond",
                        "https://images.unsplash.com/photo-1634480789085-33416565117d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzB8fG1lbiUyMGZhc2hpb24lMjBiYXJiZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
                        "Thank you Very much",
                        "Yesterday",
                      ),
                      listview(
                        "Peter Porter",
                        "https://plus.unsplash.com/premium_photo-1661583675536-286237c68e11?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDl8fG1lbiUyMGZhc2hpb24lMjBiYXJiZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
                        "Recomented thanks",
                        "Aug 10",
                      ),
                    ],
                  ),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget listview(
  String title,
  String url,
  String subtitle,
  String tratext,
) {
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
          child: Image.network(url, fit: BoxFit.cover,),
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
            child: Center(child: Text("2" , style: TextStyle(color: Colors.white),),),
          ),
        ],
      ),
    ),
  );
}
