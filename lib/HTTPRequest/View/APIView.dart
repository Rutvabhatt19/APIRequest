import 'package:api_request/HTTPRequest/Controller/APIController.dart';
import 'package:api_request/HTTPRequest/View/Detailpage.dart';
import 'package:flutter/material.dart';

import '../Model/APIModel.dart';

class APIViewHTTP extends StatefulWidget {
  const APIViewHTTP({super.key});

  @override
  State<APIViewHTTP> createState() => _APIViewHTTPState();
}

class _APIViewHTTPState extends State<APIViewHTTP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2C2AE),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        backgroundColor: Color(0xff1B3B31),
        title: Text(
          'News Category',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder(
        future: APIHelper.apiHelper_http.featchAllNews(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Error : ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            List<News>? data = snapshot.data;
            Set<String?> uniqueCategories = {};
            if (data != null) {
              for (var newsItem in data) {
                uniqueCategories.add(newsItem.category);
              }

              List<String?> categoriesList = uniqueCategories.toList();

              return categoriesList.isEmpty
                  ? Center(
                      child: Text("No data availabel ..."),
                    )
                  : ListView.builder(
                      itemCount: categoriesList.length,
                      itemBuilder: (context, i) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  Detailpage(category: categoriesList[i]),
                            ));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Card(
                              color: Color(0xff1B3B31),
                              child: ListTile(
                                leading: Text(
                                  "${i + 1}",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                title: Text(
                                  "${categoriesList[i]}",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
            }
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
