import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class InsertData extends StatefulWidget {
  InsertData({Key? key , this.map}) : super(key: key);

  Map? map;

  @override
  State<InsertData> createState() => _InsertDataState();
}

class _InsertDataState extends State<InsertData> {

  var formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController distanceController = TextEditingController();

  bool isloading = false;

  @override
  void initState() {

    nameController.text = widget.map == null?'':widget.map!["name"];
    imageController.text = widget.map == null?'':widget.map!["avatar"];
    priceController.text = widget.map == null?'':widget.map!["price"];
    distanceController.text = widget.map == null?'':widget.map!["distance"];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Printer"),
      ),
      body: Container(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: "Enter Name"
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter Name";
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Enter Image"
                ),
                controller: imageController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter Image";
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Enter Price"
                ),
                controller: priceController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter Price";
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Enter Distance"
                ),
                controller: distanceController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter Distance";
                  }
                },
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isloading = true;
                  });
                  if(formKey.currentState!.validate()){
                    if(widget.map == null){
                      inserUser().then((value) {
                        Navigator.of(context).pop(true);
                      },);
                    }
                    else{
                      updateUser(widget.map!['id']).then((value) {
                        Navigator.of(context).pop(true);
                      },);
                    }
                  }
                },
                child: Container(
                  width: 180,
                  height: 50,
                  padding: EdgeInsets.only(top: 10 , right: 50 , bottom: 10 , left: 50),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: isloading?CircularProgressIndicator():Text('Submit', style: TextStyle(color: Colors.white),),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> inserUser() async {

    Map map= {};
    map["name"] = nameController.text.toString();
    map['avatar'] = imageController.text.toString();
    map['price'] = priceController.text.toString();
    map['distance'] = distanceController.text.toString();

    http.Response res = await http.post(Uri.parse('https://630dbce7b37c364eb70a47a8.mockapi.io/studentDetail'),body: map);
    print(res.body);
  }

  Future<void> updateUser(id) async {

    Map map= {};
    map["name"] = nameController.text.toString();
    map['avatar'] = imageController.text.toString();
    map['price'] = priceController.text.toString();
    map['distance'] = distanceController.text.toString();

    http.Response res = await http.put(Uri.parse('https://630dbce7b37c364eb70a47a8.mockapi.io/studentDetail/$id'),body: map);
    print(res.body);
  }

}
