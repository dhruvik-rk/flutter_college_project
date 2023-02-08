import 'package:flutter/material.dart';

class DiscoverPage extends StatefulWidget {
  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  dynamic isFav = false;

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
                            'Discover',
                            style: TextStyle(
                                fontSize: 50, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Find the perfect Barberman',
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
                      child: Icon(Icons.menu),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        ProfileMaker("Danial William", "100", "2.3km",
                            'https://images.unsplash.com/photo-1578390432942-d323db577792?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bWVuJTIwZmFzaGlvbiUyMGJhcmJlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
                        ProfileMaker("Danial Sanoto", "200", "2.5km",
                            'https://images.unsplash.com/photo-1548209394-ccb36b5952d7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fG1lbiUyMGZhc2hpb24lMjBiYXJiZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'),
                        ProfileMaker(
                          "Brooklyn Simmons",
                          "150",
                          "2.8km",
                          'https://images.unsplash.com/photo-1634480789085-33416565117d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzB8fG1lbiUyMGZhc2hpb24lMjBiYXJiZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
                        ),
                        ProfileMaker("Dianne Russel", "1", "2km",
                            'https://plus.unsplash.com/premium_photo-1661583675536-286237c68e11?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDl8fG1lbiUyMGZhc2hpb24lMjBiYXJiZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 80,
                        ),
                        ProfileMaker("Cameron Williamson", "150", "2.5km",
                            'https://images.unsplash.com/photo-1599351431202-1e0f0137899a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8YmFyYmVyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'),
                        ProfileMaker("Danial William", "100", "2.3km",
                            'https://images.unsplash.com/photo-1605497787865-e6d4762b386f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGJhcmJlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
                        ProfileMaker("Danial Sanoto", "200", "2.5km",
                            'https://images.unsplash.com/photo-1635273051839-003bf06a8751?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fGJhcmJlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
                        ProfileMaker(
                          "Brooklyn Simmons",
                          "150",
                          "2.8km",
                          'https://images.unsplash.com/photo-1567894340315-735d7c361db0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGJhcmJlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
              // Container(
              //   height: MediaQuery.of(context).size.height,
              //   child: ListView.builder(
              //     padding: const EdgeInsets.all(8),
              //     itemCount: entries.length,
              //     itemBuilder: (BuildContext context, int index) {
              //       return Container(
              //         height: 50,
              //         color: Colors.amber[colorCodes[index]],
              //         child: Center(child: Text('Entry ${entries[index]}')),
              //       );
              //     }
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget ProfileMaker(name, price, location, image) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.black,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(image , fit: BoxFit.cover,),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isFav = !isFav;
                    });
                  },
                  child: Icon(isFav ? Icons.favorite : Icons.favorite_outline),
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
    );
  }
}
