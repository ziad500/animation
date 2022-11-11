import 'package:flutter/material.dart';
import 'package:animation/models/item.dart';
import 'package:animation/shared/heart.dart';

class Details extends StatelessWidget {
  final Item item;
  const Details(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ClipRRect(
                child: Hero(
              tag: item.img.toString(),
              child: Image.asset(
                'images/${item.img}',
                height: 360,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            )),
            const SizedBox(height: 30),
            ListTile(
                title: Text(item.subTitle.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.grey[800])),
                subtitle: Text('${item.mainTitle} \$${item.price}',
                    style: const TextStyle(letterSpacing: 1)),
                trailing: Heart()),
            Padding(
                padding: const EdgeInsets.all(18),
                child: Text(
                    "The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from  by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham. Where can I get some? There are many variations of passages of Lorem Ipsum available, Start with 'Lorem ipsum dolor sit amet...'",
                    style: TextStyle(color: Colors.grey[600], height: 1.4))),
          ],
        ));
  }
}
