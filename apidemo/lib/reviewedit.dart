import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ReviewEdit extends StatefulWidget {
  ReviewEdit({Key? key, this.map}) : super(key: key);

  Map? map;

  @override
  State<ReviewEdit> createState() => _ReviewEditState();
}

class _ReviewEditState extends State<ReviewEdit> {
  var formKey = GlobalKey<FormState>();

  TextEditingController discriptionController = TextEditingController();

  bool isLoading = false;
  String appbar = '';
  String buttonName = '';

  @override
  void initState() {
    discriptionController.text =
        widget.map == null ? '' : widget.map!["discription"];
    appbar = widget.map == null?'Add User':"Edit User";
    buttonName = widget.map == null?'Submit':"Edit";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appbar),
      ),
      body: Container(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: discriptionController,
                decoration: InputDecoration(hintText: "Enter The Discription"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter The Discription";
                  }
                },
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isLoading = true;
                  });
                  if (formKey.currentState!.validate()) {
                    if (widget.map == null) {
                      inserUser().then(
                        (value) {
                          Navigator.of(context).pop(true);
                        },
                      );
                    } else {
                      updateUser(widget.map!['id']).then(
                        (value) {
                          Navigator.of(context).pop(true);
                        },
                      );
                    }
                  }
                },
                child: Container(
                  width: 180,
                  height: 50,
                  padding:
                      EdgeInsets.only(top: 10, right: 50, bottom: 10, left: 50),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: isLoading
                        ? CircularProgressIndicator()
                        : Text(
                            buttonName,
                            style: TextStyle(color: Colors.white),
                          ),
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
    Map map = {};
    map["discription"] = discriptionController.text.toString();

    http.Response res = await http.post(
        Uri.parse('https://630dbce7b37c364eb70a47a8.mockapi.io/studentDetail'),
        body: map);
    print(res.body);
  }

  Future<void> updateUser(id) async {
    Map map = {};
    map["discription"] = discriptionController.text.toString();

    http.Response res = await http.put(
        Uri.parse(
            'https://630dbce7b37c364eb70a47a8.mockapi.io/studentDetail/$id'),
        body: map);
    print(res.body);
  }
}
