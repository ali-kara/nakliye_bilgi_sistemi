import 'package:flutter/material.dart';
import 'package:nakliye_bilgi_sistemi/Screens/barcode_scanner.dart';
import 'package:nakliye_bilgi_sistemi/Snippets/base_appbar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Card(
                    color: Colors.lightBlue,
                    child: ListTile(
                      leading: Icon(Icons.today_rounded),
                      title: Text('Hello'),
                      subtitle: Text('This is sub.'),
                    ),
                  ),
                  SizedBox(height: 10),
                  Divider(
                    thickness: 1,
                    color: Colors.blue,
                  ),
                  SizedBox(height: 10),
                  BarcodeInsert(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
