import 'package:flutter/material.dart';


class Camera extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Camera'),
        centerTitle: true,
      ),
    );
  }
}
