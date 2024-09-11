import 'package:api_request/DIORequest/View/APIView.dart';
import 'package:api_request/HTTPRequest/View/APIView.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple,
        title: Text(
          'APIRequest',
        ),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => APIViewHTTP(),));
              }, child: Text(
                'API Request With http Package'
              )),
              TextButton(onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => APIViewDIO(),));
              }, child: Text(
                  'API Request With dio Package'
              )),
            ],
          ),
        ),
      ),
    );
  }
}
