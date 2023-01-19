import 'dart:io';

import 'package:flutter/material.dart';

import '../filter/filterList.dart';

class editImage extends StatefulWidget {
  const editImage({Key? key}) : super(key: key);

  @override
  State<editImage> createState() => _editImageState();
}

class _editImageState extends State<editImage> {
  final List<List<double>> filterList = [
    SEPIUM,
    SEPIA,
    GREYSCALE,
    VINTAGE,
    FILTER_1,
    FILTER_2,
    FILTER_3,
    FILTER_4,
    FILTER_5,
  ];

  late String items = 'Image';
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'Edit',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,

    );
  }
}

