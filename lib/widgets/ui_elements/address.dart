
import 'package:flutter/material.dart';

class AddressTag extends StatelessWidget {

  final String locationName;

  AddressTag(this.locationName);


  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(
              color: Colors.black, style: BorderStyle.solid, width: 1.0)),
      child: Text(locationName),
    );

  }
}