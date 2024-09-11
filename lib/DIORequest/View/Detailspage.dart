import 'package:flutter/material.dart';

import '../Controller/APIController.dart';
import '../Model/APIModel.dart';

class Detailpage extends StatelessWidget {
  final String? category;
  Detailpage({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffB1A1BB),
      appBar: AppBar(
        backgroundColor: Color(0xff5B3712),
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: Text(
          '$category News',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: FutureBuilder<List<News>?>(
        future:
            APIHelper.apiHelper_http.fetchNewsByCategory(category ?? "general"),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            List<News>? data = snapshot.data;

            return data == null || data.isEmpty
                ? Center(child: Text("No news available."))
                : ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: const EdgeInsets.all(5),
                        child: Card(
                          color: Color(0xff5B3712),
                          child: ListTile(
                            title: Text(data[i].name ?? 'No name',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                )),
                            subtitle: Column(
                              children: [
                                Text(
                                  data[i].description ?? 'No description',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
          } else {
            return Center(child: Text("No data available."));
          }
        },
      ),
    );
  }
}
