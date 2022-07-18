/* import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nakliye_bilgi_sistemi/Global/Api/Links.dart';
import 'package:nakliye_bilgi_sistemi/not_used/category.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  Future<List<Category>> _getCategory() async {
    var response = await http.get(Uri.parse(CATEGORY_GET_LINK));

    var jsonData = jsonDecode(response.body);

    List<Category> categories = [];
    for (var c in jsonData) {
      Category category =
          Category(c["categoryId"], c["categoryName"], c["description"], null);

      categories.add(category);
    }
    return categories;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _getCategory(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                CircularProgressIndicator(),
                Text('Loading'),
              ],
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(snapshot.data[index].categoryName),
                  subtitle: Text(snapshot.data[index].description ?? ""),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailPage(snapshot.data[index])));
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final Category user;

  DetailPage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text(user.categoryName),
    ));
  }
}
 */