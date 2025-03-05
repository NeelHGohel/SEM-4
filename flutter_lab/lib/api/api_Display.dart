import 'package:flutter/material.dart';

import 'api_addEditUserPage.dart';
import 'api_const.dart';
import 'api_service.dart';

class DiplayUserPage extends StatefulWidget {
  DiplayUserPage({super.key});

  @override
  State<DiplayUserPage> createState() => _DiplayUserPageState();
}

class _DiplayUserPageState extends State<DiplayUserPage> {
  ApiService api = ApiService();

  bool isApiCall = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome to API CRUD',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder(
        future: isApiCall ? api.getUsers(context) : null,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (isApiCall) {
              isApiCall = false;
            }
            if (snapshot.data != null && (snapshot.data is List)) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "Name : ${snapshot.data![index][NAME].toString()}",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  "City : ${snapshot.data![index][CITY].toString()}",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () async {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return AddEditUserPage(
                                      userMap: snapshot.data[index],
                                    );
                                  },
                                ),
                              ).then(
                                (value) {
                                  isApiCall = true;
                                  setState(() {});
                                },
                              );
                            },
                            icon: Icon(
                              Icons.edit,
                              color: Colors.blue,
                              size: 25,
                            ),
                          ),
                          IconButton(
                            onPressed: () async {
                              await api.deleteUser(
                                  id: snapshot.data[index][ID],
                                  context: context);
                              isApiCall = true;
                              setState(() {});
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                              size: 25,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                itemCount: snapshot.data!.length,
              );
            } else {
              return Center(
                child: Text(
                  snapshot.data.toString(),
                  style: TextStyle(fontSize: 30, color: Colors.grey),
                ),
              );
            }
          } else {
            return Center(
              child: Text(
                'No Data Found',
                style: TextStyle(fontSize: 30, color: Colors.grey),
              ),
            );
          }
        },
      ),
      floatingActionButton: Tooltip(
        message: 'Add New User',
        enableTapToDismiss: true,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => AddEditUserPage(),
              ),
            );
          },
          child: const Icon(Icons.add),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
