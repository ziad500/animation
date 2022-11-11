import 'package:animation/screens/custonshape.dart';
import 'package:flutter/material.dart';
import 'package:animation/shared/screen_title.dart';
import 'package:animation/shared/item_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 190,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          flexibleSpace: ClipPath(
            clipper: CustomShape(),
            child: Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              color: Colors.red,
              child: const Center(child: ScreenTitle(text: 'Movies Star')),
            ),
          ),
        ),
        body: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Flexible(
                  child: ItemsList(),
                )
              ],
            )));
  }
}
