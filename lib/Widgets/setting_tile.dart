import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nakliye_bilgi_sistemi/Global/Constants/_colors.dart';

TextStyle texttStyle() {
  return const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );
}

TextStyle texttStyleHead() {
  return const TextStyle(
    fontSize: 21,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
}

Padding settingsTile(
    String title, IconData iconData, bool value, Function onValueChanged) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      vertical: 8,
      horizontal: 10,
    ),
    child: Card(
      borderOnForeground: false,
      color: ANA_MENU_BUTONLAR_ICI,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        leading: Icon(
          iconData,
          color: Colors.black,
        ),
        title: Text(
          title,
          style: texttStyle(),
        ),
        trailing: CupertinoSwitch(
          value: value,
          activeColor: Colors.green,
          trackColor: Colors.grey,
          onChanged: (value) => onValueChanged(value),
        ),
      ),
    ),
  );
}
