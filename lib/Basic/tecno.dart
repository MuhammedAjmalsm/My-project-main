import 'package:flutter/material.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  var data = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: Icon(Icons.menu), title: Text("Bcom")),
      body: Column(
        children: [
          TextFormField(controller: data),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => details(textdata: data.text),
                ),
              );
            },
            child: Text("enter"),
          ),
        ],
      ),
    );
  }
}

class details extends StatefulWidget {
  final String textdata;
  const details({super.key, required this.textdata});

  @override
  State<details> createState() => _detailsState();
}

class _detailsState extends State<details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text(widget.textdata));
  }
}
