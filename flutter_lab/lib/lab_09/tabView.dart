import 'package:flutter/material.dart';
import 'package:flutter_lab/lab_09/about.dart';
import 'package:flutter_lab/lab_09/home.dart';

class Tabview extends StatelessWidget {
  const Tabview({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                text: "Home",
              ),
              Tab(
                text: "About",
              )
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Are you sure logout ?"),
                          actions: [
                            ElevatedButton(onPressed: () {
                              // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>));
                            }, child: Text("Ok")),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("Cancle"))
                          ],
                        );
                      });
                },
                icon: Icon(Icons.logout))
          ],
        ),
        body: TabBarView(children: [Home(), About()]),
        drawer: Drawer(
          child: Column(
            children: [
              DrawerHeader(
                  child: Image.network(
                      "https://static.vecteezy.com/system/resources/previews/012/667/615/non_2x/go-to-web-icon-for-your-web-design-logo-infographic-ui-vector.jpg")),
              ListTile(
                title: Text("Home"),
                leading: Icon(Icons.home),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Home()));
                },
              ),
              ListTile(
                title: Text("About"),
                leading: Icon(Icons.arrow_back),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => About()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
